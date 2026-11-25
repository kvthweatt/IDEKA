#!/usr/bin/env python3
"""
IDEKA Language Server (ilsp.py)
Full-featured LSP server for the IDEKA programming language.

Features:
    - Diagnostics (parse errors and warnings underlined in editor)
    - Autocomplete (keywords, snippets, namespaced symbols, using-aware, member completion)
    - Hover (type, kind, member count, enum values)
    - Go-to-definition (current file and all open files)
    - Signature help (parameter hints with active parameter tracking)
    - Document symbols (outline: functions, structs, enums, namespaces)
    - Workspace symbols (project-wide symbol search)
    - Find references (all uses of an identifier in the current file)
    - Rename symbol (across all open documents)
    - Code actions (add missing 'using' statements)
    - Inlay hints (variable type annotations from AST)
    - Semantic token highlighting (full document)
    - #import <> completion (stdlib file names)
    - using completion (all available namespace paths)

Requirements:
    pip install pygls lsprotocol

Usage:
    python ilsp.py          # stdio mode (default, for editors)
    python ilsp.py --tcp    # TCP mode on port 2087 (for debugging)

Environment variables:
    IDEKA_SRCDIR   Path to IDEKA compiler source directory (default: same dir as this script)
    IDEKA_STDLIB    Path to IDEKA stdlib directory for #import completions

Editor config examples
----------------------
Neovim (init.lua):
    vim.lsp.start({
        name = "IDEKA",
        cmd  = { "python3", "/path/to/ilsp.py" },
        filetypes = { "IDEKA" },
        root_dir = vim.fn.getcwd(),
    })

Helix (languages.toml):
    [[language]]
    name = "IDEKA"
    language-servers = ["IDEKA-lsp"]
    file-types = ["fx"]

    [language-server.IDEKA-lsp]
    command = "python3"
    args    = ["/path/to/ilsp.py"]
"""

import sys
import os
import asyncio
import concurrent.futures
import logging
import threading
import traceback
import tempfile
from pathlib import Path
from typing import List, Optional, Dict
from urllib.parse import unquote, urlparse
from dataclasses import dataclass

# ---------------------------------------------------------------------------
# Make the IDEKA compiler modules importable
# ---------------------------------------------------------------------------
_IDEKA_SRCDIR = os.environ.get("IDEKA_SRCDIR", str(Path(__file__).parent.resolve()))
if _IDEKA_SRCDIR not in sys.path:
    sys.path.insert(0, _IDEKA_SRCDIR)

# ---------------------------------------------------------------------------
# pygls / lsprotocol imports
# ---------------------------------------------------------------------------
try:
    from pygls.server import LanguageServer
    from lsprotocol import types as lsp
except Exception as e:
    print(
        f"ERROR: Could not import pygls/lsprotocol: {e}\n"
        "Install them with:  pip install pygls lsprotocol",
        file=sys.stderr,
    )
    sys.exit(1)

# ---------------------------------------------------------------------------
# IDEKA compiler imports
# ---------------------------------------------------------------------------
_IDEKA_import_error: Optional[str] = None
try:
    from fparser import IDEKAParser, ParseError
    from fmacros import build_compiler_macros
    from fast import (
        Program, StructDefStatement, ObjectDefStatement,
        FunctionDefStatement, EnumDefStatement, UnionDefStatement,
        UsingStatement, NamespaceDefStatement, NamespaceDef, VariableDeclaration,
        ConstraDef, EffectDef,
    )
    from ftypesys import SymbolKind, SymbolTable
except Exception as exc:
    _IDEKA_import_error = (
        f"Could not import IDEKA compiler modules: {exc}\n"
        f"Make sure IDEKA_SRCDIR points to the IDEKA repo root, or run this\n"
        f"script from that directory.\n"
        f"IDEKA_SRCDIR = {_IDEKA_SRCDIR}"
    )

# ---------------------------------------------------------------------------
# Logging (goes to stderr so it doesn't corrupt stdio LSP traffic)
# ---------------------------------------------------------------------------
logging.basicConfig(
    stream=sys.stderr,
    level=logging.DEBUG,
    format="%(asctime)s [IDEKA-lsp] %(levelname)s  %(message)s",
)
log = logging.getLogger("IDEKA-lsp")

import builtins
_real_print = builtins.print
def _silent_print(*args, **kwargs):
    kwargs['file'] = sys.stderr
    _real_print(*args, **kwargs)
builtins.print = _silent_print

# ---------------------------------------------------------------------------
# Server instance
# ---------------------------------------------------------------------------
SERVER_NAME    = "IDEKA-lsp"
SERVER_VERSION = "2.0.0"

IDEKA_server = LanguageServer(SERVER_NAME, SERVER_VERSION)

# ---------------------------------------------------------------------------
# Document store and parse cache
# ---------------------------------------------------------------------------
_doc_store:   Dict[str, str]     = {}  # uri -> current text
_parse_cache: Dict[str, Program] = {}  # uri -> last successful Program
_debounce_handles: Dict[str, object] = {}  # uri -> pending asyncio TimerHandle
_parse_executor = concurrent.futures.ThreadPoolExecutor(max_workers=1)
_warn_patch_lock = threading.Lock()  # guards emit_warning monkey-patch

_DEBOUNCE_DELAY = 1.5  # seconds


@dataclass
class _ParseResult:
    program: Optional[Program]
    diags:   List[lsp.Diagnostic]


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def _uri_to_path(uri: str) -> str:
    parsed = urlparse(uri)
    path   = unquote(parsed.path)
    if sys.platform == "win32" and path.startswith("/") and len(path) > 2 and path[2] == ":":
        path = path[1:]
    return path


def _make_range(line: int, col: int, end_col: Optional[int] = None) -> lsp.Range:
    """Convert 1-based line/col to a zero-based LSP Range."""
    ln = max(0, line - 1)
    sc = max(0, col  - 1)
    ec = (sc + 1) if end_col is None else max(sc + 1, end_col - 1)
    return lsp.Range(
        start=lsp.Position(line=ln, character=sc),
        end  =lsp.Position(line=ln, character=ec),
    )


def _diag_from_parse_error(exc) -> lsp.Diagnostic:
    line = getattr(exc, 'display_line', None) or 1
    col  = getattr(exc, 'display_col',  None) or 1
    token     = getattr(exc, 'token', None)
    token_len = len(token.value) if token is not None and isinstance(getattr(token, 'value', None), str) else 1
    end_col   = col + token_len
    return lsp.Diagnostic(
        range    = _make_range(line, col, end_col),
        message  = str(exc),
        severity = lsp.DiagnosticSeverity.Error,
        source   = SERVER_NAME,
    )


def _generic_diag(msg: str) -> lsp.Diagnostic:
    return lsp.Diagnostic(
        range    = _make_range(1, 1),
        message  = msg,
        severity = lsp.DiagnosticSeverity.Error,
        source   = SERVER_NAME,
    )


def _type_spec_str(type_spec) -> str:
    """Format a TypeSystem as a readable string."""
    if type_spec is None:
        return ""
    try:
        name = type_spec.custom_typename or str(type_spec.base_type.value if hasattr(type_spec.base_type, 'value') else type_spec.base_type)
        if type_spec.is_signed:
            name = "signed " + name
        if type_spec.is_array:
            size = type_spec.array_size or ""
            name = f"{name}[{size}]"
        if type_spec.is_pointer:
            name = name + "*" * type_spec.pointer_depth
        return name
    except Exception:
        return str(type_spec)


def _symbol_kind_to_lsp(kind: "SymbolKind") -> lsp.CompletionItemKind:
    return {
        SymbolKind.FUNCTION:  lsp.CompletionItemKind.Function,
        SymbolKind.OPERATOR:  lsp.CompletionItemKind.Function,
        SymbolKind.STRUCT:    lsp.CompletionItemKind.Struct,
        SymbolKind.OBJECT:    lsp.CompletionItemKind.Class,
        SymbolKind.TYPE:      lsp.CompletionItemKind.TypeParameter,
        SymbolKind.ENUM:      lsp.CompletionItemKind.Enum,
        SymbolKind.UNION:     lsp.CompletionItemKind.Struct,
        SymbolKind.NAMESPACE: lsp.CompletionItemKind.Module,
        SymbolKind.VARIABLE:  lsp.CompletionItemKind.Variable,
        SymbolKind.TRAIT:     lsp.CompletionItemKind.Interface,
        SymbolKind.INTERFACE: lsp.CompletionItemKind.Interface,
    }.get(kind, lsp.CompletionItemKind.Text)


def _word_at_position(text: str, position: lsp.Position) -> str:
    """Extract the identifier word under the cursor."""
    lines = text.splitlines()
    if position.line >= len(lines):
        return ""
    line = lines[position.line]
    col  = min(position.character, len(line))
    start = col
    while start > 0 and (line[start - 1].isalnum() or line[start - 1] == '_'):
        start -= 1
    end = col
    while end < len(line) and (line[end].isalnum() or line[end] == '_'):
        end += 1
    return line[start:end]


def _word_range_at_position(text: str, position: lsp.Position) -> lsp.Range:
    lines = text.splitlines()
    if position.line >= len(lines):
        return _make_range(position.line + 1, 1)
    line = lines[position.line]
    col  = min(position.character, len(line))
    start = col
    while start > 0 and (line[start - 1].isalnum() or line[start - 1] == '_'):
        start -= 1
    end = col
    while end < len(line) and (line[end].isalnum() or line[end] == '_'):
        end += 1
    return lsp.Range(
        start=lsp.Position(line=position.line, character=start),
        end  =lsp.Position(line=position.line, character=end),
    )


def _qualified_word_at_position(text: str, position: lsp.Position) -> str:
    """Extract the full qualified identifier under the cursor, spanning :: separators.
    e.g. cursor on 'print' in 'standard::io::console::print' returns the full string.
    Falls back to bare word if no :: context.
    """
    lines = text.splitlines()
    if position.line >= len(lines):
        return ""
    line = lines[position.line]
    col  = min(position.character, len(line))

    # Extend right to end of current segment
    end = col
    while end < len(line) and (line[end].isalnum() or line[end] == '_'):
        end += 1

    # Extend left, crossing :: boundaries
    start = col
    while start > 0 and (line[start - 1].isalnum() or line[start - 1] == '_'):
        start -= 1
    # Keep consuming ::segment to the left
    while start >= 2 and line[start - 2:start] == '::':
        start -= 2
        while start > 0 and (line[start - 1].isalnum() or line[start - 1] == '_'):
            start -= 1

    # Keep consuming ::segment to the right
    pos = end
    while pos + 2 <= len(line) and line[pos:pos + 2] == '::':
        pos += 2
        seg_end = pos
        while seg_end < len(line) and (line[seg_end].isalnum() or line[seg_end] == '_'):
            seg_end += 1
        if seg_end == pos:
            break
        end = seg_end
        pos = end

    return line[start:end]


def _resolve_qualified(program: Program, qualified: str):
    """Resolve a qualified name (may contain ::) to a SymbolEntry.
    Tries mangled direct lookup first, then resolves via using statements
    from the AST (symbol_table.using_namespaces is not populated at parse time).
    """
    if '::' in qualified:
        mangled = qualified.replace('::', '__')
        entry = program.symbol_table._global_symbols.get(mangled)
        if entry:
            return entry
        # Try bare name resolution through using namespaces
        bare = qualified.split('::')[-1]
    else:
        bare = qualified

    # Direct global lookup (non-namespaced symbol)
    entry = program.symbol_table._global_symbols.get(bare)
    if entry:
        return entry

    # Resolve via using statements in the AST
    for stmt in program.statements:
        if not isinstance(stmt, UsingStatement):
            continue
        ns_mangled = stmt.namespace_path.replace('::', '__')
        candidate = ns_mangled + '__' + bare
        entry = program.symbol_table._global_symbols.get(candidate)
        if entry:
            return entry

    return None


def _word_before_dot(text: str, position: lsp.Position) -> str:
    """Extract the identifier immediately before a dot on the cursor line."""
    lines = text.splitlines()
    if position.line >= len(lines):
        return ""
    line = lines[position.line]
    col  = min(position.character - 1, len(line) - 1)
    # Skip the dot itself and any whitespace before it
    while col >= 0 and line[col] in (' ', '\t', '.'):
        col -= 1
    end = col + 1
    while col > 0 and (line[col - 1].isalnum() or line[col - 1] == '_'):
        col -= 1
    return line[col:end]


# ---------------------------------------------------------------------------
# Keyword / snippet completions (always offered)
# ---------------------------------------------------------------------------

_IDEKA_SNIPPETS = [
    # (label, insert_text, detail)
    ("cdecl",      "cdecl ${1:name}(${2:params}) -> ${3:void}\n{\n    $0\n};",  "function declaration"),
    ("struct",     "struct ${1:Name}\n{\n    $0\n};",                           "struct definition"),
    ("object",     "object ${1:Name}\n{\n    $0\n};",                           "object definition"),
    ("enum",       "enum ${1:Name}\n{\n    $0\n};",                             "enum definition"),
    ("union",      "union ${1:Name}\n{\n    $0\n};",                            "union definition"),
    ("namespace",  "namespace ${1:Name}\n{\n    $0\n};",                        "namespace"),
    ("macro",      "macro ${1:name}\n{\n    $0\n};",                            "macro block"),
    ("interface",  "interface ${1:Name}\n{\n    $0\n};",                        "interface definition"),
    ("trait",      "trait ${1:Name}\n{\n    $0\n};",                            "trait definition"),
    ("comptime",   "comptime\n{\n    $0\n};",                                   "compile-time block"),
    ("emitideka",   "emitideka\n{\n    $0\n};",                                   "inline IDEKA IR"),
    ("extern",     "extern\n{\n    $0\n};",                                     "extern block"),
    ("heap",       "heap ${1:Type} ${2:name};",                                 "heap allocation"),
    ("#import",    "#import <${1:file.idk}>;",                                   "import"),
    ("#def",       "#def ${1:NAME} ${2:value};",                                "macro constant"),
    ("#ifdef",     "#ifdef ${1:NAME};",                                         "conditional compilation"),
    ("#ifndef",    "#ifndef ${1:NAME};",                                        "conditional compilation"),
    ("#endif",     "#endif;",                                                   "end conditional"),
    ("#psub",      "#psub ${1:name}(${2:params}) ${3:body};",                   "parameterized substitution"),
    ("if",         "if (${1:cond})\n{\n    $0\n};",                             "if statement"),
    ("elif",       "elif (${1:cond})\n{\n    $0\n};",                           "else if"),
    ("else",       "else\n{\n    $0\n};",                                       "else"),
    ("while",      "while (${1:cond})\n{\n    $0\n};",                          "while loop"),
    ("for",        "for (${1:init}; ${2:cond}; ${3:inc})\n{\n    $0\n};",       "for loop"),
    ("loop",       "loop\n{\n    $0\n};",                                       "infinite loop"),
    ("match",      "match (${1:expr})\n{\n    $0\n};",                          "match expression"),
    ("return",     "return ${1:value};",                                        "return statement"),
    ("break",      "break;",                                                    "break"),
    ("continue",   "continue;",                                                 "continue"),
]

_IDEKA_KEYWORDS = [
    "void", "int", "uint", "long", "ulong", "byte", "bool", "float", "double",
    "i8", "u8", "i16", "u16", "true", "false", "null",
    "signed", "unsigned", "const", "volatile", "static", "inline",
    "heap", "stack", "global", "local", "export", "extern",
    "noinit", "noreturn", "no_mangle",
]


def _keyword_completions() -> List[lsp.CompletionItem]:
    items = []
    for label, snippet, detail in _IDEKA_SNIPPETS:
        items.append(lsp.CompletionItem(
            label=label,
            kind=lsp.CompletionItemKind.Keyword,
            detail=detail,
            insert_text=snippet,
            insert_text_format=lsp.InsertTextFormat.Snippet,
        ))
    for kw in _IDEKA_KEYWORDS:
        items.append(lsp.CompletionItem(
            label=kw,
            kind=lsp.CompletionItemKind.Keyword,
            insert_text=kw,
        ))
    return items

_CACHED_KEYWORD_COMPLETIONS: Optional[List[lsp.CompletionItem]] = None

def _get_keyword_completions() -> List[lsp.CompletionItem]:
    global _CACHED_KEYWORD_COMPLETIONS
    if _CACHED_KEYWORD_COMPLETIONS is None:
        _CACHED_KEYWORD_COMPLETIONS = _keyword_completions()
    return list(_CACHED_KEYWORD_COMPLETIONS)


# ---------------------------------------------------------------------------
# Parse
# ---------------------------------------------------------------------------

def _parse_text(text: str, original_path: str) -> _ParseResult:
    """Parse IDEKA source text. Returns last good Program if parse fails."""
    import ferrors as _ferrors
    prev_cwd = os.getcwd()
    tmp_path = None
    captured_warnings: List[lsp.Diagnostic] = []

    _orig_emit = _ferrors.emit_warning

    def _capturing_emit(message, token=None, source_lines=None, line_map=None):
        _orig_emit(message, token, source_lines, line_map)
        line = max(0, (getattr(token, 'line', 1) or 1) - 1)
        col  = max(0, (getattr(token, 'column', 1) or 1) - 1)
        captured_warnings.append(lsp.Diagnostic(
            range=lsp.Range(
                start=lsp.Position(line=line, character=col),
                end=lsp.Position(line=line, character=col + 1),
            ),
            message=message,
            severity=lsp.DiagnosticSeverity.Warning,
            source='IDEKA-lsp',
        ))

    with _warn_patch_lock:
        _ferrors.emit_warning = _capturing_emit
        try:
            os.chdir(_IDEKA_SRCDIR)
            suffix = Path(original_path).suffix or ".idk"
            with tempfile.NamedTemporaryFile(
                suffix=suffix, mode='w', delete=False, encoding='utf-8',
                dir=str(Path(original_path).parent)
            ) as f:
                f.write(text)
                tmp_path = f.name
            parser  = IDEKAParser.from_file(tmp_path, compiler_macros=build_compiler_macros())
            program = parser.parse()
            program._line_map  = parser._line_map
            program._constras  = dict(getattr(parser, '_constras', {}))
            log.debug("_constras stored: %r parser_has=%r stmt_types=%r",
                      list(program._constras.keys()),
                      hasattr(parser, '_constras'),
                      [type(s).__name__ for s in program.statements[:5]])
            return _ParseResult(program=program, diags=captured_warnings)
        except Exception as exc:
            cause = exc
            if isinstance(exc, ValueError) and isinstance(getattr(exc, '__cause__', None), ParseError):
                cause = exc.__cause__
            if isinstance(cause, ParseError):
                return _ParseResult(program=None, diags=[_diag_from_parse_error(cause)])
            log.debug("Parse error:\n%s", traceback.format_exc())
            return _ParseResult(program=None, diags=[_generic_diag(f"Internal error: {exc}")])
        finally:
            _ferrors.emit_warning = _orig_emit
            os.chdir(prev_cwd)
            if tmp_path and os.path.exists(tmp_path):
                try:
                    os.unlink(tmp_path)
                except OSError:
                    pass


def _register_toplevel_symbols(program: Program) -> None:
    """
    Register top-level definitions into _global_symbols directly,
    bypassing scope_level checks which may be non-zero after parse.
    """
    gs = program.symbol_table._global_symbols
    _KIND_MAP = {
        'FunctionDefStatement': (SymbolKind.FUNCTION, 'function_def'),
        'FunctionDef':          (SymbolKind.FUNCTION, None),
        'StructDefStatement':   (SymbolKind.STRUCT,   'struct_def'),
        'StructDef':            (SymbolKind.STRUCT,   None),
        'ObjectDefStatement':   (SymbolKind.OBJECT,   'object_def'),
        'ObjectDef':            (SymbolKind.OBJECT,   None),
        'EnumDefStatement':     (SymbolKind.ENUM,     'enum_def'),
        'EnumDef':              (SymbolKind.ENUM,     None),
        'UnionDefStatement':    (SymbolKind.UNION,    'union_def'),
        'UnionDef':             (SymbolKind.UNION,    None),
    }
    for stmt in program.statements:
        cls = type(stmt).__name__
        if cls not in _KIND_MAP:
            continue
        kind, attr = _KIND_MAP[cls]
        # Raw node (attr=None): the stmt itself is the def
        defn = getattr(stmt, attr, None) if attr else stmt
        if defn is None:
            continue
        name = getattr(defn, 'name', None)
        if not name or name in gs:
            continue
        type_spec = getattr(defn, 'return_type', None)
        from ftypesys import SymbolEntry
        entry = SymbolEntry(kind=kind, name=name, namespace='', type_spec=type_spec)
        gs[name] = entry


async def _validate_async(ls: LanguageServer, uri: str) -> None:
    if _IDEKA_import_error:
        ls.publish_diagnostics(uri, [_generic_diag(_IDEKA_import_error)])
        return

    text = _doc_store.get(uri, "")
    path = _uri_to_path(uri)
    log.debug("Validating %s (%d chars)", path, len(text))

    loop = asyncio.get_event_loop()
    result = await loop.run_in_executor(_parse_executor, _parse_text, text, path)

    if result.program is not None:
        _parse_cache[uri] = result.program
        try:
            result.program._lsp_uri = uri
        except Exception:
            pass
        # Register top-level definitions that the parser doesn't put in the symbol table
        _register_toplevel_symbols(result.program)
        log.debug("toplevel registered: main=%r stmt_type_counts=%r",
                  'main' in result.program.symbol_table._global_symbols,
                  {t: sum(1 for s in result.program.statements if type(s).__name__ == t)
                   for t in set(type(s).__name__ for s in result.program.statements)})
        # Invalidate the function index cache so it rebuilds with new symbols
        try:
            del result.program._lsp_func_index
        except AttributeError:
            pass
        log.debug("Parse succeeded, cache updated for %s", path)
        # Notify IDE that parse succeeded so hover can be enabled
        ls.show_message_log(f"fx:parse-ok:{uri}", lsp.MessageType.Log)
    else:
        log.debug("Parse failed for %s, keeping stale cache", path)

    ls.publish_diagnostics(uri, result.diags)
    log.debug("Published %d diagnostic(s) for %s", len(result.diags), path)


def _validate(ls: LanguageServer, uri: str) -> None:
    """Schedule async validation. Safe to call from the event loop or call_later."""
    asyncio.ensure_future(_validate_async(ls, uri))


def _namespace_before_colons(text: str, position: lsp.Position) -> Optional[str]:
    """Extract the namespace path before `::` at the cursor.
    e.g. `standard::io::` -> `standard__io` (matching parser storage format)
    Returns None if cursor is not immediately after `::`.
    """
    lines = text.splitlines()
    if position.line >= len(lines):
        return None
    line = lines[position.line]
    col  = position.character
    # Must have at least `::` before cursor
    if col < 2 or line[col-2:col] != '::':
        return None
    # Walk backward past `::` to collect the full namespace path
    i = col - 3  # character just before the '::'
    parts = []
    while i >= 0:
        end = i + 1
        while i >= 0 and (line[i].isalnum() or line[i] == '_'):
            i -= 1
        seg = line[i+1:end]
        if not seg:
            break
        parts.append(seg)
        if i >= 1 and line[i-1:i+1] == '::':
            i -= 2
        else:
            break
    if not parts:
        return None
    parts.reverse()
    # Parser stores namespace with __ separator: standard::io -> standard__io
    return '__'.join(parts)


def _toplevel_namespace_completions(program: Program) -> List[lsp.CompletionItem]:
    """Return the set of top-level namespace segments present in the symbol table."""
    seen: set = set()
    items = []
    for sym_name in program.symbol_table._global_symbols:
        if '__' not in sym_name:
            continue
        seg = sym_name.split('__')[0]
        if seg and seg not in seen:
            seen.add(seg)
            items.append(lsp.CompletionItem(
                label=seg,
                kind=lsp.CompletionItemKind.Module,
                detail="namespace",
            ))
    return items


# ---------------------------------------------------------------------------
# Function snippet helper
# ---------------------------------------------------------------------------

def _build_location_index(program: Program) -> Dict[str, tuple]:
    """Build a name -> (short_filename, line) index for all definitions in the program.
    Cached on the program object.
    """
    if hasattr(program, '_lsp_location_index'):
        return program._lsp_location_index

    uri = getattr(program, '_lsp_uri', '')
    short_name = Path(_uri_to_path(uri)).name if uri else ''

    index: Dict[str, tuple] = {}

    def _record(name, defn):
        line = getattr(defn, 'source_line', 0)
        if line and name:
            index[name] = (short_name, line)

    def _index_stmts(stmts):
        for stmt in stmts:
            if isinstance(stmt, FunctionDefStatement):
                _record(stmt.function_def.name, stmt.function_def)
            elif isinstance(stmt, StructDefStatement):
                _record(stmt.struct_def.name, stmt.struct_def)
            elif isinstance(stmt, ObjectDefStatement):
                _record(stmt.object_def.name, stmt.object_def)
            elif isinstance(stmt, EnumDefStatement):
                _record(stmt.enum_def.name, stmt.enum_def)
            elif isinstance(stmt, UnionDefStatement):
                _record(stmt.union_def.name, stmt.union_def)
            elif isinstance(stmt, VariableDeclaration):
                _record(stmt.name, stmt)
            elif isinstance(stmt, (NamespaceDefStatement, NamespaceDef)):
                ns = stmt.namespace_def if isinstance(stmt, NamespaceDefStatement) else stmt
                for fn in ns.functions:
                    _record(fn.name, fn)
                for s in ns.structs:
                    _record(s.name, s)
                for o in ns.objects:
                    _record(o.name, o)
                for e in ns.enums:
                    _record(e.name, e)
                for u in ns.unions:
                    _record(u.name, u)
                for v in ns.variables:
                    _record(v.name, v)
                for nested in ns.nested_namespaces:
                    _index_stmts([nested])

    _index_stmts(program.statements)

    try:
        program._lsp_location_index = index
    except Exception:
        pass
    return index


def _location_detail(bare_name: str, program: Program, type_detail: str, doc_text: str = "") -> str:
    """Return a detail string combining type info and source location.
    Only shows location if the name appears in the current document text,
    to avoid showing misleading locations from transitively imported files.
    """
    if doc_text and bare_name not in doc_text:
        return type_detail
    loc_index = _build_location_index(program)
    loc = loc_index.get(bare_name)
    if loc:
        filename, line = loc
        loc_str = f"{filename}:{line}" if filename else f"line {line}"
        return f"{type_detail}  [{loc_str}]" if type_detail else f"[{loc_str}]"
    return type_detail


def _func_snippet(label: str, program: Program, mangled_name: str = "") -> tuple:
    """Build a snippet insert text for a function call, e.g. 'print(${1:msg})'.
    Returns (insert_text, insert_text_format).
    Falls back to bare label with $0 cursor if no FunctionDef is found.
    """
    bare = label.split('::')[-1]
    func_def = _find_function_def(program, bare, mangled_name)
    if func_def is None or not func_def.parameters:
        return f"{label}($0)", lsp.InsertTextFormat.Snippet
    params = []
    for idx, p in enumerate(func_def.parameters, 1):
        pname = p.name or f"arg{idx}"
        params.append(f"${{{idx}:{pname}}}")
    return f"{label}({', '.join(params)})", lsp.InsertTextFormat.Snippet


# ---------------------------------------------------------------------------
# Namespace completions
# ---------------------------------------------------------------------------

def _namespace_completions(program: Program, ns_path: str, doc_text: str = "") -> List[lsp.CompletionItem]:
    """Return all symbols whose name is directly inside ns_path (__ separated)."""
    if not ns_path:
        return []
    prefix = ns_path + '__'
    items = []
    seen: set = set()
    for sym_name, entry in program.symbol_table._global_symbols.items():
        # Only match names that start with the prefix
        if not sym_name.startswith(prefix):
            continue
        # The remainder after the prefix must be a single segment (no more __)
        remainder = sym_name[len(prefix):]
        if '__' in remainder:
            # This is a deeper namespace -- offer the next segment as a sub-namespace
            next_seg = remainder.split('__')[0]
            if next_seg and next_seg not in seen:
                seen.add(next_seg)
                items.append(lsp.CompletionItem(
                    label=next_seg,
                    kind=lsp.CompletionItemKind.Module,
                    detail="namespace",
                ))
        else:
            # Direct member of this namespace
            if remainder and remainder not in seen:
                seen.add(remainder)
                if entry.kind == SymbolKind.FUNCTION:
                    detail = f"-> {_type_spec_str(entry.type_spec)}" if entry.type_spec else "function"
                    insert, fmt = _func_snippet(remainder, program, sym_name)
                else:
                    detail = _type_spec_str(entry.type_spec) if entry.type_spec else entry.kind.value
                    insert, fmt = remainder, lsp.InsertTextFormat.PlainText
                detail = _location_detail(entry.name, program, detail, doc_text)
                items.append(lsp.CompletionItem(
                    label=remainder,
                    kind=_symbol_kind_to_lsp(entry.kind),
                    detail=detail,
                    insert_text=insert,
                    insert_text_format=fmt,
                    documentation=lsp.MarkupContent(
                        kind=lsp.MarkupKind.PlainText,
                        value=f"{entry.kind.value}: {sym_name.replace('__', '::')}",
                    ),
                ))
    log.debug("_namespace_completions ns_path=%r returning %d items", ns_path, len(items))
    return items


# ---------------------------------------------------------------------------
# Member completion helper
# ---------------------------------------------------------------------------

def _member_completions(program: Program, var_name: str) -> List[lsp.CompletionItem]:
    """Return field completions for the type of var_name."""
    entry = _resolve_qualified(program, var_name)
    if entry is None or entry.type_spec is None:
        return []

    type_name = entry.type_spec.custom_typename
    if not type_name:
        return []

    type_index = _build_type_index(program)
    hit = type_index.get(type_name)
    if hit is None:
        return []

    kind_str, defn = hit
    label_suffix = {
        'struct': f"field of {type_name}",
        'object': f"member of {type_name}",
        'union':  f"member of union {type_name}",
    }.get(kind_str, f"member of {type_name}")

    return [
        lsp.CompletionItem(
            label=m.name,
            kind=lsp.CompletionItemKind.Field,
            detail=_type_spec_str(m.type_spec),
            documentation=label_suffix,
        )
        for m in defn.members
    ]


# ---------------------------------------------------------------------------
# LSP lifecycle
# ---------------------------------------------------------------------------

@IDEKA_server.feature(lsp.INITIALIZE)
def on_initialize(ls: LanguageServer, params: lsp.InitializeParams):
    log.info("IDEKA LSP initializing (client: %s)", getattr(params, "client_info", "unknown"))
    if _IDEKA_import_error:
        log.error(_IDEKA_import_error)


@IDEKA_server.feature(lsp.INITIALIZED)
def on_initialized(ls: LanguageServer, params: lsp.InitializedParams):
    log.info("IDEKA LSP ready.")
    # Inject semantic tokens legend now that server capabilities are finalized.
    try:
        caps = ls.server_capabilities
        if caps is not None:
            caps.semantic_tokens_provider = lsp.SemanticTokensOptions(
                legend=lsp.SemanticTokensLegend(
                    token_types=_SEMANTIC_TOKEN_TYPES,
                    token_modifiers=_SEMANTIC_TOKEN_MODIFIERS,
                ),
                full=True,
                range=False,
            )
    except Exception as e:
        log.warning("Could not set semantic tokens capabilities: %s", e)


def _schedule_validate(ls: LanguageServer, uri: str) -> None:
    """Cancel any pending parse for uri and schedule a new one after the debounce delay."""
    handle = _debounce_handles.pop(uri, None)
    if handle is not None:
        handle.cancel()
        log.debug("debounce: cancelled pending parse for %s", uri.split('/')[-1])
    loop = asyncio.get_event_loop()
    _debounce_handles[uri] = loop.call_later(_DEBOUNCE_DELAY, _validate, ls, uri)
    log.debug("debounce: scheduled parse in %.1fs for %s", _DEBOUNCE_DELAY, uri.split('/')[-1])


@IDEKA_server.feature(lsp.TEXT_DOCUMENT_DID_OPEN)
def did_open(ls: LanguageServer, params: lsp.DidOpenTextDocumentParams):
    _doc_store[params.text_document.uri] = params.text_document.text
    _schedule_validate(ls, params.text_document.uri)


@IDEKA_server.feature(lsp.TEXT_DOCUMENT_DID_CHANGE)
def did_change(ls: LanguageServer, params: lsp.DidChangeTextDocumentParams):
    uri = params.text_document.uri
    for change in params.content_changes:
        # Full-document sync: change.text is the entire new content
        if not hasattr(change, 'range') or change.range is None:
            _doc_store[uri] = change.text
        else:
            # Incremental: apply the range replacement
            current = _doc_store.get(uri, "")
            lines = current.splitlines(keepends=True)
            start = change.range.start
            end   = change.range.end

            # Convert to flat offset
            def to_offset(text_lines, line, char):
                off = sum(len(text_lines[i]) for i in range(min(line, len(text_lines))))
                if line < len(text_lines):
                    off += min(char, len(text_lines[line]))
                return off

            s_off = to_offset(lines, start.line, start.character)
            e_off = to_offset(lines, end.line, end.character)
            _doc_store[uri] = current[:s_off] + change.text + current[e_off:]
    _schedule_validate(ls, uri)


@IDEKA_server.feature(lsp.TEXT_DOCUMENT_DID_SAVE)
def did_save(ls: LanguageServer, params: lsp.DidSaveTextDocumentParams):
    _schedule_validate(ls, params.text_document.uri)


@IDEKA_server.feature(lsp.TEXT_DOCUMENT_DID_CLOSE)
def did_close(ls: LanguageServer, params: lsp.DidCloseTextDocumentParams):
    uri = params.text_document.uri
    handle = _debounce_handles.pop(uri, None)
    if handle is not None:
        handle.cancel()
    _doc_store.pop(uri, None)
    _parse_cache.pop(uri, None)
    ls.publish_diagnostics(params.text_document.uri, [])


# ---------------------------------------------------------------------------
# Completion
# ---------------------------------------------------------------------------

@IDEKA_server.feature(
    lsp.TEXT_DOCUMENT_COMPLETION,
    lsp.CompletionOptions(trigger_characters=[".", ":"])
)
def completion(ls: LanguageServer, params: lsp.CompletionParams):
    uri     = params.text_document.uri
    program = _parse_cache.get(uri)
    text    = _doc_store.get(uri, "")

    # Detect :: trigger first -- keywords/snippets never follow ::
    trigger = getattr(params.context, 'trigger_character', None) if params.context else None
    lines = text.splitlines()
    line_text = lines[params.position.line] if params.position.line < len(lines) else ""
    col = params.position.character
    two_before = line_text[max(0, col-2):col]

    if two_before == '::':
        if program is None:
            return lsp.CompletionList(is_incomplete=False, items=[])
        ns_path = _namespace_before_colons(text, params.position)
        log.debug("completion :: detected, ns_path=%r", ns_path)
        if ns_path:
            ns_items = _namespace_completions(program, ns_path, text)
        else:
            ns_items = _toplevel_namespace_completions(program)
        return lsp.CompletionList(is_incomplete=False, items=ns_items)

    # Detect #import <> context -- offer known stdlib file names
    stripped = line_text[:col].lstrip()
    if stripped.startswith('#import') and '<' in stripped and '>' not in stripped:
        return lsp.CompletionList(is_incomplete=False, items=_import_completions())

    # Detect #import "" context -- offer local .idk files relative to document
    if stripped.startswith('#import') and '"' in stripped and stripped.count('"') % 2 == 1:
        doc_dir = str(Path(_uri_to_path(uri)).parent)
        local_items = []
        if os.path.isdir(doc_dir):
            for fname in sorted(os.listdir(doc_dir)):
                if fname.endswith('.idk'):
                    local_items.append(lsp.CompletionItem(
                        label=fname,
                        kind=lsp.CompletionItemKind.File,
                        detail="local file",
                    ))
        return lsp.CompletionList(is_incomplete=False, items=local_items)

    items = _get_keyword_completions()

    if program is None:
        return lsp.CompletionList(is_incomplete=False, items=items)

    # Detect 'using ' context -- offer namespace paths
    stripped = line_text[:col].lstrip()
    if stripped.startswith('using ') or stripped == 'using':
        ns_paths = _all_namespace_paths(program)
        using_items = [
            lsp.CompletionItem(
                label=p,
                kind=lsp.CompletionItemKind.Module,
                detail="namespace",
            )
            for p in ns_paths
        ]
        return lsp.CompletionList(is_incomplete=False, items=using_items)

    # Detect dot trigger -- offer member completions only
    if trigger == '.' or (col > 0 and line_text[col-1:col] == '.'):
        var_name = _word_before_dot(text, params.position)
        if var_name:
            member_items = _member_completions(program, var_name)
            if member_items:
                return lsp.CompletionList(is_incomplete=False, items=member_items)

    # Symbols from active 'using' namespaces
    items.extend(_using_aware_completions(program, text))

    # Global symbol completions -- skip namespaced symbols (those belong to :: navigation)
    seen = set()
    for name, entry in program.symbol_table._global_symbols.items():
        bare = entry.name
        if '__' in bare:
            continue
        if bare in seen:
            continue
        seen.add(bare)

        display_name = bare.replace('__', '::')

        # Build detail string
        if entry.kind == SymbolKind.FUNCTION:
            detail = f"-> {_type_spec_str(entry.type_spec)}" if entry.type_spec else "function"
            insert, fmt = _func_snippet(display_name, program, bare)
        else:
            detail = _type_spec_str(entry.type_spec) if entry.type_spec else entry.kind.value
            insert, fmt = display_name, lsp.InsertTextFormat.PlainText

        detail = _location_detail(bare, program, detail, text)
        full_display = entry.full_name.replace('__', '::') if entry.full_name else display_name

        items.append(lsp.CompletionItem(
            label=display_name,
            kind=_symbol_kind_to_lsp(entry.kind),
            detail=detail,
            sort_text=f"1_{display_name}",
            insert_text=insert,
            insert_text_format=fmt,
            documentation=lsp.MarkupContent(
                kind=lsp.MarkupKind.PlainText,
                value=f"{entry.kind.value}: {full_display}",
            ),
        ))

    return lsp.CompletionList(is_incomplete=False, items=items)


# ---------------------------------------------------------------------------
# Hover
# ---------------------------------------------------------------------------

def _effect_expr_str(annotation) -> str:
    """Extract the effect expression string from an EffectAnnotation or AttenuateAnnotation."""
    if annotation is None:
        return ''
    try:
        expr = annotation.effects
        s = str(expr).strip()
        if s.startswith('(') and s.endswith(')'):
            s = s[1:-1].strip()
        return s
    except Exception:
        return ''


def _hover_effect_lines(func_def) -> str:
    """Build markdown lines for effect/attenuate annotations on a function def."""
    lines = []
    if func_def is None:
        return ''
    ea = getattr(func_def, 'effect_annotation', None)
    if ea:
        expr = _effect_expr_str(ea)
        if expr:
            lines.append(f'\n\n`# effect {{` `{expr}` `}}`')
    aa = getattr(func_def, 'attenuate_annotation', None)
    if aa:
        expr = _effect_expr_str(aa)
        if expr:
            lines.append(f'\n\n`# attenuate {{` `{expr}` `}}`')
    return ''.join(lines)


_BUILTIN_EFFECT_ROOTS = {
    'IO', 'Alloc', 'Unsafe', 'Mem', 'Sync', 'Crypto',
    'Process', 'Hook', 'Privilege', 'Time', 'Pure', 'Throw',
    'IO.Console', 'IO.File', 'IO.Socket', 'IO.Pipe', 'IO.Device',
    'IO.Serial', 'IO.USB', 'IO.GPU',
    'Alloc.Heap', 'Alloc.Pool', 'Alloc.Stack', 'Alloc.Virtual', 'Alloc.Shared',
    'Unsafe.Ptr', 'Unsafe.Cast', 'Unsafe.ASM', 'Unsafe.FFI', 'Unsafe.Uninit',
    'Mem.Read', 'Mem.Write', 'Mem.Exec',
    'Mem.Read.Process', 'Mem.Read.Kernel', 'Mem.Read.Mapped',
    'Mem.Write.Process', 'Mem.Write.Kernel', 'Mem.Write.Exec', 'Mem.Write.Mapped',
    'Mem.Exec.JIT', 'Mem.Exec.Shellcode',
    'Sync.Lock', 'Sync.Atomic', 'Sync.Signal', 'Sync.Wait',
    'Crypto.Hash', 'Crypto.Encrypt', 'Crypto.Decrypt', 'Crypto.Random', 'Crypto.Key',
    'Process.Spawn', 'Process.Kill', 'Process.Inject', 'Process.Suspend', 'Process.Token',
    'Hook.Detour', 'Hook.IAT', 'Hook.SSDT', 'Hook.Vtable', 'Hook.Exception',
    'Privilege.Elevate', 'Privilege.Drop', 'Privilege.Check',
    'Time.RealTime', 'Time.Sleep', 'Time.Timer',
}


def _hover_effect_name(program, word: str, text: str, position, uri: str):
    """Return a Hover for an effect name (built-in or user-defined EffectDef)."""
    # Check built-in effects
    is_builtin = word in _BUILTIN_EFFECT_ROOTS
    # Check user-defined effect declarations
    user_def = None
    for stmt in program.statements:
        if isinstance(stmt, EffectDef) and stmt.name == word:
            user_def = stmt
            break

    if not is_builtin and user_def is None:
        return None

    if user_def is not None:
        expr_str = str(user_def.body).strip() if user_def.body else word
        # Strip outer parens if present
        if expr_str.startswith('(') and expr_str.endswith(')'):
            expr_str = expr_str[1:-1].strip()
        md = f'**effect** `{word}`\n\n`{expr_str}`'
        eg_expr = expr_str
    else:
        md = f'**effect** `{word}`'
        eg_expr = word

    md += f'\n\n<!-- fx:effect:{eg_expr} -->'

    # Source location
    current_path = _uri_to_path(uri)
    if user_def is not None:
        line_map = getattr(program, '_line_map', None)
        src_line = getattr(user_def, 'source_line', None)
        if line_map and src_line and src_line > 0 and src_line <= len(line_map):
            origin, _ = line_map[src_line - 1]
            current_path = str(Path(origin).resolve()) if origin else current_path
    md += f'\n\n*{current_path}*'

    return lsp.Hover(
        contents=lsp.MarkupContent(kind=lsp.MarkupKind.Markdown, value=md),
        range=_word_range_at_position(text, position),
    )
    """
    Convert a ConstraDef's relations into a type geometry expression string
    that tg.py / vizcore.py can parse.
    e.g. relations = [(['A'], '~=', ['B']), (['A'], '!~=', ['C'])]
      -> "A ~= B & A !~= C"
    """
    parts = []
    for lhs_names, op, rhs_names in getattr(constra_def, 'relations', []):
        lhs = ' & '.join(lhs_names) if isinstance(lhs_names, list) else str(lhs_names)
        rhs = ' & '.join(rhs_names) if isinstance(rhs_names, list) else str(rhs_names)
        parts.append(f'{lhs} {op} {rhs}')
    return ' & '.join(parts)


def _hover_constraint(program, word: str, text: str, position, uri: str):
    """
    Return a Hover for a constraint name, including:
    - kind label + name
    - parameter list
    - relation expression (for TG visualizer)
    - source file
    - <!-- fx:constraint:EXPR --> marker for the IDE
    """
    constras = getattr(program, '_constras', {})
    if word not in constras:
        return None

    params, relations = constras[word]
    params_str = f'({", ".join(params)})' if params else ''
    md = f'**constraint** `{word}{params_str}`'

    # Extract raw body directly from source text
    raw_body = None
    try:
        # Find "constraint word" then extract between { and }
        import re as _re
        m = _re.search(r'\bconstraint\s+' + _re.escape(word) + r'\s*(?:\([^)]*\))?\s*\{([^}]*)\}', text, _re.DOTALL)
        if m:
            body = m.group(1)
            # Strip comments and collapse whitespace
            body = _re.sub(r'//[^\n]*', '', body)
            raw_body = ' '.join(body.split()).strip()
    except Exception:
        pass

    tg_expr = raw_body or _constra_tg_expr(type('_CD', (), {'relations': relations})())
    if tg_expr:
        md += f'\n\n`{tg_expr}`'
        md += f'\n\n<!-- fx:constraint:{tg_expr} -->'

    # Source file location
    line_map = getattr(program, '_line_map', None)
    src_line = None
    for stmt in program.statements:
        if isinstance(stmt, ConstraDef) and stmt.name == word:
            src_line = getattr(stmt, 'source_line', None)
            break

    current_path = _uri_to_path(uri)
    if line_map and src_line and src_line > 0 and src_line <= len(line_map):
        origin, _ = line_map[src_line - 1]
        source_path = str(Path(origin).resolve()) if origin else current_path
    else:
        source_path = current_path
    md += f'\n\n*{source_path}*'

    return lsp.Hover(
        contents=lsp.MarkupContent(kind=lsp.MarkupKind.Markdown, value=md),
        range=_word_range_at_position(text, position),
    )


def _effect_expr_to_exclusions(expr_str: str) -> List[str]:
    """Extract excluded effect names from an effect expression string.
    e.g. '!IO & !Alloc' -> ['IO', 'Alloc']
    '!IO.Console' -> ['IO.Console']
    """
    import re as _re
    return _re.findall(r'!([A-Z][A-Za-z0-9]*(?:\.[A-Za-z0-9]+)*)', expr_str)


def _effect_name_matches(required: str, excluded: str) -> bool:
    """True if required effect is covered by excluded effect.
    e.g. required='IO.Console', excluded='IO' -> True (child of excluded)
    required='IO', excluded='IO.Console' -> False
    """
    return required == excluded or required.startswith(excluded + '.')


def _analyze_function_body(func_def, program=None) -> dict:
    """Walk a FunctionDef's body collecting calls, return sites, and effect violations."""
    from fast import FunctionCall, ReturnStatement
    calls = []
    returns = 0
    violations = []
    visited = set()

    # Get caller's exclusions from its effect annotation
    caller_exclusions = []
    ea = getattr(func_def, 'effect_annotation', None)
    if ea:
        caller_exclusions = _effect_expr_to_exclusions(_effect_expr_str(ea))
    # Also resolve named effects (e.g. NoIO -> !IO)
    if caller_exclusions == [] and ea and program:
        raw = _effect_expr_str(ea)
        # Look up named effect definitions
        for stmt in program.statements:
            if type(stmt).__name__ == 'EffectDef' and getattr(stmt, 'name', None) == raw.strip():
                body_str = str(getattr(stmt, 'body', '') or '')
                caller_exclusions = _effect_expr_to_exclusions(body_str)
                break

    def _walk(node):
        nonlocal returns
        if node is None or id(node) in visited:
            return
        visited.add(id(node))
        if isinstance(node, FunctionCall):
            calls.append(node.name)
            # Check for effect violations
            if caller_exclusions and program:
                func_index = _build_func_index(program)
                called_def = func_index.get(node.name)
                if called_def:
                    cea = getattr(called_def, 'effect_annotation', None)
                    if cea:
                        callee_effects = _effect_expr_str(cea)
                        # Find required effects (non-excluded ones, e.g. *IO.Console)
                        import re as _re
                        required = _re.findall(r'\*?([A-Z][A-Za-z0-9]*(?:\.[A-Za-z0-9]+)*)', callee_effects)
                        for req in required:
                            for excl in caller_exclusions:
                                if _effect_name_matches(req, excl):
                                    bare_callee = node.name.split('__')[-1] if '__' in node.name else node.name
                                    violations.append(
                                        f"Call to `{bare_callee}` violates effect: "
                                        f"caller forbids `{excl}` but callee requires `{req}`"
                                    )
        if isinstance(node, ReturnStatement):
            returns += 1
        if not hasattr(node, '__dict__'):
            return
        for attr in vars(node).values():
            if isinstance(attr, list):
                for item in attr:
                    if hasattr(item, '__dict__'):
                        _walk(item)
            elif hasattr(attr, '__dict__') and not isinstance(attr, type):
                _walk(attr)

    body = getattr(func_def, 'body', None)
    if body:
        _walk(body)
    return {'calls': calls, 'returns': returns, 'violations': violations}
    """
    Return the source file where a symbol is defined using the line map.
    Falls back to current_uri_path if unavailable.
    """
    line_map = getattr(program, '_line_map', None)
    if line_map is None:
        return current_uri_path
    src_line = getattr(func_def, 'source_line', None) if func_def else None
    if src_line and src_line > 0 and 1 <= src_line <= len(line_map):
        origin, _ = line_map[src_line - 1]
        return str(Path(origin).resolve()) if origin else current_uri_path
    return current_uri_path

def _symbol_origin_file(program, func_def, current_uri_path: str) -> str:
    """Return the source file where a symbol is defined using the line map."""
    line_map = getattr(program, '_line_map', None)
    if line_map is None:
        return current_uri_path
    src_line = getattr(func_def, 'source_line', None) if func_def else None
    if src_line and src_line > 0 and src_line <= len(line_map):
        origin, _ = line_map[src_line - 1]
        return str(Path(origin).resolve()) if origin else current_uri_path
    return current_uri_path


@IDEKA_server.feature(lsp.TEXT_DOCUMENT_HOVER)
def hover(ls: LanguageServer, params: lsp.HoverParams):
    uri     = params.text_document.uri
    program = _parse_cache.get(uri)
    if program is None:
        return None

    # Ensure top-level symbols registered (stale cache may predate this fix)
    if not getattr(program, '_toplevel_registered', False):
        _register_toplevel_symbols(program)
        try:
            program._toplevel_registered = True
        except Exception:
            pass

    text = _doc_store.get(uri, "")
    word = _qualified_word_at_position(text, params.position)
    if not word:
        return None

    # Check for constraint first
    constr_hover = _hover_constraint(program, word, text, params.position, uri)
    if constr_hover is not None:
        return constr_hover

    # Check for effect name
    effect_hover = _hover_effect_name(program, word, text, params.position, uri)
    if effect_hover is not None:
        return effect_hover

    entry = _resolve_qualified(program, word)
    if entry is None:
        # Check if the word is a namespace prefix (has children in the symbol table)
        mangled = word.replace('::', '__')
        prefix = mangled + '__'
        is_ns = any(k.startswith(prefix) for k in program.symbol_table._global_symbols)
        if is_ns:
            return lsp.Hover(
                contents=lsp.MarkupContent(
                    kind=lsp.MarkupKind.Markdown,
                    value=f"**namespace** `{word}`",
                ),
                range=_word_range_at_position(text, params.position),
            )
        return None

    # Build markdown hover content
    kind_label = entry.kind.value
    full       = (entry.full_name or entry.name).replace('__', '::')
    type_str   = _type_spec_str(entry.type_spec)

    bare_name = entry.name  # unmangled short name for AST lookup

    if entry.kind == SymbolKind.FUNCTION:
        func_def = _find_function_def(program, bare_name, entry.name)
        if func_def and func_def.parameters:
            param_strs = []
            for p in func_def.parameters:
                type_str_p = _type_spec_str(p.type_spec)
                param_strs.append(f"{type_str_p} {p.name}" if type_str_p else p.name)
            ret = _type_spec_str(func_def.return_type) if func_def.return_type else (type_str or "void")
            md = f"**function** `{full}({', '.join(param_strs)}) -> {ret}`"
        else:
            md = f"**function** `{full}`"
            if type_str:
                md += f"\n\nReturns: `{type_str}`"
        md += _hover_effect_lines(func_def)

        # Body summary
        if func_def and not getattr(func_def, 'is_prototype', False):
            analysis = _analyze_function_body(func_def, program)
            summary_parts = []
            calls = analysis['calls']
            if calls:
                from collections import Counter
                call_counts = Counter(calls)
                func_index = _build_func_index(program)
                call_strs = []
                for name, count in call_counts.most_common(5):
                    display_name = name.replace('__', '::')
                    label = f"{display_name} ×{count}" if count > 1 else display_name
                    called_def = func_index.get(name) or func_index.get(display_name.split('::')[-1])
                    effect_label = None
                    if called_def:
                        ea = getattr(called_def, 'effect_annotation', None)
                        if ea:
                            effect_label = _effect_expr_str(ea)
                    if not effect_label:
                        ns_parts = name.split('__')
                        _NS_EFFECT_MAP = {
                            'io': 'IO', 'console': 'IO.Console', 'file': 'IO.File',
                            'socket': 'IO.Socket', 'alloc': 'Alloc', 'heap': 'Alloc.Heap',
                            'crypto': 'Crypto', 'process': 'Process', 'hook': 'Hook',
                            'sync': 'Sync', 'mem': 'Mem',
                        }
                        for part in reversed(ns_parts[:-1]):
                            inferred = _NS_EFFECT_MAP.get(part.lower())
                            if inferred:
                                effect_label = inferred
                                break
                    if effect_label:
                        label += f" `({effect_label})`"
                    call_strs.append(label)
                if len(call_counts) > 5:
                    call_strs.append(f"…+{len(call_counts)-5} more")
                summary_parts.append(f"{len(calls)} call(s): {', '.join(call_strs)}")
            if analysis['returns']:
                summary_parts.append(f"{analysis['returns']} return site(s)")
            if summary_parts:
                md += '\n\n' + '\n\n'.join(summary_parts)

            # Effect violations
            for v in analysis.get('violations', []):
                md += f'\n\n<!-- fx:violation:{v} -->'

        # Effect annotation -- check definition and fall back to any prototype
        func_def_for_effect = func_def
        if not getattr(func_def_for_effect, 'effect_annotation', None):
            # Search all statements recursively for any FunctionDef with this name and an annotation
            def _find_with_effect(stmts, name):
                for s in stmts:
                    if type(s).__name__ == 'FunctionDef' and getattr(s, 'name', None) == name:
                        if getattr(s, 'effect_annotation', None):
                            return s
                    ns = None
                    if isinstance(s, NamespaceDefStatement): ns = s.namespace_def
                    elif isinstance(s, NamespaceDef): ns = s
                    elif hasattr(s, 'namespace_def'): ns = s.namespace_def
                    if ns:
                        for fn in getattr(ns, 'functions', []):
                            if getattr(fn, 'name', None) == bare_name and getattr(fn, 'effect_annotation', None):
                                return fn
                        result = _find_with_effect(getattr(ns, 'nested_namespaces', []), name)
                        if result:
                            return result
                return None
            found = _find_with_effect(program.statements, bare_name)
            if found:
                func_def_for_effect = found

        ea = getattr(func_def_for_effect, 'effect_annotation', None) if func_def_for_effect else None
        if not ea:
            ea = getattr(func_def, 'effect_annotation', None) if func_def else None
        if ea:
            expr = _effect_expr_str(ea)
            if expr:
                md += f"\n\neffect: `{expr}`"
                md += f"\n\n<!-- fx:effect:{expr} -->"
    elif entry.kind in (SymbolKind.STRUCT, SymbolKind.OBJECT):
        md = f"**{kind_label}** `{full}`"
        for stmt in program.statements:
            defn = None
            if isinstance(stmt, StructDefStatement) and stmt.struct_def.name == bare_name:
                defn = stmt.struct_def
            elif isinstance(stmt, ObjectDefStatement) and stmt.object_def.name == bare_name:
                defn = stmt.object_def
            if defn:
                md += f"\n\n{len(defn.members)} member(s)"
                break
    elif entry.kind == SymbolKind.ENUM:
        md = f"**enum** `{full}`"
        for stmt in program.statements:
            if isinstance(stmt, EnumDefStatement) and stmt.enum_def.name == bare_name:
                vals = list(stmt.enum_def.values.keys())
                preview = ', '.join(vals[:5])
                if len(vals) > 5:
                    preview += f", ... ({len(vals)} values)"
                md += f"\n\n`{preview}`"
                break
    elif entry.kind == SymbolKind.VARIABLE:
        md = f"**variable** `{full}`"
        if type_str:
            md += f": `{type_str}`"
    else:
        md = f"**{kind_label}** `{full}`"
        if type_str:
            md += f": `{type_str}`"

    # File of origin
    current_path = _uri_to_path(uri)
    if entry.kind == SymbolKind.FUNCTION:
        func_def_node = _find_function_def(program, bare_name, entry.name)
        src_line = getattr(func_def_node, 'source_line', None) if func_def_node else None
        line_map = getattr(program, '_line_map', None)
        origin = _symbol_origin_file(program, func_def_node, current_path)
    else:
        origin = current_path
    md += f'\n\n*{origin}*'

    return lsp.Hover(
        contents=lsp.MarkupContent(kind=lsp.MarkupKind.Markdown, value=md),
        range=_word_range_at_position(text, params.position),
    )




# ---------------------------------------------------------------------------
# Signature Help
# ---------------------------------------------------------------------------

def _func_name_before_paren(text: str, position: lsp.Position) -> Optional[str]:
    """Find the function name being called at the cursor position.
    Scans backward from the cursor to find the opening ( and the full
    qualified identifier (including :: segments) before it.
    """
    lines = text.splitlines()
    if position.line >= len(lines):
        return None
    flat = '\n'.join(lines[:position.line]) + '\n' + lines[position.line][:position.character]
    depth = 0
    i = len(flat) - 1
    while i >= 0:
        c = flat[i]
        if c == ')':
            depth += 1
        elif c == '(':
            if depth == 0:
                # Found the opening paren -- read full qualified name before it
                j = i - 1
                while j >= 0 and flat[j] in (' ', '\t'):
                    j -= 1
                end = j + 1
                # Read identifier segment
                while j >= 0 and (flat[j].isalnum() or flat[j] == '_'):
                    j -= 1
                name = flat[j+1:end]
                # Keep consuming ::segment to the left
                while j >= 1 and flat[j-1:j+1] == '::':
                    j -= 2
                    seg_end = j + 1
                    while j >= 0 and (flat[j].isalnum() or flat[j] == '_'):
                        j -= 1
                    name = flat[j+1:seg_end] + '::' + name
                return name or None
            depth -= 1
        i -= 1
    return None


def _active_param_index(text: str, position: lsp.Position) -> int:
    """Count commas at the current call depth to determine active parameter index."""
    lines = text.splitlines()
    if position.line >= len(lines):
        return 0
    flat = '\n'.join(lines[:position.line]) + '\n' + lines[position.line][:position.character]
    depth = 0
    commas = 0
    i = len(flat) - 1
    while i >= 0:
        c = flat[i]
        if c == ')':
            depth += 1
        elif c == '(':
            if depth == 0:
                break
            depth -= 1
        elif c == ',' and depth == 0:
            commas += 1
        i -= 1
    return commas


def _build_func_index(program: Program) -> Dict[str, "FunctionDef"]:
    """Build a name -> FunctionDef index for a program, checking both bare and mangled names.
    Result is cached on the program object to avoid repeated AST walks.
    """
    if hasattr(program, '_lsp_func_index'):
        return program._lsp_func_index

    index: Dict[str, "FunctionDef"] = {}

    def _index_stmts(stmts):
        for stmt in stmts:
            if isinstance(stmt, FunctionDefStatement):
                defn = stmt.function_def
                # Prefer definitions over prototypes
                if defn.name not in index or getattr(index[defn.name], 'is_prototype', True):
                    index[defn.name] = defn
            elif hasattr(stmt, 'function_def'):
                defn = stmt.function_def
                if defn.name not in index or getattr(index[defn.name], 'is_prototype', True):
                    index[defn.name] = defn
            elif type(stmt).__name__ == 'FunctionDef' and hasattr(stmt, 'name'):
                if stmt.name not in index or getattr(index[stmt.name], 'is_prototype', True):
                    index[stmt.name] = stmt

            ns = None
            if isinstance(stmt, NamespaceDefStatement):
                ns = stmt.namespace_def
            elif isinstance(stmt, NamespaceDef):
                ns = stmt
            elif hasattr(stmt, 'namespace_def'):
                ns = stmt.namespace_def

            if ns is not None:
                for fn in getattr(ns, 'functions', []):
                    if fn.name not in index or getattr(index[fn.name], 'is_prototype', True):
                        index[fn.name] = fn
                for nested in getattr(ns, 'nested_namespaces', []):
                    _index_stmts([nested])

    _index_stmts(program.statements)
    try:
        program._lsp_func_index = index
    except Exception:
        pass
    return index


def _find_function_def(program: Program, func_name: str, mangled_name: str = "") -> Optional["FunctionDef"]:
    """Look up a FunctionDef by name using the cached index."""
    index = _build_func_index(program)
    bare = func_name.split('::')[-1]
    return (
        index.get(func_name) or
        index.get(bare) or
        (index.get(mangled_name) if mangled_name else None)
    )


def _build_type_index(program: Program) -> Dict[str, object]:
    """Build a type_name -> (kind, defn) index covering top-level and namespace types.
    Cached on the program object.
    """
    if hasattr(program, '_lsp_type_index'):
        return program._lsp_type_index

    index: Dict[str, tuple] = {}

    def _index_stmts(stmts):
        for stmt in stmts:
            if isinstance(stmt, StructDefStatement):
                d = stmt.struct_def
                index[d.name] = ('struct', d)
            elif isinstance(stmt, ObjectDefStatement):
                d = stmt.object_def
                index[d.name] = ('object', d)
            elif isinstance(stmt, UnionDefStatement):
                d = stmt.union_def
                index[d.name] = ('union', d)
            elif isinstance(stmt, NamespaceDefStatement):
                ns = stmt.namespace_def
                for s in ns.structs:
                    index[s.name] = ('struct', s)
                for o in ns.objects:
                    index[o.name] = ('object', o)
                for u in ns.unions:
                    index[u.name] = ('union', u)
                for nested in ns.nested_namespaces:
                    _index_stmts([NamespaceDefStatement(nested)])

    _index_stmts(program.statements)
    try:
        program._lsp_type_index = index
    except Exception:
        pass
    return index


@IDEKA_server.feature(
    lsp.TEXT_DOCUMENT_SIGNATURE_HELP,
    lsp.SignatureHelpOptions(trigger_characters=["(", ","])
)
def signature_help(ls: LanguageServer, params: lsp.SignatureHelpParams):
    uri     = params.text_document.uri
    program = _parse_cache.get(uri)
    if program is None:
        return None

    text = _doc_store.get(uri, "")
    func_name = _func_name_before_paren(text, params.position)
    if not func_name:
        return None

    log.debug("signature_help func_name=%r", func_name)

    entry = _resolve_qualified(program, func_name)
    if entry is None or entry.kind != SymbolKind.FUNCTION:
        return None

    # The bare-name alias may lack type info -- find the canonical mangled entry
    mangled = entry.name
    canonical = program.symbol_table._global_symbols.get(mangled, entry)

    # Find the FunctionDef in the AST using both bare and mangled name
    func_def = _find_function_def(program, func_name, mangled)

    # Also try every mangled variant in _global_symbols
    if func_def is None:
        for sym_name, sym_entry in program.symbol_table._global_symbols.items():
            if sym_entry.kind == SymbolKind.FUNCTION and (
                sym_name == func_name or
                sym_name.endswith('__' + func_name)
            ):
                func_def = _find_function_def(program, func_name, sym_name)
                if func_def:
                    canonical = sym_entry
                    break

    if func_def is None:
        ret_str = _type_spec_str(canonical.type_spec) if canonical.type_spec else "?"
        sig_label = f"{func_name}(...) -> {ret_str}"
        sig = lsp.SignatureInformation(
            label=sig_label,
            documentation=lsp.MarkupContent(
                kind=lsp.MarkupKind.Markdown,
                value=f"**function** `{canonical.full_name}`"
            ),
            parameters=[],
        )
        return lsp.SignatureHelp(signatures=[sig], active_signature=0, active_parameter=0)

    # Build parameter list from FunctionDef
    param_infos = []
    param_labels = []
    for p in func_def.parameters:
        type_str = _type_spec_str(p.type_spec)
        pname    = p.name or "_"
        label    = f"{type_str} {pname}" if type_str else pname
        param_labels.append(label)
        param_infos.append(lsp.ParameterInformation(
            label=label,
            documentation=lsp.MarkupContent(
                kind=lsp.MarkupKind.PlainText,
                value=f"{pname}: {type_str}",
            ) if type_str else None,
        ))

    ret_str   = _type_spec_str(func_def.return_type) if func_def.return_type else "void"
    sig_label = f"{func_name}({', '.join(param_labels)}) -> {ret_str}"

    sig = lsp.SignatureInformation(
        label=sig_label,
        documentation=lsp.MarkupContent(
            kind=lsp.MarkupKind.Markdown,
            value=f"**function** `{canonical.full_name}`\n\nReturns: `{ret_str}`"
        ),
        parameters=param_infos,
    )

    active_param = _active_param_index(text, params.position)

    return lsp.SignatureHelp(
        signatures=[sig],
        active_signature=0,
        active_parameter=min(active_param, max(0, len(param_infos) - 1)),
    )




@IDEKA_server.feature(lsp.TEXT_DOCUMENT_DEFINITION)
def definition(ls: LanguageServer, params: lsp.DefinitionParams):
    uri     = params.text_document.uri
    program = _parse_cache.get(uri)
    if program is None:
        return None

    text = _doc_store.get(uri, "")
    word = _qualified_word_at_position(text, params.position)
    if not word:
        return None

    entry = _resolve_qualified(program, word)
    bare_name = entry.name if entry else word.split('::')[-1]
    locations: List[lsp.Location] = []

    def _collect_defs(stmts, target_uri):
        _STMT_ATTRS = (
            ('struct_def',   StructDefStatement),
            ('object_def',   ObjectDefStatement),
            ('function_def', FunctionDefStatement),
            ('enum_def',     EnumDefStatement),
            ('union_def',    UnionDefStatement),
        )
        for stmt in stmts:
            for attr, cls in _STMT_ATTRS:
                if not isinstance(stmt, cls):
                    continue
                defn = getattr(stmt, attr, None)
                if defn is None:
                    continue
                if getattr(defn, 'name', None) != bare_name:
                    continue
                line = getattr(defn, 'source_line', 0)
                col  = getattr(defn, 'source_col',  0)
                if line:
                    locations.append(lsp.Location(uri=target_uri, range=_make_range(line, col)))
            if isinstance(stmt, NamespaceDefStatement):
                ns = stmt.namespace_def
                for fn in ns.functions:
                    if fn.name == bare_name:
                        line = getattr(fn, 'source_line', 0)
                        col  = getattr(fn, 'source_col',  0)
                        if line:
                            locations.append(lsp.Location(uri=target_uri, range=_make_range(line, col)))
                for collection in (ns.structs, ns.objects, ns.enums, ns.unions):
                    for defn in collection:
                        if getattr(defn, 'name', None) == bare_name:
                            line = getattr(defn, 'source_line', 0)
                            col  = getattr(defn, 'source_col',  0)
                            if line:
                                locations.append(lsp.Location(uri=target_uri, range=_make_range(line, col)))
                for nested in ns.nested_namespaces:
                    _collect_defs([NamespaceDefStatement(nested)], target_uri)

    _collect_defs(program.statements, uri)
    for other_uri, other_program in _parse_cache.items():
        if other_uri == uri:
            continue
        _collect_defs(other_program.statements, other_uri)

    if not locations:
        return None
    if len(locations) == 1:
        return locations[0]
    return locations


# ---------------------------------------------------------------------------
# Using statement helpers
# ---------------------------------------------------------------------------

def _get_using_namespaces(program: Program) -> List[str]:
    """Return list of mangled namespace paths from using statements in the program.
    e.g. 'using standard::io::console' -> 'standard__io__console'
    """
    result = []
    for stmt in program.statements:
        if isinstance(stmt, UsingStatement):
            mangled = stmt.namespace_path.replace('::', '__')
            result.append(mangled)
    return result


def _using_aware_completions(program: Program, doc_text: str = "") -> List[lsp.CompletionItem]:
    """Return completion items for all symbols reachable via active using statements.
    Symbols are shown by their short (unqualified) name.
    """
    using_ns = _get_using_namespaces(program)
    if not using_ns:
        return []
    items = []
    seen: set = set()
    for sym_name, entry in program.symbol_table._global_symbols.items():
        for ns in using_ns:
            prefix = ns + '__'
            if not sym_name.startswith(prefix):
                continue
            remainder = sym_name[len(prefix):]
            if '__' in remainder:
                continue  # deeper -- not directly in this namespace
            if remainder in seen:
                continue
            seen.add(remainder)
            if entry.kind == SymbolKind.FUNCTION:
                detail = f"-> {_type_spec_str(entry.type_spec)}" if entry.type_spec else "function"
                insert, fmt = _func_snippet(remainder, program, sym_name)
            else:
                detail = _type_spec_str(entry.type_spec) if entry.type_spec else entry.kind.value
                insert, fmt = remainder, lsp.InsertTextFormat.PlainText
            detail = _location_detail(entry.name, program, detail, doc_text)
            items.append(lsp.CompletionItem(
                label=remainder,
                kind=_symbol_kind_to_lsp(entry.kind),
                detail=detail,
                sort_text=f"0_{remainder}",
                insert_text=insert,
                insert_text_format=fmt,
                documentation=lsp.MarkupContent(
                    kind=lsp.MarkupKind.PlainText,
                    value=f"{entry.kind.value}: {sym_name.replace('__', '::')}",
                ),
            ))
    return items


def _all_namespace_paths(program: Program) -> List[str]:
    """Return sorted list of all unique namespace paths present in the symbol table,
    in :: display form, for use in 'using' completions.
    """
    paths: set = set()
    for sym_name in program.symbol_table._global_symbols:
        parts = sym_name.split('__')
        # Collect every prefix of length >= 1 that has at least one child
        for depth in range(1, len(parts)):
            paths.add('::'.join(parts[:depth]))
    return sorted(paths)


# ---------------------------------------------------------------------------
# Document symbols
# ---------------------------------------------------------------------------

def _sym_range(defn) -> lsp.Range:
    line = max(0, getattr(defn, 'source_line', 1) - 1)
    col  = max(0, getattr(defn, 'source_col',  1) - 1)
    return lsp.Range(
        start=lsp.Position(line=line, character=col),
        end=lsp.Position(line=line, character=col + len(getattr(defn, 'name', ''))),
    )


@IDEKA_server.feature(lsp.TEXT_DOCUMENT_DOCUMENT_SYMBOL)
def document_symbol(ls: LanguageServer, params: lsp.DocumentSymbolParams):
    uri     = params.text_document.uri
    program = _parse_cache.get(uri)
    if program is None:
        return []

    symbols = []
    _STMT_MAP = [
        (FunctionDefStatement, 'function_def',  lsp.SymbolKind.Function),
        (StructDefStatement,   'struct_def',    lsp.SymbolKind.Struct),
        (ObjectDefStatement,   'object_def',    lsp.SymbolKind.Class),
        (EnumDefStatement,     'enum_def',      lsp.SymbolKind.Enum),
        (UnionDefStatement,    'union_def',      lsp.SymbolKind.Struct),
        (NamespaceDefStatement,'namespace_def', lsp.SymbolKind.Namespace),
    ]

    for stmt in program.statements:
        for cls, attr, kind in _STMT_MAP:
            if not isinstance(stmt, cls):
                continue
            defn = getattr(stmt, attr, None)
            if defn is None:
                continue
            name = getattr(defn, 'name', None)
            if not name:
                continue
            r = _sym_range(defn)
            symbols.append(lsp.DocumentSymbol(
                name=name,
                kind=kind,
                range=r,
                selection_range=r,
            ))
    return symbols


# ---------------------------------------------------------------------------
# Import completions
# ---------------------------------------------------------------------------

_STDLIB_FX_FILES = [
    "standard.idk", "windows.idk", "opengl.idk", "socket.idk", "threading.idk",
    "collections.idk", "vectors.idk", "decimal.idk", "cryptography.idk",
    "console.idk", "networking.idk", "math.idk", "atomic.idk",
]

def _import_completions() -> List[lsp.CompletionItem]:
    """Offer known stdlib .idk filenames for #import <> completion."""
    stdlib_dir = os.environ.get("IDEKA_STDLIB", "")
    names = list(_STDLIB_FX_FILES)
    if stdlib_dir and os.path.isdir(stdlib_dir):
        for f in os.listdir(stdlib_dir):
            if f.endswith('.idk') and f not in names:
                names.append(f)
    return [
        lsp.CompletionItem(
            label=name,
            kind=lsp.CompletionItemKind.File,
            detail="stdlib module",
        )
        for name in sorted(names)
    ]

# ---------------------------------------------------------------------------
# Workspace symbols
# ---------------------------------------------------------------------------

@IDEKA_server.feature(lsp.WORKSPACE_SYMBOL)
def workspace_symbol(ls: LanguageServer, params):
    query = (params.query or "").lower()
    results = []
    for uri, program in _parse_cache.items():
        _STMT_MAP = [
            (FunctionDefStatement, 'function_def',  lsp.SymbolKind.Function),
            (StructDefStatement,   'struct_def',    lsp.SymbolKind.Struct),
            (ObjectDefStatement,   'object_def',    lsp.SymbolKind.Class),
            (EnumDefStatement,     'enum_def',      lsp.SymbolKind.Enum),
            (UnionDefStatement,    'union_def',      lsp.SymbolKind.Struct),
        ]
        for stmt in program.statements:
            for cls, attr, kind in _STMT_MAP:
                if not isinstance(stmt, cls):
                    continue
                defn = getattr(stmt, attr, None)
                if defn is None:
                    continue
                name = getattr(defn, 'name', None)
                if not name:
                    continue
                if query and query not in name.lower():
                    continue
                line = max(0, getattr(defn, 'source_line', 1) - 1)
                col  = max(0, getattr(defn, 'source_col',  1) - 1)
                results.append(lsp.SymbolInformation(
                    name=name,
                    kind=kind,
                    location=lsp.Location(
                        uri=uri,
                        range=lsp.Range(
                            start=lsp.Position(line=line, character=col),
                            end=lsp.Position(line=line, character=col + len(name)),
                        ),
                    ),
                ))
    return results


# ---------------------------------------------------------------------------
# Find references
# ---------------------------------------------------------------------------

def _is_ident_char(c: str) -> bool:
    return c.isalnum() or c == '_'


def _find_references_in_text(text: str, word: str) -> List[lsp.Range]:
    """Find all occurrences of word as a whole identifier in text."""
    ranges = []
    wlen = len(word)
    lines = text.splitlines()
    for line_idx, line in enumerate(lines):
        col = 0
        while col <= len(line) - wlen:
            idx = line.find(word, col)
            if idx == -1:
                break
            before_ok = (idx == 0 or not _is_ident_char(line[idx - 1]))
            after_pos = idx + wlen
            after_ok  = (after_pos >= len(line) or not _is_ident_char(line[after_pos]))
            if before_ok and after_ok:
                ranges.append(lsp.Range(
                    start=lsp.Position(line=line_idx, character=idx),
                    end=lsp.Position(line=line_idx, character=after_pos),
                ))
            col = idx + 1
    return ranges


@IDEKA_server.feature(lsp.TEXT_DOCUMENT_REFERENCES)
def references(ls: LanguageServer, params):
    uri  = params.text_document.uri
    text = _doc_store.get(uri, "")
    word = _word_at_position(text, params.position)
    if not word:
        return []

    locations = []
    for doc_uri, doc_text in _doc_store.items():
        for r in _find_references_in_text(doc_text, word):
            locations.append(lsp.Location(uri=doc_uri, range=r))
    return locations


# ---------------------------------------------------------------------------
# Rename symbol
# ---------------------------------------------------------------------------

@IDEKA_server.feature(lsp.TEXT_DOCUMENT_PREPARE_RENAME)
def prepare_rename(ls: LanguageServer, params):
    text = _doc_store.get(params.text_document.uri, "")
    word = _word_at_position(text, params.position)
    if not word:
        return None
    return _word_range_at_position(text, params.position)


@IDEKA_server.feature(lsp.TEXT_DOCUMENT_RENAME)
def rename(ls: LanguageServer, params):
    uri      = params.text_document.uri
    text     = _doc_store.get(uri, "")
    old_word = _word_at_position(text, params.position)
    new_name = params.new_name
    if not old_word or not new_name:
        return None

    changes: Dict[str, List[lsp.TextEdit]] = {}

    # Rename in all cached/open documents
    for doc_uri, doc_text in _doc_store.items():
        edits = [
            lsp.TextEdit(range=r, new_text=new_name)
            for r in _find_references_in_text(doc_text, old_word)
        ]
        if edits:
            changes[doc_uri] = edits

    if not changes:
        return None
    return lsp.WorkspaceEdit(changes=changes)


# ---------------------------------------------------------------------------
# Code actions
# ---------------------------------------------------------------------------

@IDEKA_server.feature(lsp.TEXT_DOCUMENT_CODE_ACTION)
def code_action(ls: LanguageServer, params):
    uri     = params.text_document.uri
    program = _parse_cache.get(uri)
    text    = _doc_store.get(uri, "")
    if program is None or not text:
        return []

    actions = []
    # For each diagnostic on the current range, check if it's an unknown identifier
    # that could be resolved by adding a using statement
    word = _word_at_position(text, params.range.start)
    if word and '__' not in word:
        # Find all namespaces that directly contain this symbol
        candidates = []
        for sym_name, entry in program.symbol_table._global_symbols.items():
            if sym_name.endswith('__' + word) and '__' in sym_name:
                ns_mangled = sym_name[: -(len(word) + 2)]
                ns_display = ns_mangled.replace('__', '::')
                # Check not already using it
                already = any(
                    isinstance(s, UsingStatement) and s.namespace_path == ns_display
                    for s in program.statements
                )
                if not already and ns_display not in candidates:
                    candidates.append(ns_display)
        for ns in candidates:
            # Insert 'using ns;' after the last #import line or at top
            lines = text.splitlines()
            insert_line = 0
            for i, line in enumerate(lines):
                if line.startswith('#import') or line.startswith('using '):
                    insert_line = i + 1
            edit = lsp.TextEdit(
                range=lsp.Range(
                    start=lsp.Position(line=insert_line, character=0),
                    end=lsp.Position(line=insert_line, character=0),
                ),
                new_text=f"using {ns};\n",
            )
            actions.append(lsp.CodeAction(
                title=f"Add 'using {ns};'",
                kind=lsp.CodeActionKind.QuickFix,
                edit=lsp.WorkspaceEdit(changes={uri: [edit]}),
            ))
    return actions


# ---------------------------------------------------------------------------
# Inlay hints
# ---------------------------------------------------------------------------

@IDEKA_server.feature(lsp.TEXT_DOCUMENT_INLAY_HINT)
def inlay_hint(ls: LanguageServer, params):
    uri     = params.text_document.uri
    program = _parse_cache.get(uri)
    text    = _doc_store.get(uri, "")
    if program is None or not text:
        return []

    hints = []
    lines = text.splitlines()
    rng   = params.range

    def _in_range(line_idx: int) -> bool:
        return rng.start.line <= line_idx <= rng.end.line

    def _hint_for_decl(decl):
        """Emit an inlay hint for a VariableDeclaration if it's in range."""
        line_idx = max(0, getattr(decl, 'source_line', 1) - 1)
        if not _in_range(line_idx):
            return
        type_str = _type_spec_str(decl.type_spec)
        if not type_str:
            return
        src_line = lines[line_idx] if line_idx < len(lines) else ""
        idx = src_line.find(decl.name)
        if idx == -1:
            return
        col = idx + len(decl.name)
        hints.append(lsp.InlayHint(
            position=lsp.Position(line=line_idx, character=col),
            label=f": {type_str}",
            kind=lsp.InlayHintKind.Type,
            padding_left=False,
            padding_right=True,
        ))

    def _walk_block(stmts):
        for node in stmts:
            if isinstance(node, VariableDeclaration):
                _hint_for_decl(node)
            elif hasattr(node, 'body') and hasattr(node.body, 'statements'):
                _walk_block(node.body.statements)
            elif hasattr(node, 'then_block') and hasattr(node.then_block, 'statements'):
                _walk_block(node.then_block.statements)
                if hasattr(node, 'else_block') and hasattr(node.else_block, 'statements'):
                    _walk_block(node.else_block.statements)
            elif hasattr(node, 'statements'):
                _walk_block(node.statements)

    for stmt in program.statements:
        # Top-level variable declarations
        if isinstance(stmt, VariableDeclaration):
            _hint_for_decl(stmt)
        # Function bodies
        elif isinstance(stmt, FunctionDefStatement):
            defn = stmt.function_def
            if hasattr(defn, 'body') and hasattr(defn.body, 'statements'):
                _walk_block(defn.body.statements)
        # Namespace contents
        elif isinstance(stmt, NamespaceDefStatement):
            for fn in stmt.namespace_def.functions:
                if hasattr(fn, 'body') and hasattr(fn.body, 'statements'):
                    _walk_block(fn.body.statements)

    return hints


# ---------------------------------------------------------------------------
# Semantic tokens
# ---------------------------------------------------------------------------

_SEMANTIC_TOKEN_TYPES = [
    "namespace", "type", "class", "enum", "struct",
    "parameter", "variable", "property", "enumMember",
    "function", "method", "macro", "keyword",
]
_SEMANTIC_TOKEN_MODIFIERS = [
    "declaration", "definition", "readonly", "static", "defaultLibrary",
]

_TT = {name: idx for idx, name in enumerate(_SEMANTIC_TOKEN_TYPES)}
_TM = {name: (1 << idx) for idx, name in enumerate(_SEMANTIC_TOKEN_MODIFIERS)}


def _encode_semantic_tokens(tokens: List[tuple]) -> List[int]:
    """Encode (line, col, length, type_idx, mod_mask) tuples as LSP delta encoding."""
    data = []
    prev_line = 0
    prev_col  = 0
    for line, col, length, type_idx, mod_mask in sorted(tokens):
        delta_line = line - prev_line
        delta_col  = col - prev_col if delta_line == 0 else col
        data.extend([delta_line, delta_col, length, type_idx, mod_mask])
        prev_line = line
        prev_col  = col
    return data


def _collect_semantic_tokens(program: Program, text: str) -> List[tuple]:
    """Walk the source text once, classifying each identifier via a pre-built lookup table."""

    _KIND_TOKEN = {
        SymbolKind.FUNCTION:  ('function',   0),
        SymbolKind.OPERATOR:  ('function',   0),
        SymbolKind.STRUCT:    ('struct',     0),
        SymbolKind.OBJECT:    ('class',      0),
        SymbolKind.ENUM:      ('enum',       0),
        SymbolKind.UNION:     ('struct',     0),
        SymbolKind.NAMESPACE: ('namespace',  0),
        SymbolKind.VARIABLE:  ('variable',   0),
        SymbolKind.TYPE:      ('type',       0),
        SymbolKind.TRAIT:     ('type',       0),
        SymbolKind.INTERFACE: ('type',       0),
    }

    # Build name -> (type_idx, mod_mask) from symbol table (bare names only)
    name_map: Dict[str, tuple] = {}
    for sym_name, entry in program.symbol_table._global_symbols.items():
        bare = entry.name
        if '__' in bare:
            continue
        mapping = _KIND_TOKEN.get(entry.kind)
        if not mapping:
            continue
        tok_type, _ = mapping
        type_idx = _TT.get(tok_type)
        if type_idx is None:
            continue
        # Definition sites get the definition modifier
        name_map[bare] = (type_idx, 0)

    # Override definition sites from AST with definition modifier
    _STMT_TOKENS = [
        (FunctionDefStatement, 'function_def',  'function'),
        (StructDefStatement,   'struct_def',    'struct'),
        (ObjectDefStatement,   'object_def',    'class'),
        (EnumDefStatement,     'enum_def',      'enum'),
        (UnionDefStatement,    'union_def',      'struct'),
        (NamespaceDefStatement,'namespace_def', 'namespace'),
    ]
    def_sites: Dict[tuple, tuple] = {}  # (line, col) -> (length, type_idx, mod_mask)

    def _record_def(name, src_line, src_col, tok_type):
        if not src_line:
            return
        line = max(0, src_line - 1)
        col  = max(0, src_col  - 1)
        type_idx = _TT.get(tok_type)
        if type_idx is None:
            return
        mod_mask = _TM.get('definition', 0)
        def_sites[(line, col)] = (len(name), type_idx, mod_mask)

    def _walk_def_stmts(stmts):
        for stmt in stmts:
            for cls, attr, tok_type in _STMT_TOKENS:
                if not isinstance(stmt, cls):
                    continue
                defn = getattr(stmt, attr, None)
                if defn is None:
                    continue
                name = getattr(defn, 'name', None)
                if not name:
                    continue
                _record_def(name, getattr(defn, 'source_line', 0), getattr(defn, 'source_col', 0), tok_type)
            if isinstance(stmt, NamespaceDefStatement):
                ns = stmt.namespace_def
                for fn in ns.functions:
                    _record_def(fn.name, getattr(fn, 'source_line', 0), getattr(fn, 'source_col', 0), 'function')
                for s in ns.structs:
                    _record_def(s.name, getattr(s, 'source_line', 0), getattr(s, 'source_col', 0), 'struct')
                for o in ns.objects:
                    _record_def(o.name, getattr(o, 'source_line', 0), getattr(o, 'source_col', 0), 'class')
                for e in ns.enums:
                    _record_def(e.name, getattr(e, 'source_line', 0), getattr(e, 'source_col', 0), 'enum')
                for nested in ns.nested_namespaces:
                    _walk_def_stmts([NamespaceDefStatement(nested)])

    _walk_def_stmts(program.statements)

    # Single linear scan of source text
    tokens = []
    lines = text.splitlines()
    for line_idx, src_line in enumerate(lines):
        col = 0
        while col < len(src_line):
            c = src_line[col]
            if c.isalpha() or c == '_':
                # Start of identifier
                end = col + 1
                while end < len(src_line) and _is_ident_char(src_line[end]):
                    end += 1
                ident = src_line[col:end]
                # Check definition site first
                site_key = (line_idx, col)
                if site_key in def_sites:
                    length, type_idx, mod_mask = def_sites[site_key]
                    tokens.append((line_idx, col, length, type_idx, mod_mask))
                elif ident in name_map:
                    type_idx, mod_mask = name_map[ident]
                    tokens.append((line_idx, col, end - col, type_idx, mod_mask))
                col = end
            else:
                col += 1

    return tokens


@IDEKA_server.feature(lsp.TEXT_DOCUMENT_SEMANTIC_TOKENS_FULL)
def semantic_tokens_full(ls: LanguageServer, params: lsp.SemanticTokensParams):
    uri     = params.text_document.uri
    program = _parse_cache.get(uri)
    text    = _doc_store.get(uri, "")
    if program is None or not text:
        return lsp.SemanticTokens(data=[])
    tokens = _collect_semantic_tokens(program, text)
    return lsp.SemanticTokens(data=_encode_semantic_tokens(tokens))


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main():
    import argparse
    ap = argparse.ArgumentParser(description="IDEKA Language Server")
    ap.add_argument("--tcp",  action="store_true", help="TCP mode on port 2087")
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--port", type=int, default=2087)
    args = ap.parse_args()

    if args.tcp:
        log.info("Starting in TCP mode on %s:%d", args.host, args.port)
        IDEKA_server.start_tcp(args.host, args.port)
    else:
        log.info("Starting in stdio mode")
        IDEKA_server.start_io()


if __name__ == "__main__":
    main()