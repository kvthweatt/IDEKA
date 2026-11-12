#!/usr/bin/env python3
"""
IDEKA IDE -- iide.py

A Sublime/Notepad++ style editor for the IDEKA programming language.

Features:
  - Tabbed multi-file editing
  - Syntax highlighting (lexer-driven + LSP semantic tokens)
  - Full LSP integration (diagnostics, hover, completion, go-to-def,
    signature help, inlay hints, find references, rename, document symbols)
  - Hover tooltip with symbol info + Effect Geometry / Template Geometry
    visualizer launch buttons (eg.py / tg.py as floating child windows)
  - Line numbers, minimap gutter, bracket matching
  - Dark theme matching the visualizers

Usage:
    python iide.py [file ...]
    python iide.py --lsp /path/to/flsp.py [file ...]

Environment:
    IDEKA_SRCDIR   Path to IDEKA compiler source (passed to LSP server)
"""

import sys
import os
import json
import subprocess
import threading
import time
import re
import argparse
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from PyQt6.QtCore import (
    Qt, QTimer, QThread, pyqtSignal, QPoint, QRect, QSize,
    QProcess, QProcessEnvironment,
)
from PyQt6.QtGui import (
    QColor, QFont, QFontMetrics, QPainter, QSyntaxHighlighter,
    QTextCharFormat, QTextCursor, QTextDocument, QPalette,
    QKeySequence, QAction, QIcon, QPixmap, QImage,
)
from PyQt6.QtWidgets import (
    QApplication, QMainWindow, QTabWidget, QPlainTextEdit,
    QWidget, QVBoxLayout, QHBoxLayout, QLabel, QPushButton,
    QFileDialog, QMessageBox, QFrame, QSplitter, QTreeWidget,
    QTreeWidgetItem, QStatusBar, QToolBar, QMenu, QSizePolicy,
    QScrollBar, QTextEdit, QCheckBox,
)

# ---------------------------------------------------------------------------
# Theme
# ---------------------------------------------------------------------------

THEME = {
    'bg':           '#1a1a1c',
    'bg_panel':     '#161618',
    'bg_editor':    '#1e1e21',
    'bg_line_num':  '#18181a',
    'bg_hover':     '#252530',
    'bg_sel':       '#2d4a7a',
    'bg_current':   '#252528',
    'fg':           '#d4d4d4',
    'fg_dim':       '#6a6a6a',
    'fg_keyword':   '#569cd6',
    'fg_type':      '#4ec9b0',
    'fg_string':    '#ce9178',
    'fg_comment':   '#6a9955',
    'fg_number':    '#b5cea8',
    'fg_operator':  '#f44747',
    'fg_qualifier': '#f44747',
    'fg_tag':       '#f44747',
    'fg_function':  '#dcdcaa',
    'fg_macro':     '#c586c0',
    'fg_preproc':   '#c586c0',
    'fg_effect':    '#9cdcfe',
    'fg_label':     '#4fc1ff',
    'border':       '#333336',
    'accent':       '#0e7fd4',
    'accent_hover': '#1a8fe0',
    'error':        '#f44747',
    'warning':      '#cca700',
    'info':         '#4fc1ff',
    'btn_eg':       '#7c4dff',
    'btn_tg':       '#00bcd4',
}

# ---------------------------------------------------------------------------
# IDEKA keywords and types (for lexer-driven highlighting)
# These mirror the ilexer.py token categories.
# ---------------------------------------------------------------------------

_KW = {
    'and', 'as', 'asm', 'assert', 'break', 'case', 'catch',
    'cdecl', 'comptime', 'constraint', 'continue', 'contract',
    'data', 'def', 'default', 'defer', 'do',
    'elif', 'else', 'emitideka', 'enum', 'escape', 'export', 'extern',
    'false', 'for', 'from', 'heap', 'if', 'in', 'interface', 'is',
    'loop', 'macro', 'match', 'namespace', 'not', 'null',
    'object', 'or', 'return', 'sizeof', 'alignof',
    'endianof', 'typeof', 'struct', 'throw', 'trait', 'true', 'try',
    'union', 'using', 'void', 'while', 'xor',
}

# Storage modifiers and type qualifiers -- red
_QUALIFIERS = {
    'const', 'volatile', 'inline', 'static', 'register',
    'auto', 'noreturn', 'pure', 'singinit', 'deprecate',
}

# Tag names that follow # -- red, along with the # itself
_TAGS = {
    'effect', 'attenuate', 'deprecate', 'contract', 'pure',
    'require', 'inline', 'noinline', 'noreturn', 'cold', 'hot',
    'import', 'def', 'ifdef', 'ifndef', 'endif', 'psub',
}

_TYPES = {
    'bool', 'byte', 'char', 'double', 'float', 'int', 'long', 'short',
    'uint', 'ulong', 'ushort', 'ubyte', 'i8', 'i16', 'i32', 'i64',
    'u8', 'u16', 'u32', 'u64', 'f32', 'f64', 'string',
}

_BUILTIN_EFFECTS = {
    'IO', 'Alloc', 'Unsafe', 'Mem', 'Sync', 'Crypto',
    'Process', 'Hook', 'Privilege', 'Time', 'Pure', 'Throw',
}

# ---------------------------------------------------------------------------
# Syntax highlighter
# ---------------------------------------------------------------------------

class IDEKAHighlighter(QSyntaxHighlighter):
    def __init__(self, document):
        super().__init__(document)
        self._rules: List[Tuple[re.Pattern, QTextCharFormat]] = []
        self._build_rules()

    def _fmt(self, color: str, bold=False, italic=False) -> QTextCharFormat:
        fmt = QTextCharFormat()
        fmt.setForeground(QColor(color))
        if bold:
            fmt.setFontWeight(QFont.Weight.Bold)
        if italic:
            fmt.setFontItalic(True)
        return fmt

    def _build_rules(self):
        add = self._rules.append

        # Comments
        add((re.compile(r'//[^\n]*'), self._fmt(THEME['fg_comment'], italic=True)))

        # Strings and chars
        add((re.compile(r'"(?:[^"\\]|\\.)*"'), self._fmt(THEME['fg_string'])))
        add((re.compile(r"'(?:[^'\\]|\\.)*'"), self._fmt(THEME['fg_string'])))
        add((re.compile(r'`[^`]*`'), self._fmt(THEME['fg_string'])))

        # Numbers
        add((re.compile(r'\b0x[0-9a-fA-F]+\b'), self._fmt(THEME['fg_number'])))
        add((re.compile(r'\b\d+(\.\d+)?([eE][+-]?\d+)?\b'), self._fmt(THEME['fg_number'])))

        # Tags: # followed by a tag name -- whole thing red
        tag_names = '|'.join(sorted(_TAGS, key=len, reverse=True))
        add((re.compile(r'#\s*(?:' + tag_names + r')\b'),
             self._fmt(THEME['fg_tag'], bold=True)))

        # Remaining preprocessor directives (not tag names) -- purple
        add((re.compile(r'#\w+'), self._fmt(THEME['fg_preproc'], bold=True)))

        # Effect names (built-in hierarchy roots and their children)
        add((re.compile(r'\b(?:' + '|'.join(sorted(_BUILTIN_EFFECTS, key=len, reverse=True)) + r')(?:\.\w+)*\b'),
             self._fmt(THEME['fg_effect'], bold=True)))

        # Storage modifiers / type qualifiers -- red
        qual_pattern = r'\b(?:' + '|'.join(sorted(_QUALIFIERS, key=len, reverse=True)) + r')\b'
        add((re.compile(qual_pattern), self._fmt(THEME['fg_qualifier'], bold=True)))

        # Keywords
        kw_pattern = r'\b(?:' + '|'.join(sorted(_KW, key=len, reverse=True)) + r')\b'
        add((re.compile(kw_pattern), self._fmt(THEME['fg_keyword'], bold=True)))

        # Types
        ty_pattern = r'\b(?:' + '|'.join(sorted(_TYPES, key=len, reverse=True)) + r')\b'
        add((re.compile(ty_pattern), self._fmt(THEME['fg_type'])))

        # Function calls (identifier followed by open paren)
        add((re.compile(r'\b([a-zA-Z_]\w*)\s*(?=\()'), self._fmt(THEME['fg_function'])))

        # Macro invocations (all-caps identifiers)
        add((re.compile(r'\b[A-Z_][A-Z0-9_]{2,}\b'), self._fmt(THEME['fg_macro'])))

        # Operators -- all symbolic tokens, longest match first
        add((re.compile(
            r'->|=>|<->|\.\.\.|\.\.|\^|'
            r'!@|!~=|!\`<=|!\`>=|!\`<|!\`>|!-=|'
            r'\^|==|!=|<=|>=|<<|>>|&&|\|\||'
            r'[+\-*/%&|^~<>=!:;,.()\[\]{}@]'
        ), self._fmt(THEME['fg_operator'])))

        # Tag rule last so it overwrites both preproc and keyword matches
        add((re.compile(r'#\s*(?:' + tag_names + r')\b'),
             self._fmt(THEME['fg_tag'], bold=True)))

    def highlightBlock(self, text: str):
        for pattern, fmt in self._rules:
            for m in pattern.finditer(text):
                self.setFormat(m.start(), m.end() - m.start(), fmt)

    def apply_semantic_tokens(self, tokens: list, document: QTextDocument):
        """Apply LSP semantic tokens on top of lexer highlighting."""
        _sem_colors = {
            'function':  THEME['fg_function'],
            'method':    THEME['fg_function'],
            'macro':     THEME['fg_macro'],
            'type':      THEME['fg_type'],
            'class':     THEME['fg_type'],
            'struct':    THEME['fg_type'],
            'enum':      THEME['fg_type'],
            'namespace': THEME['fg_label'],
            'variable':  THEME['fg'],
            'parameter': THEME['fg'],
            'keyword':   THEME['fg_keyword'],
        }
        cursor = QTextCursor(document)
        for tok_type, line, col, length in tokens:
            color = _sem_colors.get(tok_type)
            if not color:
                continue
            block = document.findBlockByLineNumber(line)
            if not block.isValid():
                continue
            pos = block.position() + col
            cursor.setPosition(pos)
            cursor.setPosition(pos + length, QTextCursor.MoveMode.KeepAnchor)
            fmt = QTextCharFormat()
            fmt.setForeground(QColor(color))
            cursor.setCharFormat(fmt)


# ---------------------------------------------------------------------------
# Line number gutter
# ---------------------------------------------------------------------------

class LineNumberGutter(QWidget):
    def __init__(self, editor):
        super().__init__(editor)
        self._editor = editor
        self.setFont(editor.font())

    def sizeHint(self) -> QSize:
        return QSize(self._editor._gutter_width(), 0)

    def paintEvent(self, event):
        self._editor._paint_gutter(event, self)


# ---------------------------------------------------------------------------
# Code editor widget
# ---------------------------------------------------------------------------

class IDEKACodeEdit(QPlainTextEdit):
    hover_requested = pyqtSignal(int, int, QPoint)   # line, col, global_pos
    definition_requested = pyqtSignal(int, int)       # line, col
    references_requested = pyqtSignal(int, int)

    def __init__(self, parent=None):
        super().__init__(parent)
        self._setup_appearance()
        self._gutter = LineNumberGutter(self)
        self._highlighter = IDEKAHighlighter(self.document())

        self._hover_timer = QTimer(self)
        self._hover_timer.setSingleShot(True)
        self._hover_timer.timeout.connect(self._on_hover_timer)
        self._hover_pos: Optional[QPoint] = None
        self._hover_cursor_pos: Optional[Tuple[int, int]] = None

        self.blockCountChanged.connect(self._update_gutter_width)
        self.updateRequest.connect(self._update_gutter)
        self.cursorPositionChanged.connect(self._highlight_current_line)
        self._update_gutter_width(0)

        self.setMouseTracking(True)

        # diagnostics: list of (line0, col0, line1, col1, severity, message)
        self._diagnostics: List[tuple] = []
        # inlay hints: list of (line0, col, label)
        self._inlay_hints: List[tuple] = []
        # tracks whether the last keystroke was a dedenting }
        self._last_dedented: bool = False

        self._highlight_current_line()

    def _setup_appearance(self):
        font = QFont('Consolas, Courier New, monospace', 11)
        font.setFixedPitch(True)
        self.setFont(font)

        pal = self.palette()
        pal.setColor(QPalette.ColorRole.Base,   QColor(THEME['bg_editor']))
        pal.setColor(QPalette.ColorRole.Text,   QColor(THEME['fg']))
        pal.setColor(QPalette.ColorRole.Window, QColor(THEME['bg']))
        self.setPalette(pal)

        self.setLineWrapMode(QPlainTextEdit.LineWrapMode.NoWrap)
        self.setTabStopDistance(
            QFontMetrics(self.font()).horizontalAdvance(' ') * 4
        )

    # --- Gutter ---

    def _gutter_width(self) -> int:
        digits = max(3, len(str(max(1, self.blockCount()))))
        return 8 + QFontMetrics(self.font()).horizontalAdvance('9') * digits

    def _update_gutter_width(self, _):
        self.setViewportMargins(self._gutter_width(), 0, 0, 0)

    def _update_gutter(self, rect, dy):
        if dy:
            self._gutter.scroll(0, dy)
        else:
            self._gutter.update(0, rect.y(), self._gutter.width(), rect.height())
        if rect.contains(self.viewport().rect()):
            self._update_gutter_width(0)

    def resizeEvent(self, event):
        super().resizeEvent(event)
        cr = self.contentsRect()
        self._gutter.setGeometry(QRect(cr.left(), cr.top(),
                                       self._gutter_width(), cr.height()))

    def _paint_gutter(self, event, gutter):
        painter = QPainter(gutter)
        painter.fillRect(event.rect(), QColor(THEME['bg_line_num']))

        block = self.firstVisibleBlock()
        num   = block.blockNumber()
        top   = round(self.blockBoundingGeometry(block).translated(
                      self.contentOffset()).top())
        bottom = top + round(self.blockBoundingRect(block).height())
        fm    = QFontMetrics(self.font())
        h     = fm.height()

        diag_lines = {d[0] for d in self._diagnostics}

        while block.isValid() and top <= event.rect().bottom():
            if block.isVisible() and bottom >= event.rect().top():
                num_str = str(num + 1)
                color = QColor(THEME['error']) if num in diag_lines else QColor(THEME['fg_dim'])
                painter.setPen(color)
                painter.drawText(0, top, gutter.width() - 4, h,
                                 Qt.AlignmentFlag.AlignRight, num_str)
            block  = block.next()
            num   += 1
            top    = bottom
            bottom = top + round(self.blockBoundingRect(block).height())

    def _highlight_current_line(self):
        sel = QTextEdit.ExtraSelection()
        sel.format.setBackground(QColor(THEME['bg_current']))
        sel.format.setProperty(QTextCharFormat.Property.FullWidthSelection, True)
        sel.cursor = self.textCursor()
        sel.cursor.clearSelection()
        self.setExtraSelections([sel] + self._diag_selections())

    def _diag_selections(self) -> list:
        sels = []
        doc = self.document()
        for d_line0, d_col0, d_line1, d_col1, severity, msg in self._diagnostics:
            block = doc.findBlockByLineNumber(d_line0)
            if not block.isValid():
                continue
            start = block.position() + d_col0
            end   = doc.findBlockByLineNumber(d_line1).position() + d_col1
            sel = QTextEdit.ExtraSelection()
            color = QColor(THEME['error'] if severity <= 1 else THEME['warning'])
            sel.format.setUnderlineColor(color)
            sel.format.setUnderlineStyle(QTextCharFormat.UnderlineStyle.WaveUnderline)
            cur = QTextCursor(doc)
            cur.setPosition(start)
            cur.setPosition(end, QTextCursor.MoveMode.KeepAnchor)
            sel.cursor = cur
            sels.append(sel)
        return sels

    def set_diagnostics(self, diags: list):
        self._diagnostics = diags
        self._highlight_current_line()
        self._gutter.update()

    # --- Hover ---

    def mouseMoveEvent(self, event):
        super().mouseMoveEvent(event)
        self._hover_pos = event.globalPosition().toPoint()
        cursor = self.cursorForPosition(event.position().toPoint())
        line = cursor.blockNumber()
        col  = cursor.positionInBlock()
        self._hover_cursor_pos = (line, col)
        self._hover_timer.start(600)

    def leaveEvent(self, event):
        super().leaveEvent(event)
        self._hover_timer.stop()
        # Delay hide so mouse can move into the tooltip
        p = self.parent()
        while p is not None:
            if isinstance(p, QMainWindow) and hasattr(p, '_hover_tip'):
                p._hover_tip._schedule_hide()
                break
            p = p.parent()

    def _on_hover_timer(self):
        if self._hover_pos and self._hover_cursor_pos:
            line, col = self._hover_cursor_pos
            self.hover_requested.emit(line, col, self._hover_pos)

    def keyPressEvent(self, event):
        # F12 = go to definition, Shift+F12 = find references
        if event.key() == Qt.Key.Key_F12:
            if event.modifiers() & Qt.KeyboardModifier.ShiftModifier:
                cur = self.textCursor()
                self.references_requested.emit(cur.blockNumber(), cur.positionInBlock())
            else:
                cur = self.textCursor()
                self.definition_requested.emit(cur.blockNumber(), cur.positionInBlock())
            return

        # Auto-indent on Enter
        if event.key() in (Qt.Key.Key_Return, Qt.Key.Key_Enter):
            cur   = self.textCursor()
            # Normalize Unicode line/paragraph separators Qt may embed in block text
            line  = cur.block().text().replace('\u2028', '\n').replace('\u2029', '\n').split('\n')[-1]
            indent     = len(line) - len(line.lstrip())
            indent_str = line[:indent]
            if line.rstrip().endswith('{'):
                indent_str += '    '
            import sys
            super().keyPressEvent(event)
            self.insertPlainText(indent_str)
            return

        # Dedent on }
        if event.key() == Qt.Key.Key_BraceRight:
            cur  = self.textCursor()
            raw  = cur.block().text()
            line = raw.replace('\u2028', '\n').replace('\u2029', '\n').split('\n')[-1]
            stripped = line.lstrip()
            import sys
            if stripped == '' and line != '':
                new_indent = line[4:] if line.startswith('    ') else \
                             line[1:] if line.startswith('\t') else ''
                # Select from start of current visual line to cursor position
                cur2 = self.textCursor()
                cur2.movePosition(QTextCursor.MoveOperation.StartOfLine,
                                  QTextCursor.MoveMode.MoveAnchor)
                cur2.movePosition(QTextCursor.MoveOperation.EndOfLine,
                                  QTextCursor.MoveMode.KeepAnchor)
                cur2.insertText(new_indent + '};')
                # Move cursor back one to sit between } and ;
                new_cur = self.textCursor()
                new_cur.movePosition(QTextCursor.MoveOperation.Left,
                                     QTextCursor.MoveMode.MoveAnchor, 1)
                self.setTextCursor(new_cur)
                self._last_dedented = True
                return
            self._last_dedented = False
            super().keyPressEvent(event)
            return

        # Semicolon after a dedented } -- do not dedent again.
        # If the line currently ends with } (possibly with trailing spaces),
        # just insert the ; without any indent change.
        if event.key() == Qt.Key.Key_Semicolon:
            cur  = self.textCursor()
            line = cur.block().text().replace('\u2028', '\n').replace('\u2029', '\n').split('\n')[-1]
            col  = cur.positionInBlock()
            # Cursor is sitting between } and ; (auto-inserted };) -- skip
            if col < len(line) and line[col] == ';' and col > 0 and line[col - 1] == '}':
                new_cur = self.textCursor()
                new_cur.movePosition(QTextCursor.MoveOperation.Right,
                                     QTextCursor.MoveMode.MoveAnchor, 1)
                self.setTextCursor(new_cur)
                self._last_dedented = False
                return
            # ; after a line ending with } -- no second dedent, just insert
            if line.rstrip().endswith('}'):
                super().keyPressEvent(event)
                self._last_dedented = False
                return
            self._last_dedented = False
            super().keyPressEvent(event)
            return

        self._last_dedented = False
        super().keyPressEvent(event)

    def jump_to(self, line: int, col: int):
        """Jump cursor to 0-based line/col."""
        block = self.document().findBlockByLineNumber(line)
        if not block.isValid():
            return
        cur = QTextCursor(block)
        cur.movePosition(QTextCursor.MoveOperation.Right,
                         QTextCursor.MoveMode.MoveAnchor, col)
        self.setTextCursor(cur)
        self.centerCursor()

    def word_at(self, line: int, col: int) -> str:
        block = self.document().findBlockByLineNumber(line)
        if not block.isValid():
            return ''
        text = block.text()
        if not text:
            return ''
        col = max(0, min(col, len(text) - 1))
        start = col
        while start > 0 and (text[start-1].isalnum() or text[start-1] == '_'):
            start -= 1
        end = col
        while end < len(text) and (text[end].isalnum() or text[end] == '_'):
            end += 1
        return text[start:end]


# ---------------------------------------------------------------------------
# LSP client (stdio subprocess + JSON-RPC reader thread)
# ---------------------------------------------------------------------------

class LSPClient(QThread):
    """
    Runs the LSP server as a subprocess and provides async request/notification
    dispatch. Responses are delivered via signals to the main thread.
    """
    notification_received = pyqtSignal(str, object)   # method, params
    response_received     = pyqtSignal(int, str)       # req_id, result as JSON string

    def __init__(self, server_cmd: List[str], env: dict = None):
        super().__init__()
        self._cmd     = server_cmd
        self._env     = env or {}
        self._proc:   Optional[subprocess.Popen] = None
        self._req_id  = 0
        self._lock    = threading.Lock()
        self._pending: Dict[int, str] = {}  # id -> method
        self._running = False

    def start_server(self):
        env = os.environ.copy()
        env.update(self._env)
        # Always set IDEKA_SRCDIR -- LSP needs it to find compiler modules
        if 'IDEKA_SRCDIR' not in env:
            env['IDEKA_SRCDIR'] = str(Path(self._cmd[1]).parent.parent)
        self._proc = subprocess.Popen(
            self._cmd,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            env=env,
        )
        self._running = True
        # Forward LSP stderr to our stderr for debugging
        import threading
        def _fwd_stderr():
            for line in self._proc.stderr:
                sys.stderr.buffer.write(b'[lsp] ' + line)
                sys.stderr.buffer.flush()
        threading.Thread(target=_fwd_stderr, daemon=True).start()
        self.start()

    def stop(self):
        self._running = False
        if self._proc:
            try:
                self._proc.terminate()
            except Exception:
                pass

    def run(self):
        """Reader thread -- blocks on stdout, dispatches messages."""
        stdout = self._proc.stdout
        while self._running:
            try:
                header = b''
                while True:
                    ch = stdout.read(1)
                    if not ch:
                        return
                    header += ch
                    if header.endswith(b'\r\n\r\n'):
                        break
                header_str = header.decode('utf-8', errors='replace')
                length = 0
                for line in header_str.split('\r\n'):
                    if line.lower().startswith('content-length:'):
                        length = int(line.split(':')[1].strip())
                if length == 0:
                    continue
                body = b''
                while len(body) < length:
                    chunk = stdout.read(length - len(body))
                    if not chunk:
                        return
                    body += chunk
                msg = json.loads(body.decode('utf-8'))
                self._dispatch(msg)
            except Exception:
                if self._running:
                    time.sleep(0.1)

    def _dispatch(self, msg: dict):
        if 'id' in msg and 'method' not in msg:
            # Response -- emit result as-is; use empty dict sentinel for null
            result = msg.get('result')
            self.response_received.emit(msg['id'], json.dumps(result) if result is not None else '')
        elif 'method' in msg:
            self.notification_received.emit(msg['method'], msg.get('params'))

    def _send(self, msg: dict):
        if not self._proc or not self._proc.stdin:
            return
        body = json.dumps(msg).encode('utf-8')
        header = f'Content-Length: {len(body)}\r\n\r\n'.encode('utf-8')
        try:
            self._proc.stdin.write(header + body)
            self._proc.stdin.flush()
        except Exception:
            pass

    def _next_id(self) -> int:
        with self._lock:
            self._req_id += 1
            return self._req_id

    def notify(self, method: str, params: dict):
        self._send({'jsonrpc': '2.0', 'method': method, 'params': params})

    def request(self, method: str, params: dict) -> int:
        req_id = self._next_id()
        self._send({'jsonrpc': '2.0', 'id': req_id, 'method': method, 'params': params})
        return req_id

    def initialize(self, root_uri: str):
        self.request('initialize', {
            'processId': os.getpid(),
            'rootUri':   root_uri,
            'capabilities': {
                'textDocument': {
                    'hover':       {'contentFormat': ['markdown', 'plaintext']},
                    'completion':  {'completionItem': {'snippetSupport': True}},
                    'publishDiagnostics': {'relatedInformation': True},
                    'semanticTokens': {
                        'requests': {'full': True},
                        'tokenTypes': [
                            'namespace', 'type', 'class', 'enum', 'struct',
                            'parameter', 'variable', 'property', 'enumMember',
                            'function', 'method', 'macro', 'keyword',
                        ],
                        'tokenModifiers': [
                            'declaration', 'definition', 'readonly', 'static', 'defaultLibrary',
                        ],
                        'formats': ['relative'],
                    },
                    'inlayHint':   {'dynamicRegistration': False},
                    'definition':  {},
                    'references':  {},
                    'documentSymbol': {},
                    'signatureHelp': {},
                    'rename':      {},
                },
                'workspace': {
                    'symbol': {},
                },
            },
            'initializationOptions': {},
        })

    def did_open(self, uri: str, text: str):
        self.notify('textDocument/didOpen', {
            'textDocument': {
                'uri':        uri,
                'languageId': 'IDEKA',
                'version':    1,
                'text':       text,
            }
        })

    def did_change(self, uri: str, text: str, version: int):
        self.notify('textDocument/didChange', {
            'textDocument': {'uri': uri, 'version': version},
            'contentChanges': [{'text': text}],
        })

    def did_close(self, uri: str):
        self.notify('textDocument/didClose', {
            'textDocument': {'uri': uri}
        })

    def hover(self, uri: str, line: int, col: int) -> int:
        return self.request('textDocument/hover', {
            'textDocument': {'uri': uri},
            'position':     {'line': line, 'character': col},
        })

    def definition(self, uri: str, line: int, col: int) -> int:
        return self.request('textDocument/definition', {
            'textDocument': {'uri': uri},
            'position':     {'line': line, 'character': col},
        })

    def references(self, uri: str, line: int, col: int) -> int:
        return self.request('textDocument/references', {
            'textDocument': {'uri': uri},
            'position':     {'line': line, 'character': col},
            'context':      {'includeDeclaration': True},
        })

    def document_symbols(self, uri: str) -> int:
        return self.request('textDocument/documentSymbol', {
            'textDocument': {'uri': uri},
        })

    def semantic_tokens(self, uri: str) -> int:
        return self.request('textDocument/semanticTokens/full', {
            'textDocument': {'uri': uri},
        })

    def inlay_hints(self, uri: str, start_line: int, end_line: int) -> int:
        return self.request('textDocument/inlayHint', {
            'textDocument': {'uri': uri},
            'range': {
                'start': {'line': start_line, 'character': 0},
                'end':   {'line': end_line,   'character': 0},
            },
        })


# ---------------------------------------------------------------------------
# Mini visualizer render worker (runs pygame headless in a thread)
# ---------------------------------------------------------------------------

class MiniVizWorker(QThread):
    """
    Renders a single vizcore frame in a background thread and emits the
    result as a QPixmap via signal.
    """
    frame_ready = pyqtSignal(object, str)  # QPixmap, kind ('eg' or 'tg')

    def __init__(self, expr: str, kind: str, w: int = 400, h: int = 300):
        super().__init__()
        self._expr = expr
        self._kind = kind
        self._w    = w
        self._h    = h

    def run(self):
        try:
            import pygame
            import vizcore
            import os as _os

            # Init pygame offscreen without touching the process environment
            if not pygame.get_init():
                old_driver = _os.environ.get('SDL_VIDEODRIVER')
                _os.environ['SDL_VIDEODRIVER'] = 'offscreen'
                try:
                    pygame.init()
                finally:
                    if old_driver is None:
                        _os.environ.pop('SDL_VIDEODRIVER', None)
                    else:
                        _os.environ['SDL_VIDEODRIVER'] = old_driver

            if self._kind == 'eg':
                surf = vizcore.render_effect_frame(self._expr, self._w, self._h)
            else:
                surf = vizcore.render_type_frame(self._expr, self._w, self._h)

            # Convert pygame surface to QPixmap via raw bytes
            raw  = pygame.image.tostring(surf, 'RGB')
            qimg = QImage(raw, self._w, self._h, self._w * 3,
                          QImage.Format.Format_RGB888)
            pix  = QPixmap.fromImage(qimg)
            self.frame_ready.emit(pix, self._kind)
        except Exception as e:
            # Emit empty pixmap on failure -- tooltip still shows text + buttons
            self.frame_ready.emit(QPixmap(), self._kind)


# ---------------------------------------------------------------------------
# Hover tooltip with embedded mini viz + full-view buttons
# ---------------------------------------------------------------------------

class HoverTooltip(QFrame):
    """
    Custom tooltip showing LSP hover info, an embedded mini visualizer render,
    and buttons to promote to a full interactive visualizer window.
    """
    def __init__(self, parent=None):
        super().__init__(parent, Qt.WindowType.ToolTip | Qt.WindowType.FramelessWindowHint)
        self._word    = ''
        self._eg_expr = ''
        self._tg_expr = ''
        self._active_kind = 'eg'
        self._workers: List[MiniVizWorker] = []
        self._setup_ui()

    def _setup_ui(self):
        self.setStyleSheet(f"""
            HoverTooltip {{
                background: {THEME['bg_hover']};
                border: 1px solid {THEME['border']};
                border-radius: 6px;
            }}
            QLabel {{
                color: {THEME['fg']};
                background: transparent;
                border: none;
            }}
            QPushButton {{
                border-radius: 3px;
                padding: 3px 10px;
                font-size: 11px;
                font-weight: bold;
                border: none;
            }}
        """)
        # Solid background -- no translucency
        self.setAutoFillBackground(True)
        pal = self.palette()
        pal.setColor(self.backgroundRole(), QColor(THEME['bg_hover']))
        self.setPalette(pal)

        layout = QVBoxLayout(self)
        layout.setContentsMargins(14, 12, 14, 12)
        layout.setSpacing(6)

        self._title = QLabel()
        self._title.setStyleSheet(f'color: {THEME["fg_label"]}; font-weight: bold; font-size: 12px; font-family: Consolas, monospace;')
        self._title.setWordWrap(True)
        self._title.setMinimumWidth(300)
        layout.addWidget(self._title)

        self._body = QLabel()
        self._body.setWordWrap(True)
        self._body.setStyleSheet(f'color: {THEME["fg_dim"]}; font-size: 11px;')
        layout.addWidget(self._body)

        sep = QFrame()
        sep.setFrameShape(QFrame.Shape.HLine)
        sep.setStyleSheet(f'color: {THEME["border"]};')
        layout.addWidget(sep)

        # Tab row to switch between EG / TG mini view
        tab_row = QHBoxLayout()
        tab_row.setSpacing(4)
        self._tab_eg = QPushButton('Effect Geometry')
        self._tab_tg = QPushButton('Type Geometry')
        for btn, kind in ((self._tab_eg, 'eg'), (self._tab_tg, 'tg')):
            btn.setCheckable(True)
            btn.setStyleSheet(f"""
                QPushButton {{
                    background: {THEME['bg_panel']};
                    color: {THEME['fg_dim']};
                    border: 1px solid {THEME['border']};
                    border-radius: 3px;
                    padding: 3px 8px;
                    font-size: 10px;
                }}
                QPushButton:checked {{
                    background: {THEME['accent']};
                    color: white;
                    border: none;
                }}
                QPushButton:hover {{ color: {THEME['fg']}; }}
            """)
        self._tab_eg.setChecked(True)
        self._tab_eg.clicked.connect(lambda: self._switch_kind('eg'))
        self._tab_tg.clicked.connect(lambda: self._switch_kind('tg'))
        tab_row.addWidget(self._tab_eg)
        tab_row.addWidget(self._tab_tg)
        tab_row.addStretch()
        layout.addLayout(tab_row)

        # Mini render area
        self._viz_label = QLabel()
        self._viz_label.setFixedSize(400, 300)
        self._viz_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self._viz_label.setStyleSheet(
            f'background: #0e0e10; border: 1px solid {THEME["border"]}; border-radius: 3px;')
        self._viz_label.hide()
        layout.addWidget(self._viz_label)

        # Full-view launch button (hidden until a tab is clicked)
        launch_row = QHBoxLayout()
        launch_row.setSpacing(6)
        self._btn_full = QPushButton('Open Full View')
        self._btn_full.setStyleSheet(f"""
            QPushButton {{ background: {THEME['btn_eg']}; color: white; }}
            QPushButton:hover {{ background: #9c6fff; }}
        """)
        self._btn_full.clicked.connect(self._launch_full)
        self._btn_full.hide()
        launch_row.addWidget(self._btn_full)
        launch_row.addStretch()
        layout.addLayout(launch_row)

    def _switch_kind(self, kind: str):
        self._active_kind = kind
        self._tab_eg.setChecked(kind == 'eg')
        self._tab_tg.setChecked(kind == 'tg')
        btn_color = THEME['btn_eg'] if kind == 'eg' else THEME['btn_tg']
        self._btn_full.setStyleSheet(f"""
            QPushButton {{ background: {btn_color}; color: white; }}
            QPushButton:hover {{ background: {'#9c6fff' if kind == 'eg' else '#26c6da'}; }}
        """)
        self._viz_label.show()
        self._btn_full.show()
        self._viz_label.setText('Rendering...')
        self._viz_label.setPixmap(QPixmap())
        self.adjustSize()
        self._start_render(kind)

    def _start_render(self, kind: str):
        expr = self._eg_expr if kind == 'eg' else self._tg_expr
        if not expr:
            self._viz_label.setText('No expression')
            return
        worker = MiniVizWorker(expr, kind, 400, 300)
        worker.frame_ready.connect(self._on_frame_ready)
        self._workers.append(worker)
        worker.start()

    def _on_frame_ready(self, pix: QPixmap, kind: str):
        if kind != self._active_kind:
            return
        if pix.isNull():
            self._viz_label.setText('Render failed')
        else:
            self._viz_label.setText('')
            self._viz_label.setPixmap(pix)
        self.adjustSize()
        # Clean up finished workers
        self._workers = [w for w in self._workers if w.isRunning()]

    def show_hover(self, markdown: str, word: str, global_pos: QPoint,
                   eg_expr: str = '', tg_expr: str = '',
                   is_constraint: bool = False, is_effect: bool = False,
                   violations: list = None):
        self._word    = word
        self._eg_expr = eg_expr or word
        self._tg_expr = tg_expr or word

        # Parse LSP markdown: first line is "**kind** `signature`", rest is body
        # Extract kind label and signature separately for better display
        raw = markdown.strip()
        # Remove the hidden fx:effect comment before display
        raw = re.sub(r'\s*<!--\s*fx:effect:[^>]*-->', '', raw).strip()

        lines = raw.split('\n')
        first = lines[0].strip() if lines else word

        # Extract kind (bold text) and signature (backtick text) from first line
        kind_m = re.match(r'\*\*(.+?)\*\*\s*(.*)', first)
        if kind_m:
            kind_label = kind_m.group(1)
            sig_raw    = kind_m.group(2).strip()
            # Strip backticks from signature for display
            sig        = re.sub(r'`([^`]*)`', r'\1', sig_raw)
            title      = f'{kind_label}  {sig}'
        else:
            title = re.sub(r'[`*]', '', first)

        # Body: remaining lines, strip markdown syntax
        body_lines = []
        for l in lines[1:]:
            l = l.strip()
            if not l or l.startswith('<!--'):
                continue
            l = re.sub(r'`([^`]*)`', r'\1', l)
            l = re.sub(r'\*\*(.+?)\*\*', r'\1', l)
            body_lines.append(l)
        body = '\n'.join(body_lines)

        self._title.setText(title)
        self._title.setMinimumWidth(280)
        self._body.setText(body)
        self._body.setVisible(bool(body))

        # Violations -- red border and error messages
        violations = violations or []
        if violations:
            self.setStyleSheet(self.styleSheet().replace(
                f'border: 1px solid {THEME["border"]}',
                'border: 1px solid #f44747'
            ))
            if not hasattr(self, '_violation_label'):
                self._violation_label = QLabel()
                self._violation_label.setWordWrap(True)
                self._violation_label.setStyleSheet(
                    'color: #f44747; font-size: 11px; background: transparent; border: none;')
                self.layout().insertWidget(2, self._violation_label)
            self._violation_label.setText('\n'.join(f'⚠ {v}' for v in violations))
            self._violation_label.show()
        else:
            self.setStyleSheet(self.styleSheet().replace(
                'border: 1px solid #f44747',
                f'border: 1px solid {THEME["border"]}'
            ))
            if hasattr(self, '_violation_label'):
                self._violation_label.hide()

        # For constraints: auto-render TG immediately, hide EG tab
        if is_constraint and tg_expr:
            self._active_kind = 'tg'
            self._tab_eg.hide()
            self._tab_tg.setChecked(True)
            self._btn_full.setStyleSheet(f"""
                QPushButton {{ background: {THEME['btn_tg']}; color: white; }}
                QPushButton:hover {{ background: #26c6da; }}
            """)
            self._viz_label.show()
            self._btn_full.show()
            self._viz_label.setText('Rendering...')
            self._viz_label.setPixmap(QPixmap())
            self._start_render('tg')
        # For effect names: auto-render EG immediately, hide TG tab
        elif is_effect and eg_expr:
            self._active_kind = 'eg'
            self._tab_tg.hide()
            self._tab_eg.setChecked(True)
            self._btn_full.setStyleSheet(f"""
                QPushButton {{ background: {THEME['btn_eg']}; color: white; }}
                QPushButton:hover {{ background: #9c6fff; }}
            """)
            self._viz_label.show()
            self._btn_full.show()
            self._viz_label.setText('Rendering...')
            self._viz_label.setPixmap(QPixmap())
            self._start_render('eg')
        else:
            # Normal: no auto-render, user must click a tab
            self._active_kind = 'eg'
            self._tab_eg.show()
            self._tab_tg.show()
            self._tab_eg.setChecked(False)
            self._tab_tg.setChecked(False)
            self._btn_full.setStyleSheet(f"""
                QPushButton {{ background: {THEME['btn_eg']}; color: white; }}
                QPushButton:hover {{ background: #9c6fff; }}
            """)
            self._viz_label.hide()
            self._viz_label.setPixmap(QPixmap())
            self._btn_full.hide()

        self.adjustSize()

        screen = QApplication.primaryScreen().availableGeometry()
        x = global_pos.x() + 16
        y = global_pos.y() + 8
        if x + self.width() > screen.right():
            x = global_pos.x() - self.width() - 8
        if y + self.height() > screen.bottom():
            y = global_pos.y() - self.height() - 8
        self.move(x, y)
        self.show()
        self.raise_()

    def _launch_full(self):
        self.hide()
        if self._active_kind == 'eg':
            _launch_visualizer('eg.py', self._eg_expr)
        else:
            _launch_visualizer('tg.py', self._tg_expr)

    def _schedule_hide(self):
        """Hide after a short delay -- cancelled if mouse enters the tooltip."""
        if not hasattr(self, '_hide_timer'):
            self._hide_timer = QTimer(self)
            self._hide_timer.setSingleShot(True)
            self._hide_timer.timeout.connect(self.hide)
        self._hide_timer.start(200)

    def enterEvent(self, event):
        super().enterEvent(event)
        if hasattr(self, '_hide_timer'):
            self._hide_timer.stop()

    def leaveEvent(self, event):
        super().leaveEvent(event)
        self._schedule_hide()


def _launch_visualizer(script: str, expr: str):
    """Launch eg.py or tg.py as a floating subprocess with pre-loaded expression."""
    script_dir = Path(__file__).parent
    script_path = script_dir / script
    if not script_path.exists():
        script_path = Path(script)
    env = os.environ.copy()
    env['IDEKA_VIZ_EXPR'] = expr
    # Remove offscreen driver if set -- full view needs a real display
    env.pop('SDL_VIDEODRIVER', None)
    try:
        subprocess.Popen(
            [sys.executable, str(script_path), '--expr', expr],
            env=env,
            start_new_session=True,
        )
    except Exception as e:
        print(f"Could not launch {script}: {e}", file=sys.stderr)


# ---------------------------------------------------------------------------
# Document tab state
# ---------------------------------------------------------------------------

class DocumentState:
    def __init__(self, path: Optional[str] = None):
        self.path:     Optional[str] = path
        self.uri:      str = _path_to_uri(path) if path else ''
        self.version:  int = 1
        self.modified: bool = False
        self.editor:   Optional[IDEKACodeEdit] = None


def _path_to_uri(path: str) -> str:
    path = os.path.abspath(path)
    if sys.platform == 'win32':
        path = path.replace('\\', '/')
        return f'file:///{path}'
    return f'file://{path}'


# ---------------------------------------------------------------------------
# Symbol outline panel
# ---------------------------------------------------------------------------

class OutlinePanel(QTreeWidget):
    symbol_selected = pyqtSignal(int, int)  # line, col

    def __init__(self, parent=None):
        super().__init__(parent)
        self.setHeaderLabel('Outline')
        self.setIndentation(14)
        self.setStyleSheet(f"""
            QTreeWidget {{
                background: {THEME['bg_panel']};
                color: {THEME['fg']};
                border: none;
                font-size: 11px;
            }}
            QTreeWidget::item:selected {{
                background: {THEME['bg_sel']};
            }}
            QHeaderView::section {{
                background: {THEME['bg_panel']};
                color: {THEME['fg_dim']};
                border: none;
                padding: 4px;
            }}
        """)
        self.itemActivated.connect(self._on_activated)

    def populate(self, symbols: list):
        self.clear()
        _KIND_ICON = {
            12: ('fn',  THEME['fg_function']),   # Function
            5:  ('st',  THEME['fg_type']),        # Class/struct
            10: ('en',  THEME['fg_effect']),      # Enum
            22: ('ns',  THEME['fg_label']),       # Module/namespace
            13: ('var', THEME['fg']),             # Variable
        }

        def add_symbols(syms, parent_item=None):
            for sym in syms:
                kind = sym.get('kind', 13)
                name = sym.get('name', '?')
                loc  = sym.get('location') or sym.get('selectionRange') or {}
                line = 0
                col  = 0
                if 'range' in loc:
                    line = loc['range']['start']['line']
                    col  = loc['range']['start']['character']
                elif 'start' in loc:
                    line = loc['start']['line']
                    col  = loc['start']['character']

                tag, color = _KIND_ICON.get(kind, ('?', THEME['fg_dim']))
                label = f'[{tag}] {name}'

                item = QTreeWidgetItem([label])
                item.setForeground(0, QColor(color))
                item.setData(0, Qt.ItemDataRole.UserRole, (line, col))

                if parent_item:
                    parent_item.addChild(item)
                else:
                    self.addTopLevelItem(item)

                children = sym.get('children', [])
                if children:
                    add_symbols(children, item)

        add_symbols(symbols)
        self.expandAll()

    def _on_activated(self, item, _col):
        data = item.data(0, Qt.ItemDataRole.UserRole)
        if data:
            self.symbol_selected.emit(*data)


# ---------------------------------------------------------------------------
# Process runner -- streams subprocess output to a QPlainTextEdit
# ---------------------------------------------------------------------------

class ProcessRunner(QThread):
    """Runs a subprocess and emits output line by line."""
    line_out    = pyqtSignal(str)   # stdout line
    line_err    = pyqtSignal(str)   # stderr line
    finished_rc = pyqtSignal(int)   # return code when done

    def __init__(self, cmd: List[str], cwd: Optional[str] = None,
                 env: Optional[dict] = None):
        super().__init__()
        self._cmd  = cmd
        self._cwd  = cwd
        self._env  = env
        self._proc: Optional[subprocess.Popen] = None

    def run(self):
        try:
            self._proc = subprocess.Popen(
                self._cmd,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                cwd=self._cwd,
                env=self._env,
            )
            def _read(pipe, signal):
                while True:
                    chunk = pipe.read(4096)
                    if not chunk:
                        break
                    text = chunk.decode('utf-8', errors='replace')
                    for line in text.splitlines():
                        signal.emit(line)
                pipe.close()

            import threading
            t_out = threading.Thread(target=_read, args=(self._proc.stdout, self.line_out), daemon=True)
            t_err = threading.Thread(target=_read, args=(self._proc.stderr, self.line_err), daemon=True)
            t_out.start(); t_err.start()
            self._proc.wait()
            t_out.join(); t_err.join()
            self.finished_rc.emit(self._proc.returncode)
        except Exception as e:
            self.line_err.emit(f'[fide] Failed to start process: {e}')
            self.finished_rc.emit(-1)

    def stop(self):
        if self._proc:
            try:
                self._proc.terminate()
            except Exception:
                pass


# ---------------------------------------------------------------------------
# REPL widget -- drives ReplSession directly, no terminal needed
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Shared output helpers
# ---------------------------------------------------------------------------

_RECENT_MAX  = 10
_RECENT_PATH = Path.home() / '.IDEKA_ide_recent.json'

def _load_recent() -> List[str]:
    try:
        return json.loads(_RECENT_PATH.read_text())
    except Exception:
        return []

def _save_recent(paths: List[str]):
    try:
        _RECENT_PATH.write_text(json.dumps(paths))
    except Exception:
        pass

def _push_recent(path: str):
    paths = _load_recent()
    path  = os.path.abspath(path)
    if path in paths:
        paths.remove(path)
    paths.insert(0, path)
    _save_recent(paths[:_RECENT_MAX])

_ANSI_RE = re.compile(r'\x1b\[([0-9;]*)m')

_ANSI_COLORS = {
    '30': '#1a1a1a', '31': '#f44747', '32': '#6a9955',
    '33': '#cca700', '34': '#4fc1ff', '35': '#c586c0',
    '36': '#4ec9b0', '37': '#d4d4d4',
    '90': '#6a6a6a', '91': '#f44747', '92': '#4fc1ff',
    '93': '#dcdcaa', '94': '#569cd6', '95': '#c586c0',
    '96': '#4ec9b0', '97': '#ffffff',
}

def _ansi_to_richtext(text: str, default_color: str) -> List[tuple]:
    segments = []
    current_color = default_color
    pos = 0
    for m in _ANSI_RE.finditer(text):
        if m.start() > pos:
            segments.append((text[pos:m.start()], current_color))
        codes = m.group(1).split(';') if m.group(1) else ['0']
        for code in codes:
            if code in ('0', ''):
                current_color = default_color
            elif code in _ANSI_COLORS:
                current_color = _ANSI_COLORS[code]
        pos = m.end()
    if pos < len(text):
        segments.append((text[pos:], current_color))
    return segments


# ---------------------------------------------------------------------------
# REPL widget
# ---------------------------------------------------------------------------

class ReplWidget(QWidget):
    """
    Embedded IDEKA REPL. Drives frepl.ReplSession._run_block directly,
    bypassing frepl's raw-terminal input layer.
    """
    def __init__(self, parent=None):
        super().__init__(parent)
        self._session = None
        self._worker  = None
        self._setup_ui()
        self._init_session()

    def _setup_ui(self):
        layout = QVBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(0)

        self._output = QPlainTextEdit()
        self._output.setReadOnly(True)
        self._output.setFont(QFont('Consolas, Courier New', 10))
        self._output.setStyleSheet(f"""
            QPlainTextEdit {{
                background: {THEME['bg']};
                color: {THEME['fg']};
                border: none;
            }}
        """)
        layout.addWidget(self._output)

        input_row = QHBoxLayout()
        input_row.setContentsMargins(4, 2, 4, 2)
        input_row.setSpacing(4)

        self._prompt = QLabel('fx>')
        self._prompt.setStyleSheet(f'color: {THEME["fg_label"]}; font-family: Consolas; font-size: 10pt;')
        input_row.addWidget(self._prompt)

        self._input = QPlainTextEdit()
        self._input.setFixedHeight(60)
        self._input.setFont(QFont('Consolas, Courier New', 10))
        self._input.setStyleSheet(f"""
            QPlainTextEdit {{
                background: {THEME['bg_panel']};
                color: {THEME['fg']};
                border: 1px solid {THEME['border']};
                border-radius: 3px;
            }}
        """)
        self._input.setPlaceholderText('Enter comptime code... Ctrl+Enter to run')
        self._input.installEventFilter(self)
        input_row.addWidget(self._input)

        self._btn_run = QPushButton('Run')
        self._btn_run.setFixedWidth(50)
        self._btn_run.setStyleSheet(f"""
            QPushButton {{ background: {THEME['accent']}; color: white;
                           border-radius: 3px; padding: 4px; }}
            QPushButton:hover {{ background: {THEME['accent_hover']}; }}
        """)
        self._btn_run.clicked.connect(self._submit)
        input_row.addWidget(self._btn_run)

        self._btn_reset = QPushButton('Reset')
        self._btn_reset.setFixedWidth(55)
        self._btn_reset.setStyleSheet(f"""
            QPushButton {{ background: {THEME['bg_panel']}; color: {THEME['fg_dim']};
                           border: 1px solid {THEME['border']}; border-radius: 3px; padding: 4px; }}
            QPushButton:hover {{ color: {THEME['fg']}; }}
        """)
        self._btn_reset.clicked.connect(self._reset)
        input_row.addWidget(self._btn_reset)

        layout.addLayout(input_row)

    def eventFilter(self, obj, event):
        from PyQt6.QtCore import QEvent
        if obj is self._input and event.type() == QEvent.Type.KeyPress:
            from PyQt6.QtGui import QKeyEvent
            ke = event
            if (ke.key() in (Qt.Key.Key_Return, Qt.Key.Key_Enter) and
                    ke.modifiers() & Qt.KeyboardModifier.ControlModifier):
                self._submit()
                return True
        return super().eventFilter(obj, event)

    def _init_session(self):
        try:
            import sys, os
            sys.path.insert(0, str(Path(__file__).parent))
            from frepl import ReplSession, _run_block, _val_repr, _print_result
            self._session      = ReplSession()
            self._run_block    = _run_block
            self._val_repr     = _val_repr
            self._append(f'IDEKA REPL (FVM)  --  Ctrl+Enter to run, Reset to clear session\n', THEME['fg_dim'])
        except Exception as e:
            self._session = None
            self._append(f'REPL unavailable: {e}\n', THEME['error'])

    def _append(self, text: str, color: str = None):
        default = color or THEME['fg']
        cur = self._output.textCursor()
        cur.movePosition(QTextCursor.MoveOperation.End)
        segments = _ansi_to_richtext(text, default)
        for seg_text, seg_color in segments:
            fmt = QTextCharFormat()
            fmt.setForeground(QColor(seg_color))
            cur.setCharFormat(fmt)
            cur.insertText(seg_text)
        self._output.setTextCursor(cur)
        self._output.ensureCursorVisible()

    def _submit(self):
        if not self._session:
            return
        source = self._input.toPlainText().strip()
        if not source:
            return

        self._append(f'fx> {source}\n', THEME['fg_label'])
        self._input.clear()

        # Handle REPL commands
        if source in (':quit', ':q'):
            self._append('Use Reset to clear the session.\n', THEME['fg_dim'])
            return
        if source == ':reset':
            self._reset(); return
        if source == ':help':
            self._append(
                'Commands: :reset  :stack  :locals  :funcs\n'
                'Ctrl+Enter to submit code.\n', THEME['fg_dim'])
            return
        if source == ':stack':
            self._dump_stack(); return
        if source == ':locals':
            self._dump_locals(); return
        if source == ':funcs':
            self._dump_funcs(); return

        # Run in thread so Qt doesn't block
        self._btn_run.setEnabled(False)
        worker = _ReplRunWorker(self._session, self._run_block, source)
        worker.output.connect(lambda t, c: self._append(t, c))
        worker.done.connect(self._on_run_done)
        self._worker = worker
        worker.start()

    def _on_run_done(self):
        self._btn_run.setEnabled(True)

    def _reset(self):
        if self._session:
            self._session.reset()
        self._append('Session reset.\n', THEME['fg_dim'])

    def _dump_stack(self):
        if not self._session or not self._session.vm.stack:
            self._append('(stack empty)\n', THEME['fg_dim']); return
        for i, v in enumerate(self._session.vm.stack):
            self._append(f'  [{i}]  {self._val_repr(v)} : {v.tag.value}\n', THEME['fg'])

    def _dump_locals(self):
        if not self._session or not self._session.captured_scope:
            self._append('(no variables)\n', THEME['fg_dim']); return
        for name, val in sorted(self._session.captured_scope.items()):
            self._append(f'  {name} = {self._val_repr(val)} : {val.tag.value}\n', THEME['fg'])

    def _dump_funcs(self):
        if not self._session or not self._session.known_functions:
            self._append('(no functions)\n', THEME['fg_dim']); return
        for name in sorted(self._session.known_functions):
            n = len(self._session.known_functions[name])
            self._append(f'  {name}  ({n} instructions)\n', THEME['fg'])


class _ReplRunWorker(QThread):
    output = pyqtSignal(str, str)   # text, color
    done   = pyqtSignal()

    def __init__(self, session, run_block_fn, source: str):
        super().__init__()
        self._session     = session
        self._run_block   = run_block_fn
        self._source      = source

    def run(self):
        import io, sys
        # Capture stdout so VM print() calls appear in the REPL output
        buf = io.StringIO()
        old_stdout = sys.stdout
        sys.stdout = buf
        try:
            from frepl import _parse_comptime_blocks, _wrap_comptime, \
                               _print_new_emissions, _val_repr, FVMCodegenError
            from idkvm import VMError
            wrapped = _wrap_comptime(self._source)
            blocks  = _parse_comptime_blocks(wrapped)
            if not blocks:
                self.output.emit('(nothing to execute)\n', THEME['fg_dim'])
                return
            for block in blocks:
                try:
                    result = self._run_block(self._session, block)
                except FVMCodegenError as e:
                    self.output.emit(f'Codegen error: {e}\n', THEME['error'])
                    break
                except VMError as e:
                    self.output.emit(f'VM error: {e}\n', THEME['error'])
                    break
                except Exception as e:
                    self.output.emit(f'Error: {e}\n', THEME['error'])
                    break
                else:
                    captured = buf.getvalue()
                    buf.truncate(0); buf.seek(0)
                    if captured:
                        self.output.emit(captured, THEME['fg'])
                    # emit results
                    results = self._session.vm.emit_results
                    while self._session._emit_cursor < len(results):
                        entry = results[self._session._emit_cursor]
                        kind  = entry[0]
                        if kind == 'const':
                            _, val = entry
                            self.output.emit(f'[emit:const]  {_val_repr(val)} : {val.tag.value}\n', THEME['fg_label'])
                        elif kind == 'IDEKA':
                            _, text = entry
                            self.output.emit(f'[emit:IDEKA]   {text}\n', THEME['fg_label'])
                        self._session._emit_cursor += 1
                    if result is not None:
                        from idkvm import TTag
                        if result.tag != TTag.VOID:
                            self.output.emit(f'=> {_val_repr(result)} : {result.tag.value}\n', THEME['fg_type'])
        except Exception as e:
            self.output.emit(f'Error: {e}\n', THEME['error'])
        finally:
            sys.stdout = old_stdout
            remaining = buf.getvalue()
            if remaining:
                self.output.emit(remaining, THEME['fg'])
        self.done.emit()


# ---------------------------------------------------------------------------
# Bottom panel -- Console Log, Compiler Output, REPL
# ---------------------------------------------------------------------------

class BottomPanel(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._build_runner: Optional[ProcessRunner] = None
        self._run_runner:   Optional[ProcessRunner] = None
        self._setup_ui()

    def _setup_ui(self):
        layout = QVBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(0)

        self._tabs = QTabWidget()
        self._tabs.setStyleSheet(f"""
            QTabWidget::pane {{ border: none; background: {THEME['bg']}; }}
            QTabBar::tab {{
                background: {THEME['bg_panel']};
                color: {THEME['fg_dim']};
                border: 1px solid {THEME['border']};
                border-bottom: none;
                padding: 4px 12px;
            }}
            QTabBar::tab:selected {{
                background: {THEME['bg']};
                color: {THEME['fg']};
                border-bottom: 2px solid {THEME['accent']};
            }}
        """)

        self._console_out  = self._make_output()
        self._compiler_out = self._make_output()
        self._repl         = ReplWidget()

        self._tabs.addTab(self._console_out,  'Console Log')
        self._tabs.addTab(self._compiler_out, 'Compiler Output')
        self._tabs.addTab(self._repl,         'REPL')

        layout.addWidget(self._tabs)

    def _make_output(self) -> QPlainTextEdit:
        w = QPlainTextEdit()
        w.setReadOnly(True)
        w.setFont(QFont('Consolas, Courier New', 10))
        w.setStyleSheet(f"""
            QPlainTextEdit {{
                background: {THEME['bg']};
                color: {THEME['fg']};
                border: none;
            }}
        """)
        return w

    def _append(self, widget: QPlainTextEdit, text: str, color: str = None):
        default = color or THEME['fg']
        cur = widget.textCursor()
        cur.movePosition(QTextCursor.MoveOperation.End)
        segments = _ansi_to_richtext(text, default)
        for seg_text, seg_color in segments:
            fmt = QTextCharFormat()
            fmt.setForeground(QColor(seg_color))
            cur.setCharFormat(fmt)
            cur.insertText(seg_text)
        # newline with reset color
        fmt = QTextCharFormat()
        fmt.setForeground(QColor(default))
        cur.setCharFormat(fmt)
        cur.insertText('\n')
        widget.setTextCursor(cur)
        widget.ensureCursorVisible()

    def clear_compiler(self):
        self._compiler_out.clear()

    def clear_console(self):
        self._console_out.clear()

    def start_build(self, cmd: List[str], cwd: str):
        """Run idkc.py, stream output to Compiler Output tab."""
        if self._build_runner and self._build_runner.isRunning():
            self._build_runner.stop()
        self.clear_compiler()
        self._tabs.setCurrentIndex(1)
        self._append(self._compiler_out, f'$ {" ".join(cmd)}', THEME['fg_dim'])
        env = os.environ.copy()
        env['FORCE_COLOR'] = '1'
        env['IDEKA_LOG_NO_COLOR'] = '0'
        self._build_runner = ProcessRunner(cmd, cwd=cwd, env=env)
        self._build_runner.line_out.connect(
            lambda l: self._append(self._compiler_out, l, THEME['fg']))
        self._build_runner.line_err.connect(
            lambda l: self._append(self._compiler_out, l, THEME['error']))
        self._build_runner.finished_rc.connect(self._on_build_done)
        self._build_runner.start()
        return self._build_runner

    def _on_build_done(self, rc: int):
        color = THEME['fg_comment'] if rc == 0 else THEME['error']
        msg   = f'Build exited with code {rc}'
        self._append(self._compiler_out, msg, color)

    def start_run(self, cmd: List[str], cwd: str):
        """Run the compiled binary, stream output to Console Log tab."""
        if self._run_runner and self._run_runner.isRunning():
            self._run_runner.stop()
        self.clear_console()
        self._tabs.setCurrentIndex(0)
        self._append(self._console_out, f'$ {" ".join(cmd)}', THEME['fg_dim'])
        self._run_runner = ProcessRunner(cmd, cwd=cwd)
        self._run_runner.line_out.connect(
            lambda l: self._append(self._console_out, l, THEME['fg']))
        self._run_runner.line_err.connect(
            lambda l: self._append(self._console_out, l, THEME['error']))
        self._run_runner.finished_rc.connect(
            lambda rc: self._append(self._console_out,
                                    f'Process exited with code {rc}',
                                    THEME['fg_comment'] if rc == 0 else THEME['error']))
        self._run_runner.start()
        return self._run_runner

    def stop_all(self):
        if self._build_runner: self._build_runner.stop()
        if self._run_runner:   self._run_runner.stop()

    def show_repl(self):
        self._tabs.setCurrentIndex(2)


# ---------------------------------------------------------------------------
# Build options bar
# ---------------------------------------------------------------------------


# ---------------------------------------------------------------------------
# Build options bar
# ---------------------------------------------------------------------------

class BuildOptionsBar(QWidget):
    """
    Thin bar with checkboxes for IDEKA compiler flags.
    Mutually exclusive within each pair:
      borrowcheck / borrowcheck-warn
      effects / effects-warn
    """
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setFixedHeight(28)
        self.setStyleSheet(f"""
            QWidget {{
                background: {THEME['bg_panel']};
                border-top: 1px solid {THEME['border']};
                border-bottom: 1px solid {THEME['border']};
            }}
            QCheckBox {{
                color: {THEME['fg_dim']};
                font-size: 10px;
                spacing: 4px;
            }}
            QCheckBox:checked {{ color: {THEME['fg']}; }}
            QCheckBox::indicator {{
                width: 12px; height: 12px;
                border: 1px solid {THEME['border']};
                border-radius: 2px;
                background: {THEME['bg']};
            }}
            QCheckBox::indicator:checked {{
                background: {THEME['accent']};
                border-color: {THEME['accent']};
            }}
            QLabel {{
                color: {THEME['fg_dim']};
                font-size: 10px;
                background: transparent;
                border: none;
            }}
        """)

        row = QHBoxLayout(self)
        row.setContentsMargins(8, 0, 8, 0)
        row.setSpacing(14)

        lbl = QLabel('Build flags:')
        row.addWidget(lbl)

        self._cb_bc       = QCheckBox('--borrowcheck')
        self._cb_bc_warn  = QCheckBox('--borrowcheck-warn')
        self._cb_eff      = QCheckBox('--effects')
        self._cb_eff_warn = QCheckBox('--effects-warn')

        for cb in (self._cb_bc, self._cb_bc_warn, self._cb_eff, self._cb_eff_warn):
            row.addWidget(cb)

        row.addStretch()

        # Mutual exclusion within each pair
        self._cb_bc.toggled.connect(lambda on: self._cb_bc_warn.setChecked(False) if on else None)
        self._cb_bc_warn.toggled.connect(lambda on: self._cb_bc.setChecked(False) if on else None)
        self._cb_eff.toggled.connect(lambda on: self._cb_eff_warn.setChecked(False) if on else None)
        self._cb_eff_warn.toggled.connect(lambda on: self._cb_eff.setChecked(False) if on else None)

    def extra_flags(self) -> List[str]:
        flags = []
        if self._cb_bc.isChecked():       flags.append('--borrowcheck')
        if self._cb_bc_warn.isChecked():  flags.append('--borrowcheck-warn')
        if self._cb_eff.isChecked():      flags.append('--effects')
        if self._cb_eff_warn.isChecked(): flags.append('--effects-warn')
        return flags


class IDEKAIDE(QMainWindow):
    def __init__(self, lsp_cmd: Optional[List[str]] = None,
                 lsp_env: Optional[dict] = None):
        super().__init__()
        self.setWindowTitle('IDEKA IDE')
        self.resize(1400, 900)

        self._docs:       Dict[int, DocumentState] = {}
        self._lsp:        Optional[LSPClient] = None
        self._pending_hover: Optional[int] = None
        self._hover_tip:  Optional[HoverTooltip] = None
        self._initialized = False
        self._compiled_binary: Optional[str] = None
        self._parsed_uris: set = set()  # URIs that have received at least one publishDiagnostics
        self._sem_token_types = [
            'namespace', 'type', 'class', 'enum', 'struct',
            'parameter', 'variable', 'property', 'enumMember',
            'function', 'method', 'macro', 'keyword',
        ]

        self._setup_ui()
        self._setup_menu()
        self._setup_style()

        if lsp_cmd:
            self._start_lsp(lsp_cmd, lsp_env or {})

    # -----------------------------------------------------------------------
    # UI setup
    # -----------------------------------------------------------------------

    def _setup_ui(self):
        central = QWidget()
        self.setCentralWidget(central)
        root = QVBoxLayout(central)
        root.setContentsMargins(0, 0, 0, 0)
        root.setSpacing(0)

        # Vertical splitter: [outline + editor] | [bottom panel]
        self._vsplit = QSplitter(Qt.Orientation.Vertical)

        # Top area: outline + editor
        top_widget = QWidget()
        top_layout = QHBoxLayout(top_widget)
        top_layout.setContentsMargins(0, 0, 0, 0)
        top_layout.setSpacing(0)

        self._splitter = QSplitter(Qt.Orientation.Horizontal)

        self._outline = OutlinePanel()
        self._outline.setFixedWidth(220)
        self._outline.symbol_selected.connect(self._on_outline_symbol)
        self._splitter.addWidget(self._outline)

        self._tabs = QTabWidget()
        self._tabs.setTabsClosable(True)
        self._tabs.setMovable(True)
        self._tabs.tabCloseRequested.connect(self._close_tab)
        self._tabs.currentChanged.connect(self._on_tab_changed)
        self._splitter.addWidget(self._tabs)

        self._splitter.setStretchFactor(0, 0)
        self._splitter.setStretchFactor(1, 1)

        top_layout.addWidget(self._splitter)
        self._vsplit.addWidget(top_widget)

        # Bottom area: build options bar + bottom panel
        bottom_container = QWidget()
        bottom_layout = QVBoxLayout(bottom_container)
        bottom_layout.setContentsMargins(0, 0, 0, 0)
        bottom_layout.setSpacing(0)

        self._build_opts = BuildOptionsBar()
        self._bottom = BottomPanel()
        self._bottom.setMinimumHeight(100)

        bottom_layout.addWidget(self._build_opts)
        bottom_layout.addWidget(self._bottom)

        self._vsplit.addWidget(bottom_container)

        self._vsplit.setStretchFactor(0, 3)
        self._vsplit.setStretchFactor(1, 1)

        root.addWidget(self._vsplit)

        # Status bar
        self._status = QStatusBar()
        self._status.setMaximumHeight(24)
        self.setStatusBar(self._status)
        self._lbl_pos  = QLabel('Ln 1, Col 1')
        self._lbl_file = QLabel('')
        self._lbl_lsp  = QLabel('LSP: disconnected')
        self._status.addPermanentWidget(self._lbl_pos)
        self._status.addPermanentWidget(self._lbl_file)
        self._status.addPermanentWidget(self._lbl_lsp)

        # Hover tooltip (shared, hidden by default)
        self._hover_tip = HoverTooltip()
        self._hover_tip.hide()

    def _setup_menu(self):
        mb = self.menuBar()

        # File
        fm = mb.addMenu('File')
        _a(fm, 'New',             'Ctrl+N',  self._new_file)
        _a(fm, 'Open...',         'Ctrl+O',  self._open_file)
        self._recent_menu = fm.addMenu('Open Recent')
        self._rebuild_recent_menu()
        _a(fm, 'Save',            'Ctrl+S',  self._save_file)
        _a(fm, 'Save As...',      'Ctrl+Shift+S', self._save_file_as)
        fm.addSeparator()
        _a(fm, 'Close Tab',       'Ctrl+W',  lambda: self._close_tab(self._tabs.currentIndex()))
        _a(fm, 'Quit',            'Ctrl+Q',  self.close)

        # Edit
        em = mb.addMenu('Edit')
        _a(em, 'Undo',  'Ctrl+Z', lambda: self._cur_editor() and self._cur_editor().undo())
        _a(em, 'Redo',  'Ctrl+Y', lambda: self._cur_editor() and self._cur_editor().redo())
        em.addSeparator()
        _a(em, 'Cut',   'Ctrl+X', lambda: self._cur_editor() and self._cur_editor().cut())
        _a(em, 'Copy',  'Ctrl+C', lambda: self._cur_editor() and self._cur_editor().copy())
        _a(em, 'Paste', 'Ctrl+V', lambda: self._cur_editor() and self._cur_editor().paste())

        # Build
        bm = mb.addMenu('Build')
        _a(bm, 'Build',          'F5',         self._build)
        _a(bm, 'Run',            'F6',         self._run)
        _a(bm, 'Build and Run',  'F7',         self._build_and_run)
        _a(bm, 'Stop',           'Shift+F5',   self._stop)
        bm.addSeparator()
        _a(bm, 'Open REPL',      'Ctrl+R',     self._bottom.show_repl)

        # View
        vm = mb.addMenu('View')
        _a(vm, 'Effect Geometry Visualizer', 'Ctrl+Shift+E', self._launch_eg_standalone)
        _a(vm, 'Type Geometry Visualizer',   'Ctrl+Shift+T', self._launch_tg_standalone)
        vm.addSeparator()
        _a(vm, 'Toggle Outline',             'Ctrl+Shift+O', self._toggle_outline)

        # Go
        gm = mb.addMenu('Go')
        _a(gm, 'Go to Definition',    'F12',          self._goto_def)
        _a(gm, 'Find References',     'Shift+F12',    self._find_refs)
        _a(gm, 'Go to Line...',       'Ctrl+G',       self._goto_line)

    def _setup_style(self):
        self.setStyleSheet(f"""
            QMainWindow {{ background: {THEME['bg']}; }}
            QMenuBar {{
                background: {THEME['bg_panel']};
                color: {THEME['fg']};
                border-bottom: 1px solid {THEME['border']};
            }}
            QMenuBar::item:selected {{ background: {THEME['bg_sel']}; }}
            QMenu {{
                background: {THEME['bg_panel']};
                color: {THEME['fg']};
                border: 1px solid {THEME['border']};
            }}
            QMenu::item:selected {{ background: {THEME['bg_sel']}; }}
            QTabWidget::pane {{
                border: none;
                background: {THEME['bg_editor']};
            }}
            QTabBar::tab {{
                background: {THEME['bg_panel']};
                color: {THEME['fg_dim']};
                border: 1px solid {THEME['border']};
                border-bottom: none;
                padding: 5px 14px;
                min-width: 100px;
            }}
            QTabBar::tab:selected {{
                background: {THEME['bg_editor']};
                color: {THEME['fg']};
                border-bottom: 2px solid {THEME['accent']};
            }}
            QTabBar::tab:hover {{ color: {THEME['fg']}; }}
            QStatusBar {{
                background: {THEME['bg_panel']};
                color: {THEME['fg_dim']};
                border-top: 1px solid {THEME['border']};
            }}
            QSplitter::handle {{ background: {THEME['border']}; width: 1px; }}
        """)

    # -----------------------------------------------------------------------
    # LSP
    # -----------------------------------------------------------------------

    def _start_lsp(self, cmd: List[str], env: dict):
        self._lsp = LSPClient(cmd, env)
        self._lsp.notification_received.connect(self._on_lsp_notification)
        self._lsp.response_received.connect(self._on_lsp_response)
        self._pending_init_id = 1  # initialize is always request id 1
        self._lsp.start_server()
        root = _path_to_uri(os.getcwd())
        req_id = self._lsp.initialize(root)
        self._lbl_lsp.setText('LSP: connecting...')

    def _on_lsp_response(self, req_id: int, result_json: str):
        result = json.loads(result_json) if result_json else None
        if hasattr(self, '_pending_init_id') and req_id == self._pending_init_id:
            self._lsp.notify('initialized', {})
            self._initialized = True
            self._lbl_lsp.setText('LSP: connected')
            # Open all currently open documents
            for idx, state in self._docs.items():
                if state.uri:
                    editor = self._tabs.widget(idx)
                    if isinstance(editor, IDEKACodeEdit):
                        self._lsp.did_open(state.uri, editor.toPlainText())
            return

        if req_id == self._pending_hover:
            self._handle_hover_result(result if isinstance(result, dict) else None)
            return

        if req_id in self._pending_def:
            self._handle_definition_result(result)
            self._pending_def.discard(req_id)
            return

        if req_id in self._pending_sym:
            self._handle_symbols_result(result)
            self._pending_sym.discard(req_id)
            return

        if req_id in self._pending_sem:
            self._handle_semantic_tokens(result)
            self._pending_sem.discard(req_id)
            return

    _pending_def: set = set()
    _pending_sym: set = set()
    _pending_sem: set = set()

    def _on_lsp_notification(self, method: str, params):
        if method == 'textDocument/publishDiagnostics':
            self._handle_diagnostics(params)
        elif method == 'window/logMessage':
            # LSP signals successful parse via a log message
            msg = params.get('message', '') if params else ''
            if msg.startswith('fx:parse-ok:'):
                uri = msg[len('fx:parse-ok:'):]
                self._parsed_uris.add(uri)

    def _handle_diagnostics(self, params: dict):
        uri   = params.get('uri', '')
        diags = params.get('diagnostics', [])
        # Find editor for this URI
        for idx, state in self._docs.items():
            if state.uri == uri:
                editor = self._tabs.widget(idx)
                if isinstance(editor, IDEKACodeEdit):
                    parsed = []
                    for d in diags:
                        r    = d.get('range', {})
                        s    = r.get('start', {})
                        e    = r.get('end', {})
                        sev  = d.get('severity', 1)
                        msg  = d.get('message', '')
                        parsed.append((s.get('line', 0), s.get('character', 0),
                                       e.get('line', 0), e.get('character', 0),
                                       sev, msg))
                    editor.set_diagnostics(parsed)
                    count = len(diags)
                    if count:
                        self._status.showMessage(f'{count} diagnostic(s) in {Path(state.path or "?").name}', 4000)
                break

    def _handle_hover_result(self, result):
        if result is None:
            return
        contents = result.get('contents', '')
        if isinstance(contents, dict):
            md = contents.get('value', '')
        elif isinstance(contents, list):
            md = '\n'.join(
                c.get('value', c) if isinstance(c, dict) else str(c)
                for c in contents
            )
        else:
            md = str(contents)

        if not md:
            return

        editor = self._cur_editor()
        if not editor:
            return

        word = editor._hover_cursor_pos and editor.word_at(*editor._hover_cursor_pos) or ''
        eg_expr       = self._extract_effect_expr(md, word)
        tg_expr       = self._extract_constraint_expr(md) or word
        is_constraint = bool(self._extract_constraint_expr(md))
        is_effect     = bool(re.search(r'<!--\s*fx:effect:', md)) and not is_constraint
        violations    = re.findall(r'<!--\s*fx:violation:(.+?)\s*-->', md)

        self._hover_tip.show_hover(md, word, self._last_hover_global_pos,
                                   eg_expr=eg_expr, tg_expr=tg_expr,
                                   is_constraint=is_constraint,
                                   is_effect=is_effect,
                                   violations=violations)

    def _extract_effect_expr(self, markdown: str, word: str) -> str:
        m = re.search(r'<!--\s*fx:effect:(.+?)\s*-->', markdown)
        if m:
            return m.group(1).strip()
        m = re.search(r'#\s*effect\s*\{([^}]+)\}', markdown)
        if m:
            return m.group(1).strip()
        return word

    def _extract_constraint_expr(self, markdown: str) -> str:
        m = re.search(r'<!--\s*fx:constraint:(.+?)\s*-->', markdown)
        if m:
            return m.group(1).strip()
        return ''

    def _handle_definition_result(self, result):
        if not result:
            return
        if isinstance(result, list):
            result = result[0] if result else None
        if not result:
            return
        uri  = result.get('uri', '')
        rng  = result.get('range', {})
        line = rng.get('start', {}).get('line', 0)
        col  = rng.get('start', {}).get('character', 0)
        path = uri.replace('file://', '').replace('file:///', '')
        if sys.platform == 'win32' and path.startswith('/'):
            path = path[1:]
        self._open_path(path, jump_line=line, jump_col=col)

    def _handle_symbols_result(self, result):
        if isinstance(result, list):
            self._outline.populate(result)

    def _handle_semantic_tokens(self, result):
        if not result:
            return
        data = result.get('data', [])
        editor = self._cur_editor()
        if not editor:
            return

        # Decode delta encoding
        tokens = []
        line = col = 0
        i = 0
        while i + 4 < len(data):
            dl    = data[i]
            dc    = data[i+1]
            ln    = data[i+2]
            tidx  = data[i+3]
            # modifiers = data[i+4]  -- not used currently
            i += 5
            line += dl
            col   = dc if dl > 0 else col + dc
            if tidx < len(self._sem_token_types):
                tokens.append((self._sem_token_types[tidx], line, col, ln))

        editor._highlighter.apply_semantic_tokens(tokens, editor.document())

    _last_hover_global_pos: QPoint = QPoint(0, 0)












    def _on_hover(self, line: int, col: int, global_pos: QPoint):
        self._last_hover_global_pos = global_pos
        self._hover_tip.hide()
        if not self._lsp or not self._initialized:
            return
        state = self._cur_state()
        if not state or not state.uri:
            return
        if state.uri not in self._parsed_uris:
            return
        import sys as _sys
        word = self._cur_editor().word_at(line, col) if self._cur_editor() else '?'
        req_id = self._lsp.hover(state.uri, line, col)
        self._pending_hover = req_id

    # -----------------------------------------------------------------------
    # Tabs / documents
    # -----------------------------------------------------------------------

    def _new_editor(self) -> IDEKACodeEdit:
        ed = IDEKACodeEdit()
        ed.hover_requested.connect(self._on_hover)
        ed.definition_requested.connect(self._goto_def_at)
        ed.references_requested.connect(self._find_refs_at)
        ed.textChanged.connect(self._on_text_changed)
        ed.cursorPositionChanged.connect(self._update_pos_label)
        return ed

    def _new_file(self):
        ed    = self._new_editor()
        state = DocumentState()
        idx   = self._tabs.addTab(ed, 'Untitled')
        state.editor = ed
        self._docs[idx] = state
        self._tabs.setCurrentIndex(idx)
        ed.setFocus()

    def _open_file(self):
        paths, _ = QFileDialog.getOpenFileNames(
            self, 'Open File', '',
            'IDEKA Files (*.idk);;All Files (*)',
        )
        for path in paths:
            self._open_path(path)

    def _rebuild_recent_menu(self):
        self._recent_menu.clear()
        paths = _load_recent()
        if not paths:
            self._recent_menu.addAction('(empty)').setEnabled(False)
            return
        for path in paths:
            action = self._recent_menu.addAction(path)
            action.triggered.connect(lambda checked, p=path: self._open_path(p))
        self._recent_menu.addSeparator()
        _a(self._recent_menu, 'Clear Recent', None,
           lambda: (_save_recent([]), self._rebuild_recent_menu()))

    def _open_path(self, path: str, jump_line: int = -1, jump_col: int = 0):
        path = os.path.abspath(path)
        # Check if already open
        for idx, state in self._docs.items():
            if state.path == path:
                self._tabs.setCurrentIndex(idx)
                if jump_line >= 0:
                    self._tabs.widget(idx).jump_to(jump_line, jump_col)
                return
        try:
            text = Path(path).read_text(encoding='utf-8', errors='replace')
        except Exception as e:
            QMessageBox.critical(self, 'Error', f'Cannot open {path}:\n{e}')
            return
        _push_recent(path)
        self._rebuild_recent_menu()
        ed    = self._new_editor()
        ed.setPlainText(text)
        state = DocumentState(path)
        name  = Path(path).name
        idx   = self._tabs.addTab(ed, name)
        state.editor = ed
        self._docs[idx] = state
        self._tabs.setCurrentIndex(idx)
        ed.setFocus()

        if jump_line >= 0:
            ed.jump_to(jump_line, jump_col)

        if self._lsp and self._initialized:
            self._lsp.did_open(state.uri, text)
            self._request_symbols(state.uri, idx)
            req_id = self._lsp.semantic_tokens(state.uri)
            self._pending_sem.add(req_id)

    def _save_file(self):
        idx   = self._tabs.currentIndex()
        state = self._docs.get(idx)
        if not state:
            return
        if not state.path:
            self._save_file_as()
            return
        ed = self._cur_editor()
        if not ed:
            return
        try:
            Path(state.path).write_text(ed.toPlainText(), encoding='utf-8')
            state.modified = False
            self._tabs.setTabText(idx, Path(state.path).name)
        except Exception as e:
            QMessageBox.critical(self, 'Error', f'Cannot save:\n{e}')

    def _save_file_as(self):
        idx   = self._tabs.currentIndex()
        state = self._docs.get(idx)
        if not state:
            return
        path, _ = QFileDialog.getSaveFileName(
            self, 'Save As', state.path or '',
            'IDEKA Files (*.idk);;All Files (*)',
        )
        if not path:
            return
        state.path = path
        state.uri  = _path_to_uri(path)
        self._tabs.setTabText(idx, Path(path).name)
        self._save_file()

    def _close_tab(self, idx: int):
        state = self._docs.get(idx)
        if state and state.modified:
            r = QMessageBox.question(
                self, 'Unsaved Changes',
                f'Save changes to {Path(state.path or "Untitled").name}?',
                QMessageBox.StandardButton.Save |
                QMessageBox.StandardButton.Discard |
                QMessageBox.StandardButton.Cancel,
            )
            if r == QMessageBox.StandardButton.Cancel:
                return
            if r == QMessageBox.StandardButton.Save:
                self._save_file()
        if state and state.uri and self._lsp:
            self._lsp.did_close(state.uri)
        self._tabs.removeTab(idx)
        self._docs.pop(idx, None)
        # Re-index remaining tabs
        new_docs = {}
        for i in range(self._tabs.count()):
            old_state = self._docs.get(i + (1 if i >= idx else 0))
            if old_state:
                new_docs[i] = old_state
        self._docs = new_docs

    def _on_tab_changed(self, idx: int):
        self._hover_tip.hide()
        state = self._docs.get(idx)
        if state:
            self._lbl_file.setText(state.path or 'Untitled')
            if self._lsp and self._initialized and state.uri:
                self._request_symbols(state.uri, idx)
        else:
            self._lbl_file.setText('')
            self._outline.clear()

    def _on_text_changed(self):
        idx   = self._tabs.currentIndex()
        state = self._docs.get(idx)
        if not state:
            return
        state.modified = True
        name = Path(state.path or 'Untitled').name
        self._tabs.setTabText(idx, f'{name} *')
        if self._lsp and self._initialized and state.uri:
            ed = self._cur_editor()
            if ed:
                state.version += 1
                self._lsp.did_change(state.uri, ed.toPlainText(), state.version)

    def _request_symbols(self, uri: str, idx: int):
        req_id = self._lsp.document_symbols(uri)
        self._pending_sym.add(req_id)

    # -----------------------------------------------------------------------
    # Navigation
    # -----------------------------------------------------------------------

    def _goto_def(self):
        ed = self._cur_editor()
        if ed:
            cur = ed.textCursor()
            self._goto_def_at(cur.blockNumber(), cur.positionInBlock())

    def _goto_def_at(self, line: int, col: int):
        if not self._lsp or not self._initialized:
            return
        state = self._cur_state()
        if not state or not state.uri:
            return
        req_id = self._lsp.definition(state.uri, line, col)
        self._pending_def.add(req_id)

    def _find_refs(self):
        ed = self._cur_editor()
        if ed:
            cur = ed.textCursor()
            self._find_refs_at(cur.blockNumber(), cur.positionInBlock())

    def _find_refs_at(self, line: int, col: int):
        if not self._lsp or not self._initialized:
            return
        state = self._cur_state()
        if not state or not state.uri:
            return
        self._lsp.references(state.uri, line, col)

    def _goto_line(self):
        from PyQt6.QtWidgets import QInputDialog
        ed = self._cur_editor()
        if not ed:
            return
        line, ok = QInputDialog.getInt(self, 'Go to Line', 'Line number:', 1, 1,
                                       ed.blockCount())
        if ok:
            ed.jump_to(line - 1, 0)

    def _on_outline_symbol(self, line: int, col: int):
        ed = self._cur_editor()
        if ed:
            ed.jump_to(line, col)
            ed.setFocus()

    # -----------------------------------------------------------------------
    # Visualizers
    # -----------------------------------------------------------------------

    def _launch_eg_standalone(self):
        _launch_visualizer('eg.py', '')

    def _launch_tg_standalone(self):
        _launch_visualizer('tg.py', '')

    def _toggle_outline(self):
        self._outline.setVisible(not self._outline.isVisible())

    # -----------------------------------------------------------------------
    # Build / Run
    # -----------------------------------------------------------------------

    def _idkc_path(self) -> str:
        return str(Path(__file__).parent / 'idkc.py')

    def _build(self, *, then_run: bool = False):
        state = self._cur_state()
        if not state or not state.path:
            QMessageBox.warning(self, 'Build', 'Save the file before building.')
            return
        self._save_file()
        idkc      = self._idkc_path()
        path     = state.path
        cwd      = str(Path(path).parent)
        base     = Path(path).stem
        # ic.py outputs to build/<name>/<name>.exe relative to source file dir
        suffix   = '.exe' if sys.platform == 'win32' else ''
        binary   = str(Path(cwd) / 'build' / base / (base + suffix))
        cmd      = [sys.executable, idkc, path] + self._build_opts.extra_flags()
        runner   = self._bottom.start_build(cmd, cwd)

        def _on_done(rc):
            if rc == 0:
                self._compiled_binary = binary
                if then_run:
                    self._run()

        runner.finished_rc.connect(_on_done)

    def _run(self):
        if not self._compiled_binary:
            QMessageBox.information(self, 'Run', 'Build the project first (F5).')
            return
        cwd = str(Path(self._compiled_binary).parent)
        self._bottom.start_run([self._compiled_binary], cwd)

    def _build_and_run(self):
        self._build(then_run=True)

    def _stop(self):
        self._bottom.stop_all()

    # -----------------------------------------------------------------------
    # Helpers
    # -----------------------------------------------------------------------

    def _cur_editor(self) -> Optional[IDEKACodeEdit]:
        w = self._tabs.currentWidget()
        return w if isinstance(w, IDEKACodeEdit) else None

    def _cur_state(self) -> Optional[DocumentState]:
        return self._docs.get(self._tabs.currentIndex())

    def _update_pos_label(self):
        ed = self._cur_editor()
        if not ed:
            return
        cur  = ed.textCursor()
        line = cur.blockNumber() + 1
        col  = cur.positionInBlock() + 1
        self._lbl_pos.setText(f'Ln {line}, Col {col}')

    def closeEvent(self, event):
        for idx in list(self._docs.keys()):
            state = self._docs[idx]
            if state.modified:
                self._tabs.setCurrentIndex(idx)
                r = QMessageBox.question(
                    self, 'Unsaved Changes',
                    f'Save {Path(state.path or "Untitled").name}?',
                    QMessageBox.StandardButton.Save |
                    QMessageBox.StandardButton.Discard |
                    QMessageBox.StandardButton.Cancel,
                )
                if r == QMessageBox.StandardButton.Cancel:
                    event.ignore()
                    return
                if r == QMessageBox.StandardButton.Save:
                    self._save_file()
        if self._lsp:
            self._lsp.stop()
        event.accept()


# ---------------------------------------------------------------------------
# Utility
# ---------------------------------------------------------------------------

def _a(menu, label: str, shortcut: Optional[str], slot):
    action = QAction(label, menu.parent() or menu)
    if shortcut:
        action.setShortcut(QKeySequence(shortcut))
    action.triggered.connect(slot)
    menu.addAction(action)
    return action


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(description='IDEKA IDE')
    ap.add_argument('files', nargs='*', help='Files to open')
    ap.add_argument('--lsp', default=None,
                    help='Path to flsp.py (default: flsp.py in same directory)')
    args = ap.parse_args()

    app = QApplication(sys.argv)
    app.setApplicationName('IDEKA IDE')

    # Resolve LSP command
    lsp_script = args.lsp
    if lsp_script is None:
        for _candidate in [
            Path(__file__).parent / 'flsp.py',
            Path(__file__).parent / 'scripts' / 'flsp.py',
        ]:
            if _candidate.exists():
                lsp_script = str(_candidate)
                break
    lsp_cmd = [sys.executable, lsp_script] if lsp_script else None
    lsp_env = {}
    # Always pass IDEKA_SRCDIR -- default to parent of iide.py if not set
    lsp_env['IDEKA_SRCDIR'] = os.environ.get('IDEKA_SRCDIR',
                                               str(Path(__file__).parent))

    ide = IDEKAIDE(lsp_cmd=lsp_cmd, lsp_env=lsp_env)

    for path in args.files:
        ide._open_path(path)

    if not args.files:
        ide._new_file()

    ide.show()
    sys.exit(app.exec())


if __name__ == '__main__':
    main()