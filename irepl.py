#!/usr/bin/env python3
"""
IDEKA REPL (frepl.py)
Interactive read-eval-print loop powered by the IDEKA VM.

Copyright (C) 2026 Karac V. Thweatt
"""

import sys
import os
import types

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# Provide a minimal llvmlite stub so that iast.py / itypesys.py can be imported
# without a full LLVM installation.  The FVM codegen path never calls any LLVM
# IR methods, so a catch-all sentinel is sufficient.
try:
    import llvmlite  # noqa: F401
except ImportError:
    class _IrStubModule(types.ModuleType):
        """Stub for llvmlite.ir: returns a no-op sentinel for every attribute."""
        class _S:
            def __init__(self, *a, **kw): pass
            def __call__(self, *a, **kw): return type(self)()
            def __getattr__(self, n): return type(self)()
            def __class_getitem__(cls, i): return cls
        def __getattr__(self, name):
            return self._S

    _ir_stub       = _IrStubModule('llvmlite.ir')
    _llvmlite_stub = types.ModuleType('llvmlite')
    _llvmlite_stub.ir = _ir_stub
    sys.modules['llvmlite']                 = _llvmlite_stub
    sys.modules['llvmlite.ir']              = _ir_stub
    sys.modules['llvmlite.ir.instructions'] = types.ModuleType('llvmlite.ir.instructions')

from idkvm import IDEKAVM, Val, TTag, Op, VMError
from ivmcodegen import FVMCodegen, FVMCodegenError
from ilexer import IDEKALexer
from iparser import IDEKAParser
from ierrors import IDEKAParseError, ParseError
from iast import ComptimeBlock


# ---------------------------------------------------------------------------
# stdout column tracking
# ---------------------------------------------------------------------------
#
# compiler.io.console.print(...) (and other VM output) writes directly to
# sys.stdout and may not end with a newline.  Before the multi-line editor
# redraws the prompt it clears from the cursor to the end of the screen
# (\x1b[J), which would erase any such output that is still on the current
# line.  This wrapper tracks whether the cursor is at column 0 so the editor
# can emit a newline first when needed.

class _ColumnTrackingStdout:
    def __init__(self, real):
        self._real = real
        self.at_line_start = True

    def write(self, s):
        if s:
            self.at_line_start = s.endswith('\n')
        return self._real.write(s)

    def flush(self):
        return self._real.flush()

    def __getattr__(self, name):
        return getattr(self._real, name)


sys.stdout = _ColumnTrackingStdout(sys.stdout)


# ---------------------------------------------------------------------------
# Version / banner
# ---------------------------------------------------------------------------

_VERSION = '0.1.1'

_BANNER = f"""\
IDEKA REPL {_VERSION}  (FVM-powered)
Type IDEKA comptime code.  ENTER inserts a new line (indentation is carried
over from the previous line); press CTRL+ENTER to compile and run.
Type :help for commands, :quit to exit.
"""

_HELP = """\
Commands:
  :quit  :q        Exit the REPL
  :reset           Clear all session state (VM, variables, functions)
  :stack           Dump the current VM stack
  :locals          Dump last_locals (variables from the most recent block)
  :funcs           List comptime functions defined so far
  :help            Show this message

ENTER inserts a new line; CTRL+ENTER submits the input for compilation.
New lines are indented to match the previous line.
Any other input is treated as the body of a comptime block and executed.
Variables and functions defined in one input survive into the next.
"""


# ---------------------------------------------------------------------------
# Session state
# ---------------------------------------------------------------------------

class ReplSession:
    """Holds all mutable state for one REPL session."""

    def __init__(self):
        self.vm              = IDEKAVM()
        self.known_functions = {}   # name -> List[Instr], accumulated across inputs
        self.known_layouts   = {}   # struct name -> StructLayout
        self.captured_scope  = {}   # name -> Val, live variable bindings
        self._locals_map     = {}   # name -> slot, from most recent codegen
        self._emit_cursor    = 0    # index into vm.emit_results already shown

    def reset(self):
        self.__init__()


# ---------------------------------------------------------------------------
# Input collection
# ---------------------------------------------------------------------------
#
# The REPL uses a raw-terminal multi-line editor instead of repeated calls
# to input().  Submission is no longer triggered by a blank line; instead
# the user presses CTRL+ENTER to compile, which lets multi-line input
# contain blank lines freely (for spacing between statements, etc).
#
# Terminal behaviour notes:
#   - Plain ENTER is delivered as CR (0x0D).
#   - CTRL+ENTER is delivered as LF (0x0A) -- i.e. the same byte as CTRL+J.
#     This holds on POSIX terminals (xterm, gnome-terminal, etc) and on the
#     Windows console via msvcrt.  If a particular terminal does not forward
#     CTRL+ENTER as CTRL+J, pressing CTRL+J directly submits as well, since
#     it is the exact same byte.
#
# When ENTER is pressed, a newline is inserted and the new line is
# pre-filled with the indentation of the line just left -- but only if
# that line had non-whitespace content.  This way repeatedly pressing
# ENTER on blank lines keeps the current indentation instead of resetting
# it to nothing.

import platform

_IS_WINDOWS = platform.system() == 'Windows'

if _IS_WINDOWS:
    import msvcrt
    import ctypes
    from ctypes import wintypes

    # STD_OUTPUT_HANDLE is defined as -11, i.e. 0xFFFFFFF5 as an unsigned
    # 32-bit DWORD (the type GetStdHandle's argtype expects).
    _STD_OUTPUT_HANDLE = 0xFFFFFFF5

    class _COORD(ctypes.Structure):
        _fields_ = [('X', ctypes.c_short), ('Y', ctypes.c_short)]

    class _SMALL_RECT(ctypes.Structure):
        _fields_ = [('Left', ctypes.c_short), ('Top', ctypes.c_short),
                     ('Right', ctypes.c_short), ('Bottom', ctypes.c_short)]

    class _CONSOLE_SCREEN_BUFFER_INFO(ctypes.Structure):
        _fields_ = [('dwSize', _COORD),
                     ('dwCursorPosition', _COORD),
                     ('wAttributes', wintypes.WORD),
                     ('srWindow', _SMALL_RECT),
                     ('dwMaximumWindowSize', _COORD)]

    class _WinConsole:
        """
        Direct Win32 console API access for in-place redraw.  Used instead
        of ANSI/VT escape sequences, which are not reliably interpreted by
        every Windows console (e.g. the legacy cmd.exe host).
        """

        def __init__(self):
            kernel32 = ctypes.windll.kernel32

            # ctypes defaults every function's restype/argtypes to c_int,
            # which truncates 64-bit HANDLE values on 64-bit Windows.  Set
            # explicit prototypes so the handle and coordinate structs are
            # marshalled correctly.
            kernel32.GetStdHandle.restype  = wintypes.HANDLE
            kernel32.GetStdHandle.argtypes = [wintypes.DWORD]

            kernel32.GetConsoleScreenBufferInfo.restype  = wintypes.BOOL
            kernel32.GetConsoleScreenBufferInfo.argtypes = [
                wintypes.HANDLE, ctypes.POINTER(_CONSOLE_SCREEN_BUFFER_INFO)
            ]

            kernel32.SetConsoleCursorPosition.restype  = wintypes.BOOL
            kernel32.SetConsoleCursorPosition.argtypes = [wintypes.HANDLE, _COORD]

            kernel32.FillConsoleOutputCharacterW.restype  = wintypes.BOOL
            kernel32.FillConsoleOutputCharacterW.argtypes = [
                wintypes.HANDLE, ctypes.c_wchar, wintypes.DWORD, _COORD,
                ctypes.POINTER(wintypes.DWORD)
            ]

            self._kernel32 = kernel32
            self._handle   = kernel32.GetStdHandle(_STD_OUTPUT_HANDLE)

        def _info(self) -> _CONSOLE_SCREEN_BUFFER_INFO:
            info = _CONSOLE_SCREEN_BUFFER_INFO()
            self._kernel32.GetConsoleScreenBufferInfo(self._handle, ctypes.byref(info))
            return info

        def get_cursor_pos(self):
            info = self._info()
            return info.dwCursorPosition.X, info.dwCursorPosition.Y

        def get_buffer_width(self) -> int:
            return self._info().dwSize.X

        def get_buffer_height(self) -> int:
            return self._info().dwSize.Y

        def get_window_rect(self):
            info = self._info()
            return info.srWindow.Top, info.srWindow.Bottom

        def set_cursor_pos(self, x: int, y: int):
            self._kernel32.SetConsoleCursorPosition(self._handle, _COORD(x, y))

        def clear_lines(self, x: int, y: int, width: int, num_lines: int):
            """Fill `num_lines` lines (full width) starting at (x, y) with spaces."""
            written = wintypes.DWORD(0)
            count = width * num_lines
            self._kernel32.FillConsoleOutputCharacterW(
                self._handle, ctypes.c_wchar(' '), count, _COORD(x, y), ctypes.byref(written)
            )

    _win_console = _WinConsole()

    def _enable_windows_vt_mode():
        # No-op: rendering on Windows uses direct console API calls instead
        # of VT escape sequences.
        pass
else:
    import termios
    import tty

    def _enable_windows_vt_mode():
        pass


_CTRL_C = '\x03'
_CTRL_D = '\x04'
_ENTER  = '\r'
_SUBMIT = '\n'   # CTRL+ENTER / CTRL+J
_BACKSPACE_CHARS = ('\x7f', '\x08')

# When set, the multi-line editor's Windows render path logs cursor/window
# coordinates for each render to this file, to help diagnose console
# scrolling/redraw issues.
_REPL_DEBUG_LOG = os.environ.get('FREPL_DEBUG_LOG')


def _debug_log(msg: str):
    if not _REPL_DEBUG_LOG:
        return
    try:
        with open(_REPL_DEBUG_LOG, 'a', encoding='utf-8') as f:
            f.write(msg + '\n')
    except OSError:
        pass

# Arrow-key sentinels returned by _read_key(); normalized across platforms.
_KEY_UP    = 'KEY_UP'
_KEY_DOWN  = 'KEY_DOWN'
_KEY_LEFT  = 'KEY_LEFT'
_KEY_RIGHT = 'KEY_RIGHT'


def _read_key() -> str:
    """
    Read one logical keypress and return it as a single character, or as
    one of the _KEY_* sentinels for arrow keys.  Blocks until a key is
    available.
    """
    if _IS_WINDOWS:
        ch = msvcrt.getwch()
        if ch in ('\x00', '\xe0'):
            # Extended key: a second call gives the actual scan code.
            code = msvcrt.getwch()
            return {
                'H': _KEY_UP,
                'P': _KEY_DOWN,
                'K': _KEY_LEFT,
                'M': _KEY_RIGHT,
            }.get(code, '')
        return ch
    else:
        ch = sys.stdin.read(1)
        if ch == '\x1b':
            # Escape sequence -- arrow keys are ESC [ A/B/C/D
            seq = sys.stdin.read(1)
            if seq == '[':
                code = sys.stdin.read(1)
                return {
                    'A': _KEY_UP,
                    'B': _KEY_DOWN,
                    'C': _KEY_RIGHT,
                    'D': _KEY_LEFT,
                }.get(code, '')
            return ''
        return ch


def _leading_whitespace(line: str) -> str:
    i = 0
    while i < len(line) and line[i] in (' ', '\t'):
        i += 1
    return line[:i]


class _MultilineEditor:
    """
    A minimal raw-mode multi-line text editor for the REPL prompt.

    Lines are stored as a list of strings.  The cursor is tracked as
    (row, col).  Supports:
      - printable character insertion
      - ENTER: split line, auto-indent the new line
      - CTRL+ENTER: submit the buffer
      - BACKSPACE: delete char before cursor (joins lines at col 0)
      - arrow keys: move cursor within the buffer
      - CTRL+C: raise KeyboardInterrupt
      - CTRL+D: raise EOFError (only when buffer is empty)
    """

    def __init__(self, prompt: str, continuation: str):
        self.prompt       = prompt
        self.continuation = continuation
        self.lines        = ['']
        self.row          = 0
        self.col          = 0
        # Indentation carried forward across blank lines.
        self.last_indent  = ''
        self._first_render = True
        # Windows-only state: console-buffer coordinates of the prompt's
        # first character, and how many lines were drawn last time (for
        # clearing before redraw).
        self._win_origin         = None
        self._win_prev_line_count = 0

    # -- rendering -----------------------------------------------------

    def _render(self):
        if _IS_WINDOWS:
            self._render_windows()
        else:
            self._render_ansi()

    def _render_ansi(self):
        out = []
        if self._first_render:
            self._first_render = False
            # If the cursor is mid-line (e.g. the last command printed
            # output without a trailing newline), move to a fresh line
            # before drawing the prompt so that output is not erased by
            # the clear-to-end-of-screen below.
            if not getattr(sys.stdout, 'at_line_start', True):
                out.append('\r\n')
        out.append('\r')
        out.append('\x1b[J')  # clear from cursor to end of screen
        for i, line in enumerate(self.lines):
            prefix = self.prompt if i == 0 else self.continuation
            out.append(prefix + line)
            if i != len(self.lines) - 1:
                out.append('\r\n')
        # Reposition cursor to (self.row, self.col)
        lines_below = (len(self.lines) - 1) - self.row
        if lines_below > 0:
            out.append(f'\x1b[{lines_below}A')
        prefix_len = len(self.prompt) if self.row == 0 else len(self.continuation)
        out.append('\r')
        target_col = prefix_len + self.col
        if target_col > 0:
            out.append(f'\x1b[{target_col}C')
        sys.stdout.write(''.join(out))
        sys.stdout.flush()

    def _render_windows(self):
        sys.stdout.flush()
        width = max(1, _win_console.get_buffer_width())

        def rows_for(text_len: int) -> int:
            # A line of text_len characters occupies ceil(text_len / width)
            # screen rows, with a minimum of 1 (an empty line still takes
            # one row).
            if text_len == 0:
                return 1
            return (text_len + width - 1) // width

        if self._first_render:
            self._first_render = False
            if not getattr(sys.stdout, 'at_line_start', True):
                sys.stdout.write('\r\n')
                sys.stdout.flush()
            x, y = _win_console.get_cursor_pos()
            self._win_origin = (x, y)
            win_top, win_bottom = _win_console.get_window_rect()
            _debug_log(f'[first_render] origin=({x},{y}) window=({win_top},{win_bottom}) '
                       f'buffer_height={_win_console.get_buffer_height()} width={width}')

        origin_x, origin_y = self._win_origin

        # Build the full text for each buffer line (prompt/continuation
        # prefix included) and compute how many screen rows each occupies.
        full_lines = []
        for i, line in enumerate(self.lines):
            prefix = self.prompt if i == 0 else self.continuation
            full_lines.append(prefix + line)

        line_row_counts = [rows_for(len(t)) for t in full_lines]
        total_rows = sum(line_row_counts)

        _debug_log(f'[before] origin=({origin_x},{origin_y}) total_rows={total_rows} '
                   f'prev_lines={self._win_prev_line_count} num_buf_lines={len(self.lines)} '
                   f'row={self.row} col={self.col}')

        # Clear the region previously occupied by the editor, starting at
        # the recorded origin.
        if self._win_prev_line_count > 0:
            _win_console.set_cursor_pos(origin_x, origin_y)
            _win_console.clear_lines(0, origin_y, width, self._win_prev_line_count)

        _win_console.set_cursor_pos(origin_x, origin_y)

        for i, text in enumerate(full_lines):
            sys.stdout.write(text)
            if i != len(full_lines) - 1:
                sys.stdout.write('\r\n')
        sys.stdout.flush()

        # Writing the lines above may have caused the console to scroll
        # (if the content reached the bottom of the visible window), which
        # shifts every absolute row coordinate -- including origin_y --
        # without us being told.  Re-derive origin_y from the cursor
        # position the console actually ended up at after the write,
        # which reflects any such scroll.
        end_x, end_y = _win_console.get_cursor_pos()
        new_origin_y = end_y - (total_rows - 1)
        if new_origin_y < 0:
            new_origin_y = 0

        win_top, win_bottom = _win_console.get_window_rect()
        _debug_log(f'[after]  end=({end_x},{end_y}) new_origin_y={new_origin_y} '
                   f'window=({win_top},{win_bottom})')

        origin_y = new_origin_y
        self._win_origin = (origin_x, origin_y)

        self._win_prev_line_count = total_rows

        # Compute target cursor position for (self.row, self.col).
        target_row = origin_y
        for i in range(self.row):
            target_row += line_row_counts[i]

        prefix_len = len(self.prompt) if self.row == 0 else len(self.continuation)
        start_col  = (origin_x + prefix_len) if self.row == 0 else prefix_len
        abs_pos    = start_col + self.col
        target_row += abs_pos // width
        target_col  = abs_pos % width

        _debug_log(f'[target] target=({target_col},{target_row})')

        _win_console.set_cursor_pos(target_col, target_row)

    # -- editing ops -----------------------------------------------------

    def insert_char(self, ch: str):
        line = self.lines[self.row]
        self.lines[self.row] = line[:self.col] + ch + line[self.col:]
        self.col += 1

    def enter(self):
        cur    = self.lines[self.row]
        before = cur[:self.col]
        after  = cur[self.col:]

        if before.strip():
            self.last_indent = _leading_whitespace(before)
        # else: line being left was blank/whitespace-only -> keep last_indent

        if after == '':
            new_line = self.last_indent
        else:
            new_line = self.last_indent + after

        self.lines[self.row] = before
        self.lines.insert(self.row + 1, new_line)
        self.row += 1
        self.col = len(self.last_indent)

    def backspace(self):
        if self.col > 0:
            line = self.lines[self.row]
            self.lines[self.row] = line[:self.col - 1] + line[self.col:]
            self.col -= 1
        elif self.row > 0:
            prev = self.lines[self.row - 1]
            cur  = self.lines[self.row]
            self.col = len(prev)
            self.lines[self.row - 1] = prev + cur
            del self.lines[self.row]
            self.row -= 1

    def move_left(self):
        if self.col > 0:
            self.col -= 1
        elif self.row > 0:
            self.row -= 1
            self.col = len(self.lines[self.row])

    def move_right(self):
        if self.col < len(self.lines[self.row]):
            self.col += 1
        elif self.row < len(self.lines) - 1:
            self.row += 1
            self.col = 0

    def move_up(self):
        if self.row > 0:
            self.row -= 1
            self.col = min(self.col, len(self.lines[self.row]))

    def move_down(self):
        if self.row < len(self.lines) - 1:
            self.row += 1
            self.col = min(self.col, len(self.lines[self.row]))

    # -- main loop -----------------------------------------------------

    def _process_key(self, key: str) -> bool:
        """
        Handle one key (or _KEY_* sentinel).  Returns True if the input
        should be submitted (CTRL+ENTER pressed).
        """
        if key == _CTRL_C:
            raise KeyboardInterrupt

        if key == _CTRL_D:
            if len(self.lines) == 1 and self.lines[0] == '':
                raise EOFError
            # ignore CTRL+D mid-input
            return False

        if key == _SUBMIT:
            return True

        if key == _ENTER:
            self.enter()
            self._render()
            return False

        if key in _BACKSPACE_CHARS:
            self.backspace()
            self._render()
            return False

        if key == _KEY_UP:
            self.move_up()
            self._render()
            return False
        if key == _KEY_DOWN:
            self.move_down()
            self._render()
            return False
        if key == _KEY_LEFT:
            self.move_left()
            self._render()
            return False
        if key == _KEY_RIGHT:
            self.move_right()
            self._render()
            return False

        if len(key) == 1 and key.isprintable():
            self.insert_char(key)
            self._render()
            return False

        # ignore other control characters / unrecognized sequences
        return False

    def run(self) -> str:
        if _IS_WINDOWS:
            self._render()
            while True:
                key = _read_key()
                if self._process_key(key):
                    break
            sys.stdout.write('\r\n')
            sys.stdout.flush()
        else:
            fd = sys.stdin.fileno()
            old_settings = termios.tcgetattr(fd)
            try:
                tty.setraw(fd)
                self._render()
                while True:
                    key = _read_key()
                    if self._process_key(key):
                        break
            finally:
                termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
                sys.stdout.write('\r\n')
                sys.stdout.flush()

        return '\n'.join(self.lines)


def read_multiline_input(prompt: str = 'fx> ', continuation: str = '... ') -> str:
    """
    Read a (possibly multi-line) input from the user.  ENTER inserts a
    newline (auto-indented to match the previous line); CTRL+ENTER submits
    the whole buffer for compilation.
    """
    editor = _MultilineEditor(prompt, continuation)
    return editor.run()


# ---------------------------------------------------------------------------
# Parse helpers
# ---------------------------------------------------------------------------

def _wrap_comptime(source: str) -> str:
    """Wrap bare user input in a comptime { ... }; block."""
    return f'comptime\n{{\n{source}\n}};'


def _parse_comptime_blocks(source: str):
    """
    Lex and parse source, return all ComptimeBlock nodes found.
    Raises IDEKAParseError / ParseError on failure.
    """
    lexer   = IDEKALexer(source)
    tokens  = lexer.tokenize()
    parser  = IDEKAParser(tokens)
    program = parser.parse()
    blocks  = [s for s in program.statements if isinstance(s, ComptimeBlock)]
    return blocks


# ---------------------------------------------------------------------------
# Execution
# ---------------------------------------------------------------------------

def _run_block(session: ReplSession, block: ComptimeBlock):
    """
    Compile and execute one ComptimeBlock against the session.
    Returns the top-of-stack Val after execution, or None.
    Raises FVMCodegenError or VMError on failure.
    """
    cg = FVMCodegen(
        known_functions=dict(session.known_functions),
        known_struct_layouts=dict(session.known_layouts),
    )
    bc = cg.compile(block, captured_scope=dict(session.captured_scope))

    # Register every function the codegen produced before executing
    for name, instrs in cg.compiled_functions.items():
        session.vm.register_function(name, instrs)
    session.known_functions.update(cg.compiled_functions)

    # Accumulate any new struct layouts
    session.known_layouts.update(cg._struct_layouts)
    session.vm.struct_layouts.update(cg._struct_layouts)

    result = session.vm.execute(bc.instructions, bc.local_count)

    # The VM stack is not cleared between top-level execute() calls, so any
    # value left behind by this block (e.g. a trailing expression-statement
    # result) would otherwise still be on top of the stack for the *next*
    # submission, causing _print_result to keep reporting it.  Capture the
    # result above, then clear the stack so each submission starts clean.
    session.vm.stack.clear()

    # Capture live variables into the persistent scope using the codegen's locals map
    for name, slot in cg._locals.items():
        if slot < len(session.vm.last_locals) and session.vm.last_locals[slot] is not None:
            session.captured_scope[name] = session.vm.last_locals[slot]

    session._locals_map = dict(cg._locals)
    return result


# ---------------------------------------------------------------------------
# Output helpers
# ---------------------------------------------------------------------------

def _val_repr(v: Val) -> str:
    if v is None:
        return 'void'
    if v.tag == TTag.BOOL:
        return 'true' if v.data else 'false'
    if v.tag == TTag.BYTES and isinstance(v.data, (bytes, bytearray)):
        try:
            return repr(v.data.decode('utf-8'))
        except Exception:
            return repr(v.data)
    if v.tag == TTag.PTR:
        struct_type = v.meta.get('struct_type')
        if struct_type:
            return f'<{struct_type} @ 0x{v.data:x}>'
        elem_type = v.meta.get('elem_type')
        count     = v.meta.get('count')
        if elem_type and count is not None:
            return f'<array[{elem_type}; {count}] @ 0x{v.data:x}>'
        return f'<ptr 0x{v.data:x}>'
    if v.tag in (TTag.FLOAT, TTag.DOUBLE):
        return repr(float(v.data))
    return str(v.data)


def _print_result(v: Val):
    if v is None or v.tag == TTag.VOID:
        return
    print(f'=> {_val_repr(v)} : {v.tag.value}')


def _print_new_emissions(session: ReplSession):
    results = session.vm.emit_results
    while session._emit_cursor < len(results):
        entry = results[session._emit_cursor]
        kind  = entry[0]
        if kind == 'const':
            _, val = entry
            print(f'[emit:const]  {_val_repr(val)} : {val.tag.value}')
        elif kind == 'global':
            _, data, meta = entry
            print(f'[emit:global] {data.hex()}  meta={meta}')
        elif kind == 'type':
            _, val = entry
            label = val.data.decode() if isinstance(val.data, (bytes, bytearray)) else str(val.data)
            print(f'[emit:type]   {label}')
        elif kind == 'IDEKA':
            _, text = entry
            print(f'[emit:IDEKA]   {text}')
        else:
            print(f'[emit:{kind}]  {entry[1:]}')
        session._emit_cursor += 1


# ---------------------------------------------------------------------------
# Command handlers
# ---------------------------------------------------------------------------

def _cmd_stack(session: ReplSession):
    if not session.vm.stack:
        print('(stack is empty)')
        return
    for i, v in enumerate(session.vm.stack):
        print(f'  [{i}]  {_val_repr(v)} : {v.tag.value}')


def _cmd_locals(session: ReplSession):
    if not session.captured_scope:
        print('(no variables in scope)')
        return
    for name, val in sorted(session.captured_scope.items()):
        print(f'  {name} = {_val_repr(val)} : {val.tag.value}')


def _cmd_funcs(session: ReplSession):
    if not session.known_functions:
        print('(no comptime functions defined)')
        return
    for name in sorted(session.known_functions):
        n = len(session.known_functions[name])
        print(f'  {name}  ({n} instructions)')


# ---------------------------------------------------------------------------
# Main REPL loop
# ---------------------------------------------------------------------------

def repl():
    _enable_windows_vt_mode()
    print(_BANNER)
    session = ReplSession()

    while True:
        # --- read input (multi-line editor, CTRL+ENTER to submit) ---
        try:
            source = read_multiline_input('fx> ', '... ')
        except (EOFError, KeyboardInterrupt):
            print()
            break

        stripped = source.strip()
        if not stripped:
            continue

        # --- built-in commands (only when the whole input is one command) ---
        if stripped in (':quit', ':q'):
            break
        if stripped == ':reset':
            session.reset()
            print('Session reset.')
            continue
        if stripped == ':help':
            print(_HELP)
            continue
        if stripped == ':stack':
            _cmd_stack(session)
            continue
        if stripped == ':locals':
            _cmd_locals(session)
            continue
        if stripped == ':funcs':
            _cmd_funcs(session)
            continue
        # --- wrap and parse ---
        wrapped = _wrap_comptime(source)
        try:
            blocks = _parse_comptime_blocks(wrapped)
        except (IDEKAParseError, ParseError) as e:
            print(f'Parse error: {e}')
            continue
        except Exception as e:
            print(f'Parse error: {e}')
            continue

        if not blocks:
            print('(nothing to execute)')
            continue

        # --- execute each block ---
        for block in blocks:
            try:
                result = _run_block(session, block)
            except FVMCodegenError as e:
                print(f'Codegen error: {e}')
                break
            except VMError as e:
                print(f'VM error: {e}')
                break
            except Exception as e:
                print(f'Error: {e}')
                break
            else:
                _print_new_emissions(session)
                _print_result(result)

    print('Goodbye.')


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

if __name__ == '__main__':
    repl()