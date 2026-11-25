# Copyright (c) Karac Von Thweatt. All rights reserved.

"""
cit.py - C to IDEKA translation layer
Uses libclang to parse C headers/sources and emits equivalent IDEKA declarations
and function bodies.

Usage:
    python cit.py <input.c|h> [output.idk]
    python cit.py <input.c|h>        # prints to stdout
"""

import sys
import os
import configparser
import clang.cindex as cx
from clang.cindex import CursorKind, TypeKind

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
# cit.cfg is looked for in the config folder of the compiler root (the folder cit.py is in),
# then in the config folder of the current working directory.
# Example cit.cfg:
#
#   [cit]
#   # Path to libclang shared library. If omitted, cit will attempt to locate
#   # it automatically based on the current platform:
#   #   Windows : libclang.dll  (checked in D:\LLVM\bin, C:\Program Files\LLVM\bin, PATH)
#   #   macOS   : libclang.dylib (checked in Homebrew LLVM, Xcode CommandLineTools)
#   #   Linux   : libclang.so   (checked in /usr/lib/llvm-*, distro paths, LD_LIBRARY_PATH)
#   # Set this explicitly if auto-detection fails.
#   libclang = D:\LLVM\bin\libclang.dll
#
#   [cstdlib]
#   # Root directory where translated .idk files for system headers are written.
#   output_root = C:\IDEKA\stdlib\c
#   # Semicolon-separated list of system include roots to mirror (optional).
#   # When empty, cit infers roots from the include paths libclang reports.
#   include_roots =
#
#   [clang]
#   # Extra flags passed to libclang, space-separated.
#   args = -x c -std=c11

# Symbol that is never defined. Conditions the IDEKA preprocessor cannot express open a block
# on it so #elif/#else/#endif stay balanced; grep for it to find blocks needing manual review.
_CIT_REVIEW_SYM = "CIT_MANUAL_REVIEW_COND"

_CFT_CFG_NAME = "cit.cfg"
_CFT_CFG_DIR = "config"

def _find_config():
    """Return path to cit.cfg if found, else None."""
    candidates = [
        os.path.join(os.path.dirname(os.path.abspath(__file__)), _CFT_CFG_DIR, _CFT_CFG_NAME),
        os.path.join(os.getcwd(), _CFT_CFG_DIR, _CFT_CFG_NAME),
    ]
    for p in candidates:
        if os.path.isfile(p):
            return p
    return None

def _find_libclang():
    """Return the path to libclang shared library for the current platform,
    or None if it cannot be located automatically."""
    import platform
    system = platform.system()

    if system == "Windows":
        candidates = [
            r"D:\LLVM\bin\libclang.dll",
            r"C:\Program Files\LLVM\bin\libclang.dll",
        ]
        # Also check PATH entries for libclang.dll
        for entry in os.environ.get("PATH", "").split(os.pathsep):
            candidates.append(os.path.join(entry, "libclang.dll"))
    elif system == "Darwin":
        candidates = [
            "/usr/local/opt/llvm/lib/libclang.dylib",
            "/opt/homebrew/opt/llvm/lib/libclang.dylib",
            "/Library/Developer/CommandLineTools/usr/lib/libclang.dylib",
        ]
        # Homebrew installs versioned dylibs; glob for them
        import glob
        candidates += glob.glob("/usr/local/opt/llvm*/lib/libclang.dylib")
        candidates += glob.glob("/opt/homebrew/opt/llvm*/lib/libclang.dylib")
    else:
        # Linux and other Unix-likes
        candidates = [
            "/usr/lib/llvm/libclang.so",
            "/usr/lib/libclang.so",
            "/usr/lib64/libclang.so",
        ]
        import glob
        # Versioned .so files (libclang-18.so.1, libclang.so.1, etc.)
        candidates += glob.glob("/usr/lib/llvm-*/lib/libclang-*.so*")
        candidates += glob.glob("/usr/lib/llvm-*/lib/libclang.so*")
        candidates += glob.glob("/usr/lib/x86_64-linux-gnu/libclang-*.so*")
        candidates += glob.glob("/usr/lib/x86_64-linux-gnu/libclang.so*")
        candidates += glob.glob("/usr/lib/aarch64-linux-gnu/libclang-*.so*")
        candidates += glob.glob("/usr/lib64/libclang*.so*")
        # Also check LD_LIBRARY_PATH
        for entry in os.environ.get("LD_LIBRARY_PATH", "").split(os.pathsep):
            if entry:
                candidates += glob.glob(os.path.join(entry, "libclang*.so*"))

    for path in candidates:
        if path and os.path.isfile(path):
            return path
    return None


def _load_config():
    """Load and return a CftConfig instance."""
    cfg_path = _find_config()
    cp = configparser.ConfigParser()
    if cfg_path:
        cp.read(cfg_path)

    # [cit] section
    libclang = cp.get("cit", "libclang", fallback=None)
    if libclang:
        cx.Config.set_library_file(libclang)
    else:
        found = _find_libclang()
        if found:
            cx.Config.set_library_file(found)

    # [cstdlib] section
    cstdlib_root = cp.get("cstdlib", "output_root", fallback=None)
    raw_roots = cp.get("cstdlib", "include_roots", fallback="")
    include_roots = [r.strip() for r in raw_roots.split(";") if r.strip()]

    # [clang] section
    raw_args = cp.get("clang", "args", fallback="")
    default_args = raw_args.split() if raw_args.strip() else ["-x", "c", "-std=c11"]

    # Conditional compilation is resolved with the branches clang took, so one run
    # translates one configured build. false keeps the #if structure as written.
    resolve = cp.get("cit", "resolve_conditionals", fallback="true").strip().lower() \
        not in ("0", "false", "no", "off")

    cfg = _CftConfig(
        cstdlib_root=cstdlib_root,
        include_roots=include_roots,
        default_clang_args=default_args,
    )
    cfg.resolve_conditionals = resolve
    return cfg

class _CftConfig:
    resolve_conditionals = True

    def __init__(self, cstdlib_root, include_roots, default_clang_args):
        self.cstdlib_root = cstdlib_root            # str or None
        self.include_roots = include_roots          # list[str]
        self.default_clang_args = default_clang_args  # list[str]

# Loaded once at import time so all helpers can reference it.
CFT_CONFIG = _load_config()

# ---------------------------------------------------------------------------
# Type mapping: C canonical type -> IDEKA type string
# ---------------------------------------------------------------------------

_TYPEKIND_MAP = {
    TypeKind.VOID:      "void",
    TypeKind.BOOL:      "bool",
    TypeKind.CHAR_U:    "byte",
    TypeKind.UCHAR:     "byte",
    TypeKind.CHAR_S:    "char",
    TypeKind.SCHAR:     "i8",
    TypeKind.SHORT:     "i16",
    TypeKind.USHORT:    "u16",
    TypeKind.INT:       "int",
    TypeKind.UINT:      "uint",
    TypeKind.LONG:      "long",
    TypeKind.ULONG:     "ulong",
    TypeKind.LONGLONG:  "long",
    TypeKind.ULONGLONG: "ulong",
    TypeKind.FLOAT:     "float",
    TypeKind.DOUBLE:    "double",
    TypeKind.LONGDOUBLE:"double",   # IDEKA has no 80-bit float; map to double
}

_INTEGRAL_KINDS = (TypeKind.CHAR_U, TypeKind.UCHAR, TypeKind.CHAR_S, TypeKind.SCHAR,
                   TypeKind.SHORT, TypeKind.USHORT, TypeKind.INT, TypeKind.UINT,
                   TypeKind.LONG, TypeKind.ULONG, TypeKind.LONGLONG, TypeKind.ULONGLONG)

_TYPEDEF_MAP = {
    "size_t":    "ulong",
    "ssize_t":   "long",
    "ptrdiff_t": "long",
    "intptr_t":  "long",
    "uintptr_t": "ulong",
    "int8_t":    "i8",
    "uint8_t":   "byte",
    "int16_t":   "i16",
    "uint16_t":  "u16",
    "int32_t":   "int",
    "uint32_t":  "uint",
    "int64_t":   "long",
    "uint64_t":  "ulong",
    "wchar_t":   "u16",
    "char16_t":  "u16",
    "char32_t":  "uint",
}

# C binary operator token -> IDEKA operator
_BINOP_MAP = {
    "+": "+", "-": "-", "*": "*", "/": "/", "%": "%",
    "==": "==", "!=": "!=", "<": "<", "<=": "<=", ">": ">", ">=": ">=",
    "&&": "&", "||": "|", "!": "!",
    "&": "`&", "|": "`|", "^": "`^|", "~": "`!",
    "<<": "<<", ">>": ">>",
    "=": "=", "+=": "+=", "-=": "-=", "*=": "*=", "/=": "/=", "%=": "%=",
    "&=": "`&=", "|=": "`|=", "^=": "`^|=", "<<=": "<<=", ">>=": ">>=",
}


# IDEKA reserved keywords that are valid C identifiers -- rename on translation.
# C keywords (if, else, for, while, do, switch, case, return, break, continue,
# goto, struct, enum, union, void, int, char, float, double, signed, unsigned,
# const, volatile, extern, static, auto, register, inline, default, typedef,
# sizeof) are already illegal as C variable names so they need no entry here.
_RESERVED_RENAME = {
    "alignof":      "c_alignof",
    "and":          "and_",
    "as":           "as_",
    "assert":       "assert_",
    "bool":         "bool_",
    "byte":         "byte_",
    "cdecl":        "cdecl_",
    "comptime":     "comptime_",
    "constraint":   "constraint_",
    "contract":     "contract_",
    "data":         "dat",
    "defer":        "defer_",
    "deprecate":    "deprecate_",
    "double":       "double_",
    "elif":         "elif_",
    "emitideka":     "emitideka_",
    "escape":       "escape_",
    "export":       "export_",
    "false":        "false_",
    "fastcall":     "fastcall_",
    "float":        "float_",
    "from":         "frm",
    "global":       "global_",
    "has":          "has_",
    "heap":         "heap_",
    "in":           "in_",
    "interface":    "interface_",
    "is":           "is_",
    "jump":         "jump_",
    "label":        "label_",
    "local":        "local_",
    "long":         "long_",
    "macro":        "macro_",
    "namespace":    "namespace_",
    "noinit":       "noinit_",
    "noreturn":     "noreturn_",
    "not":          "not_",
    "object":       "object_",
    "operator":     "operator_",
    "or":           "or_",
    "private":      "private_",
    "public":       "public_",
    "singinit":     "singinit_",
    "stack":        "stack_",
    "stdcall":      "stdcall_",
    "this":         "this_",
    "thiscall":     "thiscall_",
    "throw":        "throw_",
    "trait":        "trait_",
    "true":         "true_",
    "uint":         "uint_",
    "ulong":        "ulong_",
    "using":        "using_",
    "vectorcall":   "vectorcall_",
    "xor":          "xor_",
}

# Macros that expand to nothing in IDEKA but must remain defined so other
# headers that reference them resolve. Emitted as `#def NAME 1;` which
# expands to the no-op expression statement `1;` at every call site.
_MACRO_DISCARD_STUB = {
    # Clang diagnostic guards -- no pragma support in IDEKA, no semantic value.
    "LLVM_C_STRICT_PROTOTYPES_BEGIN",
    "LLVM_C_STRICT_PROTOTYPES_END",
    # extern "C" wrappers -- IDEKA FFI uses extern{} blocks; these are no-ops.
    "LLVM_C_EXTERN_C_BEGIN",
    "LLVM_C_EXTERN_C_END",
}

# Macros that are purely local stubs with no cross-file use -- silently dropped.
_MACRO_DISCARD_SILENT = {
    # __has_feature stub -- always expands to 0 in non-Clang builds; meaningless in IDEKA.
    "__has_feature",
}

def _rename(name):
    """Rename C identifiers that are reserved keywords in IDEKA."""
    return _RESERVED_RENAME.get(name, name)


# ---------------------------------------------------------------------------
# Text scanning helpers. Nothing in this tool uses regular expressions: every
# pattern is a small hand-written scan, so the tool ports to Ideka unchanged.
# ---------------------------------------------------------------------------

def _wc(c):
    """True for a character that can be part of an identifier or number."""
    return c.isalnum() or c == '_'


def _skip_quoted(text, i):
    """Index just past the string or character literal that starts at text[i]."""
    q = text[i]
    j = i + 1
    n = len(text)
    while j < n and text[j] != q:
        j += 2 if text[j] == '\\' else 1
    return min(j + 1, n)


def _ident_end(text, i):
    """End of the identifier starting at text[i], or i when none starts there."""
    n = len(text)
    if i >= n or not (text[i].isalpha() or text[i] == '_'):
        return i
    j = i + 1
    while j < n and _wc(text[j]):
        j += 1
    return j


def _word_at(text, i, word):
    """True when `word` occurs at text[i] as a whole word."""
    j = i + len(word)
    if text[i:j] != word:
        return False
    if i > 0 and _wc(text[i - 1]):
        return False
    return j >= len(text) or not _wc(text[j])


def _find_word(text, word, start=0):
    """Index of the first whole-word occurrence of `word`, or -1."""
    i = text.find(word, start)
    while i != -1:
        if _word_at(text, i, word):
            return i
        i = text.find(word, i + 1)
    return -1


def _replace_word(text, word, repl):
    """Replace every whole-word occurrence of `word`."""
    out = []
    i = 0
    while True:
        j = _find_word(text, word, i)
        if j == -1:
            out.append(text[i:])
            return ''.join(out)
        out.append(text[i:j])
        out.append(repl)
        i = j + len(word)


def _collapse_ws(text):
    """Runs of whitespace become one space; the ends are trimmed."""
    return ' '.join(text.split())


def _words(text):
    """The identifier-like words of text, in order."""
    out = []
    i = 0
    n = len(text)
    while i < n:
        e = _ident_end(text, i)
        if e > i:
            out.append(text[i:e])
            i = e
        else:
            i += 1
    return out


def _is_ident(text):
    """True when text is exactly one identifier."""
    return bool(text) and _ident_end(text, 0) == len(text)


def _is_plain_string(text):
    """True when text is exactly one double-quoted literal."""
    return len(text) >= 2 and text[0] == '"' and _skip_quoted(text, 0) == len(text)


_DIRECTIVES = ("ifndef", "ifdef", "if", "elif", "else", "endif", "define", "undef", "include")


def _directive(line):
    """(name, rest) for a preprocessor line like `  #  define X 1`, else None."""
    t = line.lstrip()
    if not t.startswith('#'):
        return None
    t = t[1:].lstrip()
    e = _ident_end(t, 0)
    name = t[:e]
    if name not in _DIRECTIVES:
        return None
    return name, t[e:]


def _code_end(text):
    """Offset where the code of a macro body ends and a trailing comment starts (len(text)
    when there is none). String and character literals are skipped."""
    i, n = 0, len(text)
    while i < n:
        c = text[i]
        if c in '"\'':
            j = i + 1
            while j < n and text[j] != c:
                j += 2 if text[j] == '\\' else 1
            i = j + 1
            continue
        if text.startswith('/*', i) or text.startswith('//', i):
            return len(text[:i].rstrip())
        i += 1
    return n


def _c_int_value(text):
    """Value of a C integer literal (suffixes allowed), None when text is not one. A leading 0
    makes it octal in C, which int(text, 0) refuses."""
    t = text.strip().rstrip('uUlL')
    sign = 1
    if t[:1] in ('-', '+'):
        sign = -1 if t[0] == '-' else 1
        t = t[1:].strip()
    if not t or not t[0].isdigit():
        return None
    try:
        if len(t) > 1 and t[0] == '0' and all(ch in '01234567' for ch in t):
            return sign * int(t, 8)
        return sign * int(t, 0)
    except ValueError:
        return None


def _macro_call_line(line):
    """(outer, inner) for a line holding only `OUTER(INNER)`, else None."""
    t = line.strip()
    e = _ident_end(t, 0)
    if e == 0 or not t[e:].startswith('('):
        return None
    f = _ident_end(t, e + 1)
    if f == e + 1 or t[f:] != ')':
        return None
    return t[:e], t[e + 1:f]


def _macro_tokens(body):
    """The tokens of a macro body that decide whether it can stay plain text: # and ##,
    assignment operators, identifiers, ; and the brackets and commas. Literals are skipped."""
    out = []
    i = 0
    n = len(body)
    while i < n:
        c = body[i]
        if body.startswith('/*', i):
            # a comment is no part of the macro: its words must not read as statements
            e = body.find('*/', i + 2)
            i = n if e == -1 else e + 2
        elif body.startswith('//', i):
            i = n
        elif c in '"\'':
            i = _skip_quoted(body, i)
        elif c.isdigit():
            while i < n and (_wc(body[i]) or body[i] == '.'):
                i += 1
        elif c.isalpha() or c == '_':
            e = _ident_end(body, i)
            out.append(body[i:e])
            i = e
        elif body.startswith('##', i):
            out.append('##')
            i += 2
        elif c == '#':
            out.append('#')
            i += 1
        elif body[i:i + 3] in ('<<=', '>>='):
            out.append(body[i:i + 3])
            i += 3
        elif c in '-+*/%&|^' and body[i + 1:i + 2] == '=':
            out.append(body[i:i + 2])
            i += 2
        elif c == '=':
            prev = body[i - 1] if i else ''
            if prev not in '=!<>' and body[i + 1:i + 2] != '=':
                out.append('=')
            i += 1
        elif c in ';{}()[],':
            out.append(c)
            i += 1
        else:
            i += 1
    return out


def _anon_loc(spelling):
    """(line, column) from a libclang name like `struct (unnamed at f.h:12:5)`, else None."""
    for tag in ("(anonymous at ", "(unnamed at "):
        k = spelling.find(tag)
        if k == -1:
            continue
        start = k + len(tag)
        end = spelling.find(')', start)
        if end == -1:
            continue
        parts = spelling[start:end].split(':')
        if len(parts) >= 3 and parts[-1].isdigit() and parts[-2].isdigit():
            return parts[-2], parts[-1]
    return None


def _is_bare_operand(text):
    """True for a lone name, number or string literal."""
    if not text:
        return False
    if _is_ident(text) or _is_plain_string(text):
        return True
    return text[0].isdigit() and all(_wc(c) or c == '.' for c in text)


def _defined_arg(expr):
    """The name in `defined X`, `defined(X)` or `defined ( X )` (the whole text), else None."""
    e = expr.strip()
    if not _word_at(e, 0, "defined"):
        return None
    t = e[7:].lstrip()
    paren = t.startswith('(')
    if paren:
        t = t[1:].lstrip()
    k = _ident_end(t, 0)
    if k == 0:
        return None
    name = t[:k]
    t = t[k:].lstrip()
    if paren:
        if not t.startswith(')'):
            return None
        t = t[1:].lstrip()
    return name if t == '' else None


def _num_suffixes(text):
    """C numeric literal suffixes to the ones IDEKA reads: u, l, ul for integers (ll is
    plain l), f and d for floating point (a C long double suffix L becomes d)."""
    out = []
    i = 0
    n = len(text)
    while i < n:
        c = text[i]
        if c in '"\'':
            j = _skip_quoted(text, i)
            out.append(text[i:j])
            i = j
            continue
        prev = text[i - 1] if i else ''
        starts = c.isdigit() or (c == '.' and i + 1 < n and text[i + 1].isdigit())
        if not starts or _wc(prev) or prev == '.':
            out.append(c)
            i += 1
            continue
        j = i
        if c == '0' and i + 1 < n and text[i + 1] in 'xX':
            j = i + 2
            while j < n and text[j] in '0123456789abcdefABCDEF':
                j += 1
        else:
            while j < n and text[j].isdigit():
                j += 1
            if j < n and text[j] == '.':
                j += 1
                while j < n and text[j].isdigit():
                    j += 1
            if j < n and text[j] in 'eE':
                k = j + 1
                if k < n and text[k] in '+-':
                    k += 1
                if k < n and text[k].isdigit():
                    while k < n and text[k].isdigit():
                        k += 1
                    j = k
        num = text[i:j]
        k = j
        while k < n and k - j < 3 and text[k] in 'uUlLfF':
            k += 1
        suf = text[j:k]
        if not suf or (k < n and (_wc(text[k]) or text[k] == '.')):
            out.append(text[i:k] if not suf else text[i:j])
            i = k if not suf else j
            if suf:
                out.append(text[j:k])
                i = k
            continue
        low = suf.lower()
        is_hex = num[:2].lower() == "0x"
        is_float = (not is_hex) and ('.' in num or 'e' in num.lower())
        if is_float:
            out.append(num + ("f" if low == "f" else "d" if low == "l" else ""))
        elif 'f' in low:
            out.append(num + suf)
        else:
            u = 'u' in low
            l = 'l' in low
            out.append(num + ("ul" if u and l else "u" if u else "l" if l else ""))
        i = k
    return ''.join(out)


def _with_name(type_text, name):
    """type + declarator name. A function pointer type reads `cdecl{}* name(params) -> ret`,
    so the name goes after the `*`, not at the end."""
    head = "cdecl{}*"
    if name and type_text.startswith(head) and type_text[len(head):].startswith("("):
        return f"{head} {name}{type_text[len(head):]}"
    return f"{type_text} {name}".strip()


def _idk_name(path, base_dir=None):
    """The .idk file name for a C source or header. A header and a source with the same
    stem would otherwise write the same file, so the source of such a pair becomes
    <stem>_c.idk and the header keeps <stem>.idk. path may be relative to base_dir."""
    stem, ext = os.path.splitext(path)
    if ext.lower() == ".c":
        full = os.path.join(base_dir, stem + ".h") if base_dir else stem + ".h"
        if os.path.isfile(full):
            return stem + "_c.idk"
        return stem + ".idk"
    if ext.lower() == ".h":
        return stem + ".idk"
    return path


PART2_SUFFIX = "_part2"

_OPAPI = []


def _cxstring_result(res, func=None, args=None):
    """ctypes errcheck turning a returned CXString into text. The Python bindings of
    clang 21 take the string alone, older ones take the errcheck arguments as well."""
    try:
        return cx._CXString.from_result(res)
    except TypeError:
        return cx._CXString.from_result(res, func, args)


def _opapi():
    """libclang's operator-kind functions (clang 17 and newer). The Python bindings
    do not wrap them, but they are what stays right for nodes that come out of a macro
    expansion, where the operator token cannot be found in the source."""
    if not _OPAPI:
        import ctypes
        try:
            lib = cx.conf.lib
            fb = lib.clang_getCursorBinaryOperatorKind
            fb.argtypes = [cx.Cursor]
            fb.restype = ctypes.c_int
            sb = lib.clang_getBinaryOperatorKindSpelling
            sb.argtypes = [ctypes.c_int]
            sb.restype = cx._CXString
            sb.errcheck = _cxstring_result
            fu = lib.clang_getCursorUnaryOperatorKind
            fu.argtypes = [cx.Cursor]
            fu.restype = ctypes.c_int
            su = lib.clang_getUnaryOperatorKindSpelling
            su.argtypes = [ctypes.c_int]
            su.restype = cx._CXString
            su.errcheck = _cxstring_result
            _OPAPI.extend((fb, sb, fu, su))
        except Exception:
            _OPAPI.extend((None, None, None, None))
    return _OPAPI


def _eval_int(cursor):
    """Integer value of a constant expression node through clang_Cursor_Evaluate, or None."""
    import ctypes
    try:
        lib = cx.conf.lib
        ev = lib.clang_Cursor_Evaluate
        ev.argtypes = [cx.Cursor]
        ev.restype = ctypes.c_void_p
        kind = lib.clang_EvalResult_getKind
        kind.argtypes = [ctypes.c_void_p]
        kind.restype = ctypes.c_int
        gl = lib.clang_EvalResult_getAsLongLong
        gl.argtypes = [ctypes.c_void_p]
        gl.restype = ctypes.c_longlong
        gu = lib.clang_EvalResult_getAsUnsigned
        gu.argtypes = [ctypes.c_void_p]
        gu.restype = ctypes.c_ulonglong
        un = lib.clang_EvalResult_isUnsignedInt
        un.argtypes = [ctypes.c_void_p]
        un.restype = ctypes.c_uint
        dp = lib.clang_EvalResult_dispose
        dp.argtypes = [ctypes.c_void_p]
        dp.restype = None
    except Exception:
        return None
    r = ev(cursor)
    if not r:
        return None
    try:
        if kind(r) != 1:            # CXEval_Int
            return None
        return int(gu(r)) if un(r) else int(gl(r))
    finally:
        dp(r)


def _api_binop(cursor):
    fb, sb, _fu, _su = _opapi()
    if fb is None:
        return None
    k = fb(cursor)
    return sb(k) if k else None


def _api_unop(cursor):
    """(spelling, is_postfix) of a unary operator node, or None."""
    _fb, _sb, fu, su = _opapi()
    if fu is None:
        return None
    k = fu(cursor)
    if not k:
        return None
    return su(k), k in (1, 2)       # CXUnaryOperator_PostInc, PostDec


def _best_relative(abs_path, roots):
    """Return the relative path of abs_path under the longest matching root,
    or None if no root matches.

    roots is a list of absolute directory paths.
    """
    best_rel = None
    best_len = -1
    norm = os.path.normcase(abs_path)
    for root in roots:
        norm_root = os.path.normcase(root)
        if not norm_root.endswith(os.sep):
            norm_root += os.sep
        if norm.startswith(norm_root) and len(norm_root) > best_len:
            best_rel = abs_path[len(norm_root):]
            best_len = len(norm_root)
    return best_rel


class CTranslator:

    def __init__(self, filepath, args=None, tu=None):
        """tu: translation unit that already holds filepath. A header is written from
        the unit of the file that included it, so it is seen with the macros and types
        that file had defined, which a header on its own would lack."""
        self.filepath = filepath
        self.lines = []
        self._emitted_types = set()
        self._declared_types = set()  # records declared with no body so far
        self._emitted_prototypes = set()  # function names emitted as prototypes only
        self._pending_typedefs = {}
        self._need_i128 = False
        self._need_u128 = False
        self._indent = 0
        self._switch_depth = 0  # incremented inside switch body
        self._loop_depth_in_switch_stack = []  # per-switch loop nesting depth
        self._dir_emitted = False
        self._fp_aliases = set()
        self._defd = set()   # names a #def already stands for
        self._decl_start = None
        self._system_file = self._is_system_path(filepath)
        self._gt_reset()
        self._case_labels = {}  # case/default hash -> label written just before it
        self._anon_counter = 0  # counter for synthesized anonymous struct/union names
        self._union_last = {}   # union variable -> member written last, per function
        self._union_tmp = 0
        self._cplusplus_depth = 0  # nesting depth inside #ifdef __cplusplus blocks
        self._index = cx.Index.create()
        clang_args = args or CFT_CONFIG.default_clang_args
        if tu is not None:
            self.tu = tu
        else:
            self.tu = self._index.parse(filepath, args=clang_args,
                                        options=cx.TranslationUnit.PARSE_DETAILED_PROCESSING_RECORD)
            CTranslator._last_args = list(clang_args)
        with open(filepath, 'rb') as _f:
            self._src_bytes = _f.read()
        self._shared_tu = tu is not None
        self._part = None   # 0 or 1 when one file is written as two parts (see _split_info)

    def _file_extent(self):
        """Source range of the whole file being translated."""
        f = self.tu.get_file(self.filepath)
        if f is None:
            return self.tu.cursor.extent
        return cx.SourceRange.from_locations(
            self.tu.get_location(self.filepath, 0),
            self.tu.get_location(self.filepath, len(self._src_bytes)))

    # -----------------------------------------------------------------------
    # Public entry point
    # -----------------------------------------------------------------------

    def _emit_toplevel_comments(self):
        """Emit any block or line comments that appear before the first declaration
        in the main file, converted to IDEKA comment syntax."""
        # Find the offset of the first cursor from the main file so we know
        # how far into the token stream to look.
        first_offset = None
        for cursor in self.tu.cursor.get_children():
            if self._is_from_main_file(cursor):
                first_offset = cursor.extent.start.offset
                break

        main_abs = os.path.abspath(self.filepath)
        for tok in self.tu.get_tokens(extent=self._file_extent()):
            if tok.kind != cx.TokenKind.COMMENT:
                continue
            tok_file = tok.location.file
            if tok_file is None:
                continue
            if os.path.abspath(tok_file.name) != main_abs:
                continue
            # Only include comments that precede the first declaration
            if first_offset is not None and tok.extent.start.offset >= first_offset:
                break
            text = tok.spelling
            if text.startswith("/*"):
                # Convert /* ... */ to IDEKA /// ... ///
                inner = text[2:]
                if inner.endswith("*/"):
                    inner = inner[:-2]
                self._emit("///")
                for line in inner.splitlines():
                    # Strip the leading " * " or " " that C block comments use
                    stripped = line.rstrip()
                    if stripped.startswith("   "):
                        stripped = stripped[3:]
                    elif stripped.startswith(" "):
                        stripped = stripped[1:]
                    self._emit(stripped)
                self._emit("///")
                self._emit("")
            elif text.startswith("//"):
                self._emit(text)
                self._emit("")

    def translate(self):
        self._emit(f"// Auto-generated by cit from: {os.path.basename(self.filepath)}")
        self._emit("// May require manual edits.")
        self._emit("")

        self._collect_typedef_names(self.tu.cursor)

        # Collect the byte offsets of all MACRO_DEFINITION cursors from the
        # main file so we can skip re-emitting plain #define lines that the
        # source scan would otherwise duplicate.
        self._ast_macro_offsets = set()
        for cursor in self.tu.cursor.get_children():
            if (cursor.kind == CursorKind.MACRO_DEFINITION
                    and self._is_from_main_file(cursor)):
                self._ast_macro_offsets.add(cursor.extent.start.offset)

        # Collect preprocessor events (offset, emit_fn) in source order.
        pp_events = self._collect_pp_events()

        # Collect non-macro AST cursors from the main file, sorted by offset.
        ast_cursors = [
            c for c in self.tu.cursor.get_children()
            if self._is_from_main_file(c)
            and c.kind != CursorKind.MACRO_DEFINITION
        ]
        ast_cursors.sort(key=lambda c: c.extent.start.offset)

        # Merge: emit pp events and AST nodes in source order.
        pp_idx = 0
        for cursor in ast_cursors:
            cursor_offset = cursor.extent.start.offset
            while pp_idx < len(pp_events) and pp_events[pp_idx][0] <= cursor_offset:
                pp_events[pp_idx][1]()
                pp_idx += 1
            self._visit_top(cursor)

        # Flush any remaining preprocessor events after the last AST node.
        while pp_idx < len(pp_events):
            pp_events[pp_idx][1]()
            pp_idx += 1

        for imp in getattr(self, '_macro_imports', []):
            line = f'#import "{imp}";'
            if line not in self.lines:
                last = -1
                for k, l in enumerate(self.lines):
                    if l.startswith("#import "):
                        last = k
                self.lines[last + 1:last + 1] = [line]
        prefix = []
        has_main = False
        # u8/u16/i16/... live in the stdlib's types.idk; every output file names them
        if any(w in ("u8", "i8", "u16", "i16", "u32", "i32", "u64", "i64")
               for w in _words("\n".join(self.lines))):
            prefix += ["#import <types.idk>;", ""]
        if any(l.startswith("def main(") for l in self.lines):
            # an executable's entry code comes with the standard runtime
            has_main = True
        if self._need_i128:
            prefix += [
                "// __int128 emulated as two paired 64-bit halves (mirrors GCC/Clang ABI)",
                "struct __int128_t { long lo; long hi; };",
                "",
            ]
        if self._need_u128:
            prefix += [
                "// __uint128_t emulated as two paired 64-bit halves (mirrors GCC/Clang ABI)",
                "struct __uint128_t { ulong lo; ulong hi; };",
                "",
            ]
        if prefix:
            self.lines = prefix + self.lines
        if getattr(self, '_need_va_tag', False):
            # x86-64 System V va_list element: clang builds it in, so it is written out here
            self.lines[0:0] = [
                "// clang's builtin va_list record (x86-64 System V)",
                "#ifndef _CIT_VA_LIST_TAG;",
                "#def _CIT_VA_LIST_TAG 1;",
                "cstruct __va_list_tag",
                "{",
                "    uint gp_offset;",
                "    uint fp_offset;",
                "    void* overflow_arg_area;",
                "    void* reg_save_area;",
                "};",
                "#endif;",
                "",
            ]
        if has_main:
            # The runtime comes after the file's own imports: the translated C headers
            # #def names (SEEK_SET ...) the runtime declares only when nothing has yet.
            last = -1
            for k, l in enumerate(self.lines):
                if l.startswith("#import "):
                    last = k
            self.lines[last + 1:last + 1] = ["#import <standard.idk>;", ""]

        return "\n".join(self.lines)

    # -----------------------------------------------------------------------
    # Preprocessor directive scanner
    # -----------------------------------------------------------------------

    def _skipped_ranges(self):
        """Byte ranges (start, end) of the main file that the preprocessor skipped:
        the branches of #if / #ifdef / #else that were not taken."""
        ranges = getattr(self, '_skipped_cache', None)
        if ranges is not None:
            return ranges
        import ctypes
        ranges = []
        try:
            class _RangeList(ctypes.Structure):
                _fields_ = [("count", ctypes.c_uint),
                            ("ranges", ctypes.POINTER(cx.SourceRange))]
            lib = cx.conf.lib
            get = lib.clang_getSkippedRanges
            get.argtypes = [cx.TranslationUnit, cx.File]
            get.restype = ctypes.POINTER(_RangeList)
            dispose = lib.clang_disposeSourceRangeList
            dispose.argtypes = [ctypes.POINTER(_RangeList)]
            dispose.restype = None
            f = self.tu.get_file(self.filepath)
            rl = get(self.tu, f)
            if rl:
                for k in range(rl.contents.count):
                    r = rl.contents.ranges[k]
                    ranges.append((r.start.offset, r.end.offset))
                dispose(rl)
        except Exception:
            ranges = []
        self._raw_skipped = list(ranges)
        if self._part is not None:
            # libclang reports only the first inclusion's skipped ranges: part 0 is what that
            # inclusion kept, part 1 is what it skipped (kept by a later inclusion)
            if self._part == 1:
                comp = []
                pos = 0
                for a, b in sorted(ranges):
                    if a > pos:
                        comp.append((pos, a))
                    pos = max(pos, b)
                comp.append((pos, len(self._src_bytes) + 1))
                ranges = comp
            ranges = sorted(ranges)
            self._skipped_cache = ranges
            return ranges
        # A file included more than once (tcc.h takes x86_64-gen.c with
        # TARGET_DEFS_ONLY, the unit then takes it whole) is reported skipped once per
        # inclusion. Text that any inclusion kept is part of the file: it is skipped
        # only where every inclusion skipped it. System headers keep the plain list: their
        # repeated inclusions (`__need_*` stddef pieces) are cut by guards libclang does not report.
        here = os.path.abspath(self.filepath)
        times = sum(1 for inc in self.tu.get_includes()
                    if inc.include and os.path.abspath(inc.include.name) == here)
        if os.path.abspath(self.tu.spelling) == here:
            times += 1      # the unit's own file is one more inclusion
        if times > 1 and not self._system_file and os.path.abspath(self.tu.spelling) == here:
            marks = []
            for a, b in ranges:
                marks.append((a, 1))
                marks.append((b, -1))
            marks.sort()
            merged = []
            depth = 0
            start = None
            for off, d in marks:
                before = depth
                depth += d
                if before < times <= depth:
                    start = off
                elif before >= times > depth and start is not None:
                    if off > start:
                        merged.append((start, off))
                    start = None
            ranges = merged
        ranges.sort()
        self._skipped_cache = ranges
        return ranges

    def _later_part_inclusion(self, target, offset):
        """True when the #include at `offset` of this file is a later inclusion of a file that
        is written as two parts: it takes the second part."""
        line = self._src_bytes.count(b'\n', 0, offset) + 1
        me = os.path.abspath(self.filepath)
        target = os.path.abspath(target)
        seen = 0
        for inc in self.tu.get_includes():
            if not inc.include or os.path.abspath(inc.include.name) != target:
                continue
            at = inc.location
            if (at.file is not None and os.path.abspath(at.file.name) == me and at.line == line):
                break
            seen += 1
        else:
            return False
        if seen == 0:
            return False
        key = (target, id(self.tu))
        info = CTranslator._split_files.get(key)
        if info is None:
            info = CTranslator(target, tu=self.tu)._split_info()
            CTranslator._split_files[key] = info
        if info and target not in CTranslator._wanted_part2:
            CTranslator._wanted_part2[target] = self.tu
        return info

    _wanted_part2 = {}
    _out_paths = {}

    _split_files = {}

    def _inclusion_count(self):
        here = os.path.abspath(self.filepath)
        times = sum(1 for inc in self.tu.get_includes()
                    if inc.include and os.path.abspath(inc.include.name) == here)
        if os.path.abspath(self.tu.spelling) == here:
            times += 1
        return times

    def _split_info(self):
        """True when this file is included more than once and a later inclusion kept
        declarations that the first one skipped (x86_64-gen.c: tcc.h takes the target
        definitions, the unit then takes the bodies). C sees those two pieces at two
        points of the include order, so they are written as two files: the second one is
        imported where the later inclusion stands."""
        cached = getattr(self, '_split_cache', None)
        if cached is not None:
            return cached
        result = False
        here = os.path.abspath(self.filepath)
        if (not self._system_file and os.path.abspath(self.tu.spelling) != here
                and self._inclusion_count() > 1):
            saved = self._part
            self._part = None
            self._skipped_cache = None
            self._skipped_ranges()
            raw = list(getattr(self, '_raw_skipped', []))
            self._part = saved
            self._skipped_cache = None
            if raw:
                for cursor in self.tu.cursor.get_children():
                    if (cursor.kind in (CursorKind.MACRO_DEFINITION, CursorKind.MACRO_INSTANTIATION,
                                        CursorKind.INCLUSION_DIRECTIVE)
                            or not self._is_from_main_file(cursor)):
                        continue
                    off = cursor.extent.start.offset
                    if any(a <= off < b for a, b in raw):
                        result = True
                        break
        self._split_cache = result
        return result

    def _is_skipped(self, offset):
        if not CFT_CONFIG.resolve_conditionals:
            return False
        for a, b in self._skipped_ranges():
            if a > offset:
                break
            if a <= offset < b:
                return True
        return False

    def _collect_pp_events(self):
        """Scan the raw source bytes line-by-line and collect (byte_offset, emit_fn)
        pairs for all preprocessor directives and relevant bare macro invocations.

        Returns a list sorted by byte_offset so translate() can interleave these
        events with AST cursor emissions in source order.

        This is necessary because libclang's AST flattens conditional blocks --
        only the branch taken during parsing survives as MACRO_DEFINITION cursors,
        so the full #if/#elif/#else/#endif structure is invisible to the AST walk.

        Simple object-like and function-like macros that ARE visible in the AST
        are collected here in source order; the AST walk in translate() skips
        MACRO_DEFINITION cursors to avoid duplication.
        """

        src = self._src_bytes.decode('utf-8', errors='replace')
        lines = src.splitlines(keepends=True)

        # Build a table of byte offsets for each line so we can tag each event
        # with the offset at which it appears in the source.
        line_offsets = []
        offset = 0
        for line in lines:
            line_offsets.append(offset)
            offset += len(line.encode('utf-8', errors='replace'))

        # Strip keepends for content matching.
        raw_lines = [l.rstrip('\r\n') for l in lines]

        events = []

        # Build a list of (start, end) byte ranges for every non-macro AST cursor
        # from the main file.  Comment tokens that fall inside one of these ranges
        # are inline member comments (e.g. /**< ... */ on enum values) and will be
        # handled by the per-declaration emitters; they must not be emitted as
        # standalone events or they'll appear after the closing }; of their parent.
        main_abs = os.path.abspath(self.filepath)
        ast_extents = []
        for cursor in self.tu.cursor.get_children():
            if not self._is_from_main_file(cursor):
                continue
            if cursor.kind == CursorKind.MACRO_DEFINITION:
                continue
            ast_extents.append((cursor.extent.start.offset, cursor.extent.end.offset))

        def _inside_ast_extent(offset):
            for start, end in ast_extents:
                if start <= offset < end:
                    return True
            return False

        # Collect all comment tokens from the main file and add them as events.
        # libclang gives us exact byte offsets, so they'll interleave correctly
        # with directive events and AST nodes after sorting.
        for tok in self.tu.get_tokens(extent=self._file_extent()):
            if tok.kind != cx.TokenKind.COMMENT:
                continue
            tok_file = tok.location.file
            if tok_file is None:
                continue
            if os.path.abspath(tok_file.name) != main_abs:
                continue
            text = tok.spelling
            tok_offset = tok.extent.start.offset

            # Skip inline comments that live inside a declaration's extent.
            if _inside_ast_extent(tok_offset):
                continue
            if self._is_skipped(tok_offset):
                continue

            def make_comment_event(text=text):
                if self._cplusplus_depth > 0:
                    return
                if text.startswith("/*"):
                    inner = text[2:]
                    if inner.endswith("*/"):
                        inner = inner[:-2]
                    self._emit("///")
                    for line in inner.splitlines():
                        stripped = line.rstrip()
                        if stripped.startswith("   "):
                            stripped = stripped[3:]
                        elif stripped.startswith(" "):
                            stripped = stripped[1:]
                        self._emit(stripped)
                    self._emit("///")
                    self._emit("")
                elif text.startswith("//"):
                    self._emit(text)
                    self._emit("")

            events.append((tok_offset, make_comment_event))

        # Lines that begin inside a /* */ comment (or inside a line continued from one)
        # must not be scanned for directives: comments may mention "#if" and "#endif".
        in_comment_start = []
        _in_block = False
        for _ln in raw_lines:
            in_comment_start.append(_in_block)
            _j, _n = 0, len(_ln)
            while _j < _n:
                if _in_block:
                    _k = _ln.find("*/", _j)
                    if _k < 0:
                        break
                    _in_block = False
                    _j = _k + 2
                    continue
                _c = _ln[_j]
                if _c == '"' or _c == "'":
                    _q = _c
                    _j += 1
                    while _j < _n and _ln[_j] != _q:
                        _j += 2 if _ln[_j] == '\\' else 1
                    _j += 1
                elif _ln.startswith("//", _j):
                    break
                elif _ln.startswith("/*", _j):
                    _in_block = True
                    _j += 2
                else:
                    _j += 1

        i = 0
        while i < len(raw_lines):
            raw = raw_lines[i]
            line_offset = line_offsets[i]

            if self._is_skipped(line_offset):
                i += 1
                continue
            m = None if in_comment_start[i] else _directive(raw)
            if (m and CFT_CONFIG.resolve_conditionals
                    and m[0] in ('ifndef', 'ifdef', 'if', 'elif', 'else', 'endif')):
                i += 1
                continue
            if not m:
                # Check for bare stub macro invocations on their own line.
                if raw.strip() in _MACRO_DISCARD_STUB:
                    name = raw.strip()
                    events.append((line_offset, lambda _n=name: self._emit(f"{_n};")))
                    i += 1
                    continue

                # Check for bare macro call-site invocations: OUTER(INNER)
                cm = None if self._system_file else _macro_call_line(raw)
                if cm:
                    outer, inner = cm
                    events.append((line_offset,
                                   lambda _o=outer, _i=inner:
                                       self._emit_macro_call_site(_o, _i)))
                i += 1
                continue

            keyword = m[0]
            rest = m[1].strip()

            # Handle line continuations (backslash-newline) for multi-line defines.
            full_rest = rest
            while full_rest.endswith('\\') and i + 1 < len(raw_lines):
                full_rest = full_rest[:-1]
                i += 1
                full_rest += raw_lines[i].strip()

            # Capture keyword/full_rest for the closure.
            kw = keyword
            fr = full_rest
            lo = line_offset

            def make_event(kw=kw, fr=fr, lo=lo):
                # C++ guard detection: ifdef/ifndef __cplusplus and if defined(__cplusplus)
                def _is_cplusplus_cond(keyword, rest):
                    r = rest.strip()
                    if keyword in ('ifdef', 'ifndef') and r == '__cplusplus':
                        return True
                    # #if defined(__cplusplus)
                    if keyword == 'if':
                        stripped = r.replace(' ', '')
                        if stripped in ('defined(__cplusplus)', 'defined(__cplusplus)'):
                            return True
                        if stripped == '__cplusplus':
                            return True
                    return False

                if kw in ('ifndef', 'ifdef', 'if'):
                    if _is_cplusplus_cond(kw, fr):
                        self._cplusplus_depth += 1
                        return  # suppress entirely
                    if self._cplusplus_depth > 0:
                        self._cplusplus_depth += 1
                        return
                    cond = self._translate_pp_condition(fr)
                    if kw == 'ifndef':
                        if self._cond_is_psub_name(cond):
                            self._emit(f"#ifnpsub {cond};")
                        else:
                            self._emit(f"#ifndef {cond};")
                    elif kw == 'ifdef':
                        if self._cond_is_psub_name(cond):
                            self._emit(f"#ifpsub {cond};")
                        else:
                            self._emit(f"#ifdef {cond}")
                    else:
                        _fs = fr.strip()
                        _e = _ident_end(_fs, 0)
                        if _e and _fs[_e:].lstrip().startswith('('):
                            macro_name = _fs[:_e]
                            self._emit(f"// #if {fr}")
                            self._emit(f"#ifpsub {macro_name};")
                        else:
                            kind, sym = self._classify_pp_cond(fr)
                            self._emit(f"// #if {fr}")
                            if kind == 'ifdef':
                                self._emit(f"#ifdef {sym}")
                            elif kind == 'ifndef':
                                self._emit(f"#ifndef {sym};")
                            else:
                                self._emit(f"// MANUAL REVIEW REQUIRED -- complex #if condition not translatable to IDEKA")
                                self._emit(f"#ifdef {_CIT_REVIEW_SYM}")

                elif kw in ('elif', 'else'):
                    if self._cplusplus_depth > 0:
                        return  # suppress
                    if kw == 'elif':
                        if fr.strip():
                            self._emit(f"// #elif {fr}")
                        kind, sym = self._classify_pp_cond(fr)
                        if kind == 'ifndef':
                            self._emit(f"#elif !defined({sym});")
                        elif kind == 'ifdef':
                            self._emit(f"#elif {sym};")
                        else:
                            self._emit(f"// complex #elif condition above -- manual review needed")
                            self._emit(f"#elif {_CIT_REVIEW_SYM};")
                    else:
                        self._emit(f"#else")

                elif kw == 'endif':
                    if self._cplusplus_depth > 0:
                        self._cplusplus_depth -= 1
                        return  # suppress
                    self._emit(f"#endif;")

                elif kw == 'undef':
                    if self._cplusplus_depth > 0:
                        return
                    self._emit(f"// #undef {fr}")

                elif kw == 'define':
                    if self._cplusplus_depth > 0:
                        return
                    self._emit_pp_define(fr)

                elif kw == 'include':
                    if self._cplusplus_depth > 0:
                        return
                    inc_m = None
                    if fr[:1] in ('<', '"'):
                        _endq = '>' if fr[0] == '<' else '"'
                        _k = fr.find(_endq, 1)
                        # `.*?[>"]` ends at whichever closer comes first
                        _k2 = min([x for x in (fr.find('>', 1), fr.find('"', 1)) if x != -1],
                                  default=-1)
                        if _k2 != -1:
                            inc_m = (fr[0], fr[1:_k2])
                    if inc_m:
                        bracket, path = inc_m
                        here = os.path.dirname(os.path.abspath(self.filepath))
                        fx_path = _idk_name(path, here)
                        # Skip an include that names this very file's own output
                        own = os.path.abspath(self.filepath)
                        hit = None
                        for base in [here] + [os.path.abspath(r) for r in CFT_CONFIG.include_roots]:
                            cand = os.path.normpath(os.path.join(base, path))
                            if os.path.exists(cand):
                                hit = cand
                                break
                        if hit is not None:
                            if os.path.normcase(hit) == os.path.normcase(own):
                                return
                        elif os.path.basename(fx_path) == os.path.basename(
                                _idk_name(os.path.basename(self.filepath), here)):
                            return
                        if hit is not None and self._later_part_inclusion(hit, lo):
                            fx_path = fx_path[:-4] + PART2_SUFFIX + fx_path[-4:]
                        close = '"' if bracket == '"' else '>'
                        if bracket == '<' and CFT_CONFIG.cstdlib_root and not self._dir_emitted:
                            # the translated system headers live in the cstdlib output
                            # root: tell the preprocessor where to look for them
                            self._dir_emitted = True
                            root = os.path.abspath(CFT_CONFIG.cstdlib_root).replace('\\', '\\\\')
                            self._emit(f'#dir "{root}";')
                        if bracket == '<' and CFT_CONFIG.cstdlib_root:
                            # <> means the IDEKA stdlib; a translated C header is found
                            # through #dir like a local file
                            bracket, close = '"', '"'
                        self._emit(f'#import {bracket}{fx_path}{close};')
                    else:
                        self._emit(f'// #include {fr}  // untranslated')

            events.append((lo, make_event))
            i += 1

        events.sort(key=lambda e: e[0])
        return events

    @staticmethod
    def _find_one_param_define(src, name):
        """(param, body) of `#define NAME(param) body`, continuation lines joined."""
        lines = src.splitlines()
        for i, line in enumerate(lines):
            d = _directive(line)
            if not d or d[0] != 'define':
                continue
            rest = d[1].lstrip()
            if not _word_at(rest, 0, name):
                continue
            rest = rest[len(name):].lstrip()
            if not rest.startswith('('):
                continue
            e = _ident_end(rest, 1)
            if e == 1:
                continue
            tail = rest[e:].lstrip()
            if not tail.startswith(')'):
                continue
            param = rest[1:e]
            body = tail[1:].strip()
            j = i
            while body.endswith('\\') and j + 1 < len(lines):
                j += 1
                body = body[:-1].rstrip() + ' ' + lines[j].strip()
            return param, body.strip()
        return None

    @staticmethod
    def _split_fn_decl(text):
        """(return type, name, params) of `ret name(params);`, or None."""
        t = text.strip()
        if t.endswith(';'):
            t = t[:-1].rstrip()
        if not t.endswith(')'):
            return None
        k = t.find('(')
        if k <= 0 or t.find(')') != len(t) - 1:
            return None
        head = t[:k].rstrip()
        e = len(head)
        b = e
        while b > 0 and _wc(head[b - 1]):
            b -= 1
        if b == e:
            return None
        return head[:b].strip(), head[b:e], t[k + 1:-1].strip()

    def _emit_macro_call_site(self, outer, inner):
        """Emit a IDEKA translation for a bare macro call-site invocation of the
        form OUTER(INNER) found in the source (not a #define line).

        The strategy is to look up OUTER's #define body in the raw source,
        substitute every occurrence of OUTER's parameter with INNER, then
        determine what INNER itself expands to and what each resulting call
        to INNER(X) should produce.

        If INNER is itself a known function-like macro whose body is a single
        extern function declaration prototype, we expand the whole thing into
        an extern block of IDEKA prototypes.  Otherwise we emit a comptime block
        that calls the INNER psub for each token produced by OUTER.
        """
        src = self._src_bytes.decode('utf-8', errors='replace')

        # Extract the body of OUTER -- the function-like macro that iterates.
        # We look for:  #define OUTER(param) <body...with continuations>
        found = self._find_one_param_define(src, outer)
        if not found:
            self._emit(f"// {outer}({inner})  // could not resolve -- manual expansion needed")
            return

        outer_param, outer_body = found

        # Collect every token that OUTER passes to its parameter.
        # OUTER bodies look like:  param(Foo) param(Bar) ...
        # We want the argument to each call of the parameter macro.
        subclass_names = []
        k = _find_word(outer_body, outer_param)
        while k != -1:
            e = k + len(outer_param)
            f = _ident_end(outer_body, e + 1) if outer_body[e:e + 1] == '(' else e
            if f > e + 1 and outer_body[f:f + 1] == ')':
                subclass_names.append(outer_body[e + 1:f])
            k = _find_word(outer_body, outer_param, e)

        if not subclass_names:
            self._emit(f"// {outer}({inner})  // could not expand -- manual translation needed")
            return

        # Now determine what each INNER(name) call should produce.
        # Look up INNER's #define body.
        found_inner = self._find_one_param_define(src, inner)

        if found_inner:
            inner_param, inner_body = found_inner

            # Substitute the inner param placeholder with a sentinel, translate,
            # then for each name substitute the sentinel back.
            sentinel = f"_CFT_PARAM_{inner_param}_"
            body_with_sentinel = _replace_word(inner_body, inner_param, sentinel)
            # Strip leading attribute-like macros (LLVM_C_ABI etc.) for type parsing.
            body_clean = _replace_word(body_with_sentinel, "LLVM_C_ABI", "").strip()
            body_clean = body_clean.replace('##', '')  # remove token-paste ops

            m_fn = self._split_fn_decl(body_clean)
            if m_fn:
                # Looks like a function declaration -- emit as extern block.
                ret_raw, name_raw, params_raw = m_fn
                # Translate C types to IDEKA types.
                ret_type = self._c_type_str_to_IDEKA(ret_raw) if ret_raw else 'void'
                params_IDEKA = self._translate_param_list_str(params_raw)

                self._emit(f"// {outer}({inner})")
                self._emit("extern")
                self._emit("{")
                for idx, name in enumerate(subclass_names):
                    IDEKA_fn_name = name_raw.replace(sentinel, name)
                    comma = ',' if idx < len(subclass_names) - 1 else ';'
                    self._emit(f"    cdecl !!{IDEKA_fn_name}({params_IDEKA}) -> {ret_type}{comma}")
                self._emit("};")
                self._emit("")
                return

        # Fallback: INNER is not a simple function-decl macro, or we couldn't
        # parse its body.  Emit a comptime block that calls the INNER psub for
        # each subclass name so at least the structure is preserved.
        self._emit(f"// {outer}({inner})")
        self._emit("comptime")
        self._emit("{")
        for name in subclass_names:
            self._emit(f"    {inner}({name});")
        self._emit("};")
        self._emit("")

    def _c_type_str_to_IDEKA(self, c_type_str):
        """Best-effort translation of a C type string (e.g. 'LLVMValueRef',
        'unsigned int', 'const char *', 'unsigned long long') to a IDEKA type
        string.  Used when translating macro-expanded function declaration bodies."""
        s = c_type_str.strip()

        # Strip struct/enum/union/class prefixes and the qualifiers IDEKA has no
        # equivalent for, then squeeze the spacing
        for tag in ('struct', 'enum', 'union', 'class', 'const', 'volatile', 'restrict',
                    '__restrict', '__restrict__', '__volatile__', '__const'):
            s = _replace_word(s, tag, '')
        s = _collapse_ws(s)

        # Count and strip trailing '*' for pointer depth (before multi-word resolution)
        ptr_depth = 0
        while s.endswith('*'):
            ptr_depth += 1
            s = s[:-1].strip()

        # Multi-word type normalization (order matters: longest match first)
        _MULTI_WORD = {
            'unsigned long long': 'ulong',
            'signed long long':   'long',
            'long long unsigned': 'ulong',
            'long long signed':   'long',
            'long long':          'long',
            'unsigned long':      'ulong',
            'signed long':        'long',
            'long unsigned':      'ulong',
            'long signed':        'long',
            'unsigned short':     'u16',
            'signed short':       'i16',
            'short unsigned':     'u16',
            'short signed':       'i16',
            'unsigned char':      'byte',
            'signed char':        'i8',
            'char unsigned':      'byte',
            'char signed':        'i8',
            'unsigned int':       'uint',
            'signed int':         'int',
            'int unsigned':       'uint',
            'int signed':         'int',
            'long double':        'double',
            'unsigned':           'uint',
            'signed':             'int',
            'long':               'long',
            'short':              'i16',
        }
        matched = _MULTI_WORD.get(s)
        if matched:
            return matched + '*' * ptr_depth

        # Single-word: check typedef map then return as-is
        IDEKA = _TYPEDEF_MAP.get(s, s)
        return IDEKA + '*' * ptr_depth

    def _translate_param_list_str(self, params_raw):
        """Translate a C parameter list string (comma-separated C declarations)
        to a IDEKA parameter list string.  Used when translating macro-expanded
        function declarations."""
        if not params_raw or params_raw.strip() in ('void', ''):
            return ''
        parts = []
        for param in params_raw.split(','):
            param = param.strip()
            if not param or param == 'void':
                continue
            # Split off the last word as the parameter name (may be absent).
            toks = param.rsplit(None, 1)
            if len(toks) == 2:
                type_str, _name = toks
            else:
                type_str = toks[0]
                _name = ''
            IDEKA_type = self._c_type_str_to_IDEKA(type_str)
            if _name and _is_ident(_name.lstrip('*')) and _name.count('*') == len(_name) - len(_name.lstrip('*')) and _name.count('*') <= 1:
                # Strip leading '*' from name (absorbed into type).
                clean_name = _name.lstrip('*')
                parts.append(f"{IDEKA_type} {clean_name}")
            else:
                parts.append(IDEKA_type)
        return ', '.join(parts)

    def _classify_pp_cond(self, expr):
        """Classify a C #if/#elif condition for the IDEKA preprocessor, which only
        supports SYMBOL, defined(SYMBOL) and !defined(SYMBOL).

        Returns ('ifdef', sym), ('ifndef', sym) or ('review', None).  The literal 0
        and every expression the IDEKA preprocessor cannot express are 'review'.
        """
        e = expr.strip()
        name = _defined_arg(e)
        if name:
            return 'ifdef', name
        if e.startswith('!'):
            name = _defined_arg(e[1:])
            if name:
                return 'ifndef', name
        if _is_ident(e):
            return 'ifdef', e
        return 'review', None

    def _translate_pp_condition(self, expr):
        """Translate a C preprocessor condition expression to a IDEKA symbol name.

        For simple cases like `defined(X)`, `X`, or `!defined(X)` we return the
        symbol.  For complex expressions we return the expression unchanged and
        let the caller wrap it in a comment.
        """
        expr = expr.strip()
        # defined(X) or defined X
        name = _defined_arg(expr)
        if name:
            return name
        # Plain identifier (e.g. #ifdef __WINDOWS__)
        if expr and all(_wc(c) for c in expr):
            return expr
        # !defined(X) -- return the identifier (caller must handle negation)
        if expr.startswith('!'):
            name = _defined_arg(expr[1:])
            if name:
                return name
        # Fallback: return as-is (caller will wrap in comment)
        return expr

    def _cond_is_psub_name(self, name: str) -> bool:
        """Return True if 'name' is used as a function-like macro in the source.

        A name is considered psub-like if the source file contains a line of the
        form '#define NAME(' (no space before the paren), which is the C signature
        for a function-like macro -- these map to IDEKA #psub, not #def.

        We also look for '#if NAME(' usage patterns (e.g. __has_feature calls),
        which implies the name is already expected to be callable.
        """
        src = self._src_bytes.decode('utf-8', errors='replace')
        for line in src.splitlines():
            d = _directive(line)
            if not d or d[0] not in ('define', 'if'):
                continue
            rest = d[1].lstrip()
            # `#define NAME(` or `#if NAME(` (called like a function in a condition)
            if _word_at(rest, 0, name) and rest[len(name):].lstrip().startswith('('):
                return True
        return False

    def _emit_pp_define(self, rest):
        """Emit a IDEKA translation of a #define directive body (everything after
        '#define ').  Handles:
          - Include guards (#define FOO with no body)
          - Object-like macros (#define FOO value)
          - Function-like macros (#define FOO(a, b) body)
        """
        def mname_only_expand(tr, text):
            e0 = _ident_end(text, 0)
            if e0 == 0:
                return False
            start = e0
            if text[e0:e0 + 1] == '(':
                close = text.find(')', e0)
                if close != -1:
                    start = close + 1
            return tr._macro_expand_only(_macro_tokens(text[start:]))
        rest = rest.strip()
        if not rest:
            return

        # Check discard lists before any translation.
        _k0 = 0
        while _k0 < len(rest) and _wc(rest[_k0]):
            _k0 += 1
        macro_name_only = rest[:_k0] if _k0 else None
        if macro_name_only:
            mname = macro_name_only
            if mname in _MACRO_DISCARD_SILENT:
                return
            if mname in _MACRO_DISCARD_STUB:
                self._emit(f"#def {mname} 1;")
                return

        if self._system_file and macro_name_only and rest[_k0:_k0 + 1] == '(':
            self._emit(f"// #define {rest.split('(')[0]}(...): system macro, translated at each use site")
            return
        # Macros with statements or the # / ## operators have no #psub form: each use
        # site is translated from the AST libclang already expanded.
        if macro_name_only and macro_name_only in self._macro_expand_set():
            self._emit(f"// #define {macro_name_only}: translated at each use site")
            return
        if mname_only_expand(self, rest):
            self._emit(f"// #define {macro_name_only}: statements or # / ## operators, translated at each use site")
            return

        # Function-like macro: name immediately followed by '(' (no space)
        _pc = rest.find(')', _k0) if (macro_name_only and rest[_k0:_k0 + 1] == '(') else -1
        if _pc != -1:
            name = macro_name_only
            raw_params = rest[_k0 + 1:_pc]
            body = rest[_pc + 1:].strip()
            params = [p.strip() for p in raw_params.split(',') if p.strip()]

            if not body:
                # Empty function-like macro -- emit as empty #psub
                param_str = ', '.join(params)
                self._emit(f"#psub {name}({param_str})")
                self._emit("")
                return

            # Translate body tokens
            translated = self._translate_pp_macro_body_str(body)

            # Multi-statement body: split on ';' and join with # line-continuation
            if ';' in translated or (translated.startswith('do') and 'while' in translated):
                param_str = ', '.join(params)
                stmts = [s.strip() for s in translated.split(';') if s.strip()]
                if len(stmts) <= 1:
                    self._emit(f"#psub {name}({param_str}) {translated};")
                else:
                    first_stmt = stmts[0]
                    self._emit(f"#psub {name}({param_str}) {first_stmt} #")
                    for stmt in stmts[1:-1]:
                        self._emit(f"    {stmt} #")
                    self._emit(f"    {stmts[-1]};")
                self._emit("")
                return

            # The body is the expression as written: the call site brings its own `;`,
            # and a `;` in the body would break a call used inside an expression.
            param_str = ', '.join(params)
            self._emit(f"#psub {name}({param_str}) {translated}")
            self._emit("")
            return

        # Object-like macro: name [body]
        if not macro_name_only or (_k0 < len(rest) and not rest[_k0].isspace()):
            self._emit(f"// #define {rest}  // untranslated")
            return

        name = macro_name_only
        body = rest[_k0:].strip()
        # a comment after the value is no part of it (`21 /* For debugging; unspecified */`)
        tail = ''
        code_end = _code_end(body)
        if 0 < code_end < len(body):
            tail = ' // ' + body[code_end:].strip().lstrip('/*').rstrip('*/').strip().lstrip('/').strip()
            body = body[:code_end].strip()
        elif code_end == 0 and body:
            body = ''

        if not body:
            # Guard-style #define with no value -- emit as #def NAME 1
            self._emit(f"#def {name} 1;")
            return

        # Try integer literal
        val = _c_int_value(body)
        if val is not None:
            self._emit(f"#def {name} {val};{tail}")
            return

        # Try float literal
        try:
            float(body.rstrip('fF'))
            self._emit(f"double {name} = {_num_suffixes(body)};")
            return
        except ValueError:
            pass

        # String literal
        if body.startswith('"'):
            if not _is_plain_string(body):
                body = self._expand_string_macro(name) or body
            self._emit(f"byte* {name} = {body};")
            return

        # Multi-statement object-like macro
        if ';' in body:
            self._emit(f"// macro (multi-statement, manual translation needed): {name} {body}")
            return

        # Expression object-like macro -- emit as parameterless macro
        # (IDEKA `macro` requires a parameter list, so an object-like macro is a #def)
        translated = self._translate_pp_macro_body_str(body)
        self._emit(f"#def {name} {translated};")
        self._emit("")

    @staticmethod
    def _anon_chain(owner):
        """The member names that lead from the named record down to `owner`, one for each
        unnamed struct or union on the way, outermost first."""
        steps = []
        while owner is not None and owner.kind in (CursorKind.UNION_DECL, CursorKind.STRUCT_DECL):
            loc = _anon_loc(owner.spelling)
            if not loc:
                break
            parent = owner.semantic_parent
            if parent is None or parent.kind not in (CursorKind.UNION_DECL, CursorKind.STRUCT_DECL):
                break               # an unnamed record that is a type of its own, not a member
            named = False
            if parent is not None:
                for fld in parent.get_children():
                    if (fld.kind == CursorKind.FIELD_DECL
                            and fld.type.get_canonical().get_declaration() == owner):
                        named = bool(fld.spelling)    # `struct {..} name;` is a typed member
                        break
            if named:
                break
            steps.append(f"_am_{loc[0]}_{loc[1]}")
            owner = parent
        steps.reverse()
        return steps

    @staticmethod
    def _anon_step_of(cursor):
        """The unnamed-member name a base expression ends with, else None."""
        c = cursor
        while c.kind in (CursorKind.UNEXPOSED_EXPR, CursorKind.PAREN_EXPR):
            kids = list(c.get_children())
            if len(kids) != 1:
                return None
            c = kids[0]
        if c.kind == CursorKind.MEMBER_REF_EXPR:
            loc = _anon_loc(c.spelling)
            if loc:
                return f"_am_{loc[0]}_{loc[1]}"
        return None

    def _enum_owners(self):
        """Enumerator name -> the name of the named enum that holds it."""
        owners = getattr(self, '_enum_owner_cache', None)
        if owners is None:
            owners = {}
            for c in self.tu.cursor.get_children():
                if c.kind != CursorKind.ENUM_DECL:
                    continue
                ename = c.spelling or self._pending_typedefs.get(c.hash)
                if not ename or '(unnamed' in ename or '(anonymous' in ename:
                    continue
                for e in c.get_children():
                    if e.kind == CursorKind.ENUM_CONSTANT_DECL:
                        owners[e.spelling] = ename
            self._enum_owner_cache = owners
        return owners

    def _translate_pp_macro_body_str(self, body):
        """Translate a macro body string (already joined, no backslash continuations)
        to IDEKA syntax. Character-by-character scan, no regex."""
        out = []
        i = 0
        n = len(body)

        def is_ident(c):
            return c.isalnum() or c == '_'

        while i < n:
            # /* ... */ comment -> /// inner ///
            if body[i] == '/' and i + 1 < n and body[i+1] == '*':
                end = body.find('*/', i + 2)
                if end == -1:
                    out.append('/// ' + body[i+2:].strip() + ' ///')
                    break
                inner = body[i+2:end].strip()
                out.append('/// ' + inner + ' ///')
                i = end + 2
                continue

            # ## token-paste: word##word -> word{word}
            if body[i] == '#' and i + 1 < n and body[i+1] == '#':
                # Replace the ## and next identifier with {ident}
                i += 2
                j = i
                while j < n and is_ident(body[j]):
                    j += 1
                out.append('{' + body[i:j] + '}')
                i = j
                continue

            # -> member access
            if body[i] == '-' and i + 1 < n and body[i+1] == '>':
                out.append('.')
                i += 2
                continue

            # 0x hex literal: uppercase the digits
            if body[i] == '0' and i + 1 < n and body[i+1] in ('x', 'X'):
                j = i + 2
                while j < n and body[j] in '0123456789abcdefABCDEF':
                    j += 1
                out.append('0x' + body[i+2:j].upper())
                i = j
                continue

            # C-style cast of primitive type: (type) or (type*)
            # Handles: (long), (short), (char), (int), (void),
            #          (unsigned X), (signed X) and pointer variants
            if body[i] == '(':
                # Try to parse a cast -- look ahead for ')' with only type tokens inside
                j = i + 1
                # Skip whitespace
                while j < n and body[j] == ' ':
                    j += 1
                # Collect the potential type string up to the matching ')'
                depth = 1
                k = j
                while k < n and depth > 0:
                    if body[k] == '(':
                        depth += 1
                    elif body[k] == ')':
                        depth -= 1
                    k += 1
                # k is now past the ')'
                type_str = body[j:k-1].strip()
                # Check if type_str is a pure C primitive type (possibly with *)
                ptr_suffix = ''
                ts = type_str
                while ts.endswith('*'):
                    ptr_suffix += '*'
                    ts = ts[:-1].strip()
                _CAST_MAP = {
                    'void': 'void', 'char': 'char', 'signed char': 'i8',
                    'unsigned char': 'byte', 'short': 'i16',
                    'unsigned short': 'u16', 'signed short': 'i16',
                    'int': 'int', 'unsigned int': 'uint', 'unsigned': 'uint',
                    'signed': 'int', 'long': 'long', 'unsigned long': 'ulong',
                    'signed long': 'long', 'long long': 'long',
                    'unsigned long long': 'ulong', 'float': 'float',
                    'double': 'double',
                }
                if ts in _CAST_MAP:
                    out.append('(' + _CAST_MAP[ts] + ptr_suffix + ')')
                    i = k
                    continue
                # Not a recognizable cast -- emit as-is
                out.append('(')
                i += 1
                continue

            # Bitwise NOT: ~ only when not preceded by an identifier char
            if body[i] == '~':
                prev = out[-1][-1] if out and out[-1] else ''
                if not is_ident(prev):
                    out.append('`!')
                else:
                    out.append('~')
                i += 1
                continue

            # Address-of: & after (, ,, =, or whitespace and before identifier
            if body[i] == '&':
                if i + 1 < n and body[i+1] == '&':      # logical and
                    out.append('&')
                    i += 2
                    continue
                if i + 1 < n and body[i+1] == '=':      # &=
                    out.append('`&=')
                    i += 2
                    continue
                prev_sig = ''.join(out).rstrip()[-1:]
                if prev_sig in ('', '(', ',', '=', '&', '|', '!', '<', '>', '+', '-', '*', '/', '?', ':', '%'):
                    # unary: the address of what follows
                    j = i + 1
                    while j < n and body[j] == ' ':
                        j += 1
                    if j < n and (is_ident(body[j]) or body[j] in '(*'):
                        out.append('@')
                        i += 1
                        continue
                out.append('`&')                         # bitwise and
                i += 1
                continue

            # | and ^: logical or is |, bitwise or is `|, bitwise xor is `^|
            if body[i] == '|':
                if i + 1 < n and body[i+1] == '|':
                    out.append('|')
                    i += 2
                elif i + 1 < n and body[i+1] == '=':
                    out.append('`|=')
                    i += 2
                else:
                    out.append('`|')
                    i += 1
                continue
            if body[i] == '^':
                if i + 1 < n and body[i+1] == '=':
                    out.append('`^|=')
                    i += 2
                else:
                    out.append('`^|')
                    i += 1
                continue

            # string and character literals pass through untouched
            if body[i] in '"\'':
                q = body[i]
                j = i + 1
                while j < n and body[j] != q:
                    j += 2 if body[j] == '\\' else 1
                out.append(body[i:j+1])
                i = j + 1
                continue

            # Identifier: collect and check for ## following
            if is_ident(body[i]):
                j = i
                while j < n and is_ident(body[j]):
                    j += 1
                word = body[i:j]
                # the members of a named enum are reached through the enum
                prev_sig = ''.join(out).rstrip()[-1:]
                owner = self._enum_owners().get(word)
                if owner and prev_sig != '.':
                    word = f"{owner}.{word}"
                out.append(word)
                i = j
                continue

            out.append(body[i])
            i += 1

        return _num_suffixes(''.join(out).strip())

    # -----------------------------------------------------------------------
    # Top-level dispatcher
    # -----------------------------------------------------------------------

    def _visit_top(self, cursor):
        if self._cplusplus_depth > 0:
            return
        kind = cursor.kind
        self._decl_start = len(self.lines)

        if kind == CursorKind.STRUCT_DECL:
            self._emit_struct(cursor)
        elif kind == CursorKind.UNION_DECL:
            self._emit_union(cursor)
        elif kind == CursorKind.ENUM_DECL:
            self._emit_enum(cursor)
        elif kind == CursorKind.TYPEDEF_DECL:
            self._emit_typedef(cursor)
        elif kind == CursorKind.FUNCTION_DECL:
            self._emit_function(cursor)
        elif kind == CursorKind.VAR_DECL:
            self._emit_global_var(cursor)
        elif kind == CursorKind.MACRO_DEFINITION:
            self._emit_macro(cursor)

    # -----------------------------------------------------------------------
    # Anonymous struct/union helper
    # -----------------------------------------------------------------------

    def _emit_anon_record(self, field):
        """Emit an anonymous struct or union field as a named declaration.
        Synthesizes a name (_anon_N), emits the declaration immediately, and
        returns the synthesized name to use as the field type."""
        return self._emit_anon_decl(field.type.get_canonical().get_declaration())

    def _emit_anon_decl(self, decl):
        """Emit an unnamed struct or union under a name made from where it is declared,
        so the same record gets the same name in every file that sees it."""
        stem = "x"
        if decl.location.file:
            stem = "".join(c if _wc(c) else "_"
                           for c in os.path.splitext(os.path.basename(decl.location.file.name))[0])
        synth_name = f"_anon_{stem}_{decl.location.line}_{decl.location.column}"
        # Patch the declaration into _pending_typedefs so _struct_name finds it
        self._pending_typedefs[decl.hash] = synth_name
        if decl.kind == CursorKind.UNION_DECL:
            self._emit_union(decl)
        else:
            self._emit_struct(decl)
        return synth_name

    def _pre_members(self, fields):
        """Before a struct or union header is written: emit every unnamed record the
        members use, and name the C11 anonymous members (`union { ... };` with no
        declarator). Returns {decl hash: (type name, member name)} for those."""
        owned = set()
        for f in fields:
            if f.kind == CursorKind.FIELD_DECL and f.type.get_canonical().kind == TypeKind.RECORD:
                owned.add(f.type.get_canonical().get_declaration().hash)
        members = {}
        for f in fields:
            # a named struct or union written inside this one has file scope in C
            if (f.kind in (CursorKind.STRUCT_DECL, CursorKind.UNION_DECL)
                    and not self._is_anon_decl(f) and f.is_definition()):
                if f.kind == CursorKind.STRUCT_DECL:
                    self._emit_struct(f)
                else:
                    self._emit_union(f)
        for f in fields:
            # a record that is only named behind a pointer or array (`struct X *p[13]`)
            # and never defined: IDEKA needs it declared before the member uses it
            if f.kind == CursorKind.FIELD_DECL:
                t = f.type.get_canonical()
                while t.kind in (TypeKind.POINTER, TypeKind.CONSTANTARRAY,
                                 TypeKind.INCOMPLETEARRAY):
                    t = (t.get_pointee() if t.kind == TypeKind.POINTER
                         else t.element_type).get_canonical()
                if t.kind == TypeKind.RECORD:
                    d = t.get_declaration()
                    nm = self._struct_name(d)
                    if (nm and not self._is_anon_decl(d) and nm not in self._emitted_types
                            and d.get_definition() is None):
                        self._emit(f"cstruct {nm};")
                        self._emitted_types.add(nm)
        for f in fields:
            if f.kind == CursorKind.FIELD_DECL and f.type.get_canonical().kind == TypeKind.RECORD:
                d = f.type.get_canonical().get_declaration()
                if self._is_anon_decl(d) and not self._pending_typedefs.get(d.hash):
                    self._emit_anon_decl(d)
            elif (f.kind in (CursorKind.STRUCT_DECL, CursorKind.UNION_DECL)
                  and self._is_anon_decl(f) and f.hash not in owned):
                tname = self._pending_typedefs.get(f.hash) or self._emit_anon_decl(f)
                members[f.hash] = (tname, f"_am_{f.location.line}_{f.location.column}")
        return members

    # -----------------------------------------------------------------------
    # Struct
    # -----------------------------------------------------------------------

    def _emit_struct(self, cursor):
        name = self._struct_name(cursor)
        if not name or name in self._emitted_types:
            return
        fields = list(cursor.get_children())
        if not fields:
            # a declaration only: the definition may still follow, so the name is
            # not yet taken
            if name not in self._declared_types:
                self._emit(f"cstruct {name};")
                self._declared_types.add(name)
            return
        self._emitted_types.add(name)
        anon_members = self._pre_members(fields)
        # cstruct fields are whole bytes; a struct with bit fields is a bit-packed
        # struct, padded where C fills out the declared type's unit
        has_bits = any(f.kind == CursorKind.FIELD_DECL and f.is_bitfield() for f in fields)
        self._emit(f"{'struct' if has_bits else 'cstruct'} {name}")
        self._emit("{")
        run = [0, 0, 0]   # bits in the current bit-field run, its unit size, pad counter
        def _flush_bits(pad="    "):
            if run[0] and run[1] and run[0] % run[1]:
                run[2] += 1
                self._emit(f"{pad}data{{{run[1] - run[0] % run[1]}}} _bitpad{run[2]};")
            run[0] = 0
        def _field_comment(field):
            for tok in self.tu.get_tokens(extent=field.extent):
                if tok.kind == cx.TokenKind.COMMENT:
                    t = tok.spelling
                    if t.startswith("/**<") or t.startswith("/*!<"):
                        inner = t[4:-2].strip() if t.endswith("*/") else t[4:].strip()
                        return " // " + " ".join(inner.split())
                    elif t.startswith("/*"):
                        inner = t[2:-2].strip() if t.endswith("*/") else t[2:].strip()
                        return " // " + " ".join(inner.split())
                    elif t.startswith("//"):
                        return " " + t.strip()
            return ""

        for field in fields:
            if not (field.kind == CursorKind.FIELD_DECL and field.is_bitfield()):
                _flush_bits()
            if field.hash in anon_members:
                tname, mname = anon_members[field.hash]
                self._emit(f"    {tname} {mname};")
            elif field.kind == CursorKind.FIELD_DECL:
                if field.is_bitfield():
                    run[0] += field.get_bitfield_width()
                    run[1] = field.type.get_size() * 8
                fc = _field_comment(field)
                # Resolve anonymous nested struct/union: emit it first, get synthesized name
                canon_kind = field.type.get_canonical().kind
                if canon_kind == TypeKind.RECORD:
                    fdecl = field.type.get_canonical().get_declaration()
                    if self._is_anon_decl(fdecl) and not self._pending_typedefs.get(fdecl.hash):
                        ftype = self._emit_anon_record(field)
                    else:
                        ftype = self._IDEKA_type(field.type, field.spelling)
                else:
                    ftype = self._IDEKA_type(field.type, field.spelling)
                # Bitfield
                if field.is_bitfield():
                    width = field.get_bitfield_width()
                    # Emit as data{N} -- signed/unsigned inferred from underlying type
                    canon = field.type.get_canonical()
                    signed = canon.kind in (TypeKind.CHAR_S, TypeKind.SCHAR, TypeKind.SHORT,
                                            TypeKind.INT, TypeKind.LONG, TypeKind.LONGLONG)
                    prefix = "signed " if signed else ""
                    if width == 0:
                        _flush_bits()      # `int :0;` only ends the current unit
                        continue
                    fname = _rename(field.spelling) if field.spelling else None
                    if not fname:
                        run[2] += 1
                        fname = f"_unnamed_bits{run[2]}"
                    self._emit(f"    {prefix}data{{{width}}} {fname};{fc}")
                else:
                    # Check for _Alignas attribute
                    align_val = self._get_field_align(field)
                    if align_val is not None:
                        bits = field.type.get_size() * 8
                        canon = field.type.get_canonical()
                        signed = canon.kind in (TypeKind.CHAR_S, TypeKind.SCHAR, TypeKind.SHORT,
                                                TypeKind.INT, TypeKind.LONG, TypeKind.LONGLONG)
                        sign = "signed " if signed else ""
                        self._emit(f"    {sign}data{{{bits}}} {_rename(field.spelling)}; // _Alignas({align_val}){fc}")
                    else:
                        self._emit(f"    {_with_name(ftype, _rename(field.spelling))};{fc}")
        _flush_bits()
        self._emit("};")
        self._emit("")

    # -----------------------------------------------------------------------
    # Union
    # -----------------------------------------------------------------------

    def _emit_union(self, cursor):
        name = self._struct_name(cursor)
        if not name or name in self._emitted_types:
            return
        fields = list(cursor.get_children())
        if not fields:
            return
        self._emitted_types.add(name)
        anon_members = self._pre_members(fields)
        self._emit(f"union {name}")
        self._emit("{")
        for field in fields:
            if field.hash in anon_members:
                tname, mname = anon_members[field.hash]
                self._emit(f"    {tname} {mname};")
            elif field.kind == CursorKind.FIELD_DECL:
                if field.is_bitfield():
                    width = field.get_bitfield_width()
                    canon = field.type.get_canonical()
                    signed = canon.kind in (TypeKind.CHAR_S, TypeKind.SCHAR, TypeKind.SHORT,
                                            TypeKind.INT, TypeKind.LONG, TypeKind.LONGLONG)
                    prefix = "signed " if signed else ""
                    if width == 0:
                        continue
                    self._anon_counter += 1
                    uname = _rename(field.spelling) if field.spelling else f"_unnamed_bits{self._anon_counter}"
                    self._emit(f"    {prefix}data{{{width}}} {uname};")
                else:
                    # Resolve anonymous nested struct before calling _IDEKA_type
                    canon_kind = field.type.get_canonical().kind
                    if canon_kind == TypeKind.RECORD:
                        fdecl = field.type.get_canonical().get_declaration()
                        if self._is_anon_decl(fdecl) and not self._pending_typedefs.get(fdecl.hash):
                            ftype = self._emit_anon_record(field)
                        else:
                            ftype = self._IDEKA_type(field.type, field.spelling)
                    else:
                        ftype = self._IDEKA_type(field.type, field.spelling)
                    self._emit(f"    {_with_name(ftype, _rename(field.spelling))};")
        self._emit("};")
        self._emit("")

    # -----------------------------------------------------------------------
    # Enum
    # -----------------------------------------------------------------------

    def _file_macro_names(self):
        names = getattr(self, '_fmn', None)
        if names is None:
            names = {c.spelling for c in self.tu.cursor.get_children()
                     if c.kind == CursorKind.MACRO_DEFINITION and self._is_from_main_file(c)}
            self._fmn = names
        return names

    def _emit_enum(self, cursor):
        name = cursor.spelling or self._pending_typedefs.get(cursor.hash)
        enumerators = [c for c in cursor.get_children() if c.kind == CursorKind.ENUM_CONSTANT_DECL]
        if not enumerators:
            return

        # Anonymous enum used purely as integer constants -- emit each as a scalar
        if not name or '(unnamed' in name:
            for e in enumerators:
                val = e.enum_value
                if val < 0:
                    ftype = "long" if val < -(2**31) else "int"
                else:
                    ftype = "ulong" if val > 0xFFFFFFFF else "uint"
                comment = ""
                for tok in self.tu.get_tokens(extent=e.extent):
                    if tok.kind == cx.TokenKind.COMMENT:
                        t = tok.spelling
                        if t.startswith("/**<") or t.startswith("/*!<"):
                            inner = t[4:-2].strip() if t.endswith("*/") else t[4:].strip()
                            comment = " // " + inner
                        elif t.startswith("/*"):
                            inner = t[2:-2].strip() if t.endswith("*/") else t[2:].strip()
                            comment = " // " + inner
                        elif t.startswith("//"):
                            comment = " " + t.strip()
                        break
                if e.spelling in self._defd or (e.spelling in self._file_macro_names()
                                                and e.spelling not in self._macro_expand_set()):
                    # a macro of the same name already stands for this value (an expanded
                    # macro writes nothing out, `#define X X` leaves the enumerator to it)
                    continue
                # a constant of the program, so a #def: variables are no constant
                # expression for an array size, an initializer or a case label
                self._emit(f"#def {e.spelling} {val if val >= 0 else '(' + str(val) + ')'};{comment}")
            self._emit("")
            return

        if name in self._emitted_types:
            return
        self._emitted_types.add(name)

        sequential = all(e.enum_value == i for i, e in enumerate(enumerators))

        def _trailing_comment(enumerator):
            """Return the first trailing comment token in this enumerator's
            extent, converted to a IDEKA line comment, or '' if none."""
            for tok in self.tu.get_tokens(extent=enumerator.extent):
                if tok.kind != cx.TokenKind.COMMENT:
                    continue
                text = tok.spelling
                # /**< ... */ style -- strip the markers and return inline
                if text.startswith("/**<") or text.startswith("/*!<"):
                    inner = text[4:]
                    if inner.endswith("*/"):
                        inner = inner[:-2]
                    return " // " + inner.strip()
                # /** ... */ style
                if text.startswith("/*"):
                    inner = text[2:]
                    if inner.endswith("*/"):
                        inner = inner[:-2]
                    return " // " + inner.strip()
                if text.startswith("//"):
                    return " " + text.strip()
            return ""

        self._emit(f"enum {name}")
        self._emit("{")
        parts = []
        for e in enumerators:
            comment = _trailing_comment(e)
            if sequential:
                parts.append(f"    {e.spelling}{comment}")
            else:
                parts.append(f"    {e.spelling} = {e.enum_value}{comment}")
        self._emit(",\n".join(parts))
        self._emit("};")
        self._emit("")

    # -----------------------------------------------------------------------
    # Typedef
    # -----------------------------------------------------------------------

    def _emit_typedef(self, cursor):
        typedef_name = cursor.spelling
        underlying = cursor.underlying_typedef_type
        canon = underlying.get_canonical()

        if canon.kind in (TypeKind.RECORD, TypeKind.ELABORATED):
            decl = canon.get_declaration()
            if decl and decl.spelling == typedef_name:
                return
            if decl and decl.kind == CursorKind.STRUCT_DECL:
                self._emit_struct(decl)
            elif decl and decl.kind == CursorKind.ENUM_DECL:
                self._emit_enum(decl)
            elif decl and decl.kind == CursorKind.UNION_DECL:
                self._emit_union(decl)
            if decl and decl.spelling and decl.spelling != typedef_name:
                self._emit(f"// typedef alias: {typedef_name} -> {decl.spelling}")
                self._emit("")
            return

        IDEKA = _TYPEDEF_MAP.get(typedef_name)
        if IDEKA:
            return

        # Function pointer typedef -> emit as named cdecl{}* declaration
        if canon.kind in (TypeKind.FUNCTIONPROTO, TypeKind.FUNCTIONNOPROTO):
            ret_str = self._IDEKA_type(canon.get_result(), "")
            params = []
            for arg_type in canon.argument_types():
                params.append(self._IDEKA_type(arg_type, ""))
            if canon.kind == TypeKind.FUNCTIONPROTO and canon.is_function_variadic():
                params.append("...")
            self._emit(f"cdecl{{}}* {typedef_name}({', '.join(params)}) -> {ret_str};")
            self._emit("")
            return

        # Function pointer typedef via pointer-to-proto, or pointer-to-record alias
        if canon.kind == TypeKind.POINTER:
            pointee = canon.get_pointee()
            # Pointer to struct/interface -- emit as `PointeeName* as TypedefName;`
            if pointee.kind in (TypeKind.RECORD, TypeKind.ELABORATED):
                decl = pointee.get_declaration()
                pointee_name = decl.spelling if decl and decl.spelling else pointee.spelling
                if pointee_name and pointee_name != typedef_name:
                    self._emit(f"{pointee_name}* as {typedef_name};")
                    self._emit("")
                    return
            if pointee.kind in (TypeKind.FUNCTIONPROTO, TypeKind.FUNCTIONNOPROTO):
                ret_str = self._IDEKA_type(pointee.get_result(), "")
                # Collect param names from cursor children (PARM_DECL)
                parm_names = [_rename(c.spelling) for c in cursor.get_children()
                              if c.kind == CursorKind.PARM_DECL]
                params = []
                arg_types = pointee.argument_types() if pointee.kind == TypeKind.FUNCTIONPROTO else []
                for i, arg_type in enumerate(arg_types):
                    ptype = self._param_type(arg_type, "")
                    pname = parm_names[i] if i < len(parm_names) else ""
                    params.append(_with_name(ptype, pname))
                if pointee.kind == TypeKind.FUNCTIONPROTO and pointee.is_function_variadic():
                    params.append("...")
                self._emit(f"cdecl{{}}* {typedef_name}({', '.join(params)}) -> {ret_str};")
                self._emit("")
                return

        inner = self._IDEKA_type(underlying, typedef_name)
        self._emit(f"// typedef: {typedef_name} = {inner}")

    # -----------------------------------------------------------------------
    # Function (prototype or full definition)
    # -----------------------------------------------------------------------

    def _emit_function(self, cursor):
        name = cursor.spelling
        if not name:
            return

        # Check if this cursor has a body
        body = None
        for child in cursor.get_children():
            if child.kind == CursorKind.COMPOUND_STMT:
                body = child
                break

        # Skip if already emitted as a full definition
        if name in self._emitted_types:
            return
        # Skip prototype if a prototype was already emitted and this is also a prototype
        if body is None and name in self._emitted_prototypes:
            return

        if body is not None:
            # IDEKA has no enum inside a function body: a local enum is declared ahead of the function
            for node in body.walk_preorder():
                if node.kind == CursorKind.ENUM_DECL and node.is_definition():
                    self._emit_enum(node)
                # the same for an unnamed struct or union written in a local declaration
                # (`struct { int a, b; } *p;`): it becomes a named record ahead of the function
                elif (node.kind in (CursorKind.STRUCT_DECL, CursorKind.UNION_DECL)
                        and node.is_definition() and self._is_anon_decl(node)
                        and not self._pending_typedefs.get(node.hash)
                        and node.semantic_parent is not None
                        and node.semantic_parent.kind not in (CursorKind.STRUCT_DECL,
                                                              CursorKind.UNION_DECL)):
                    self._emit_anon_decl(node)

        ft = cursor.type
        ret = ft.get_result()
        noreturn = cursor.is_noreturn_function() if hasattr(cursor, "is_noreturn_function") else False
        ret_str = "void" if noreturn else self._IDEKA_type(ret, "")

        params = []
        for arg in cursor.get_arguments():
            ptype = self._param_type(arg.type, arg.spelling)
            # the program entry point receives `byte** argv`, the form the entry stub looks for
            if cursor.spelling == "main" and len(params) == 1 and ptype.replace(" ", "") == "char**":
                ptype = "byte**"
            pname = _rename(arg.spelling) if arg.spelling else ""
            params.append(_with_name(ptype, pname))

        if ft.kind == TypeKind.FUNCTIONPROTO and ft.is_function_variadic():
            params.append("...")

        param_str = ", ".join(params)
        noreturn_comment = " // noreturn" if noreturn else ""

        # the program entry point is an Ideka `def main`; everything else keeps C's convention
        conv = "def" if name == "main" else "cdecl"
        if body is None:
            self._emit(f"{conv} {name}({param_str}) -> {ret_str};{noreturn_comment}")
            self._emitted_prototypes.add(name)
        else:
            self._emitted_types.add(name)
            self._emit(f"{conv} {name}({param_str}) -> {ret_str}{noreturn_comment}")
            self._union_last = {}
            self._gt_analyze(body)
            self._emit_compound(body)
            self._gt_reset()
            self._emit("")

    # -----------------------------------------------------------------------
    # Global variable
    # -----------------------------------------------------------------------

    @staticmethod
    def _parens_wrap_all(text):
        """True when the opening ( at index 0 closes at the last character."""
        depth = 0
        for i, ch in enumerate(text):
            if ch == "(":
                depth += 1
            elif ch == ")":
                depth -= 1
                if depth == 0:
                    return i == len(text) - 1
        return False

    def _only_if_after_eq(self, decl, child):
        """Return child only when it is the initializer, i.e. it starts after the
        declarator's top level '='. Array size expressions such as
        `char buf[SIZE + 1];` are also children of the VAR_DECL and must not be taken
        as initializers."""
        depth = 0
        for t in decl.get_tokens():
            sp = t.spelling
            if sp in ('[', '(', '{'):
                depth += 1
            elif sp in (']', ')', '}'):
                depth -= 1
            elif sp == '=' and depth == 0:
                return child if child.extent.start.offset >= t.extent.end.offset else None
        return None

    def _emit_global_var(self, cursor):
        name = cursor.spelling
        if not name:
            return
        # `static struct { ... } tbl[] = {...};` writes the record inside the declaration:
        # it becomes a named record ahead of the variable
        base_t = cursor.type.get_canonical()
        while base_t.kind in (TypeKind.CONSTANTARRAY, TypeKind.INCOMPLETEARRAY, TypeKind.POINTER):
            base_t = (base_t.get_pointee() if base_t.kind == TypeKind.POINTER
                      else base_t.element_type).get_canonical()
        if base_t.kind == TypeKind.RECORD:
            rdecl = base_t.get_declaration()
            if (rdecl is not None and rdecl.is_definition() and self._is_anon_decl(rdecl)
                    and not self._pending_typedefs.get(rdecl.hash)):
                self._emit_anon_decl(rdecl)
        ftype = self._IDEKA_type(cursor.type, name)
        # Find actual initializer -- skip TYPE_REF, TEMPLATE_REF, array
        # size INTEGER_LITERAL children, and attribute nodes.
        _ATTR_KINDS = {
            CursorKind.ANNOTATE_ATTR, CursorKind.ASM_LABEL_ATTR,
            CursorKind.PACKED_ATTR, CursorKind.PURE_ATTR,
            CursorKind.CONST_ATTR, CursorKind.NODUPLICATE_ATTR,
            CursorKind.VISIBILITY_ATTR, CursorKind.DLLIMPORT_ATTR,
            CursorKind.DLLEXPORT_ATTR,
        }
        init = None
        for child in cursor.get_children():
            if child.kind in (CursorKind.TYPE_REF, CursorKind.TEMPLATE_REF):
                continue
            if child.kind in (CursorKind.STRUCT_DECL, CursorKind.UNION_DECL, CursorKind.ENUM_DECL):
                continue                   # the record written inside the declaration
            if child.kind in _ATTR_KINDS:
                continue
            if child.kind == CursorKind.PARM_DECL:
                continue                   # a parameter of a function pointer's type
            if (cursor.type.get_canonical().kind == TypeKind.CONSTANTARRAY
                    and child.kind == CursorKind.INTEGER_LITERAL):
                continue
            init = self._only_if_after_eq(cursor, child)
            break

        # static const char name[] = "..." -> g-string global constant
        canon = cursor.type.get_canonical()
        is_const_char_array = (
            canon.kind == TypeKind.CONSTANTARRAY
            and canon.element_type.get_canonical().kind in (TypeKind.CHAR_S, TypeKind.CHAR_U,
                                                             TypeKind.SCHAR, TypeKind.UCHAR)
            and cursor.storage_class == cx.StorageClass.STATIC
        )
        if is_const_char_array and init and init.kind == CursorKind.STRING_LITERAL:
            str_val = self._string_literal_text(init)
            # Strip surrounding quotes and re-emit as g-string
            inner = str_val[1:-1] if str_val.startswith('"') else str_val
            self._emit(f'char* {name} = g"{inner}";')
            return

        # a global function pointer keeps the signature of what it points to
        fpt = cursor.type.get_canonical()
        if fpt.kind == TypeKind.POINTER and fpt.get_pointee().get_canonical().kind in (
                TypeKind.FUNCTIONPROTO, TypeKind.FUNCTIONNOPROTO):
            sig = self._fp_signature(fpt.get_pointee().get_canonical())
            decl_txt = f"cdecl{{}}* {name}{sig}"
            if init:
                self._emit(f"{decl_txt} = {self._emit_expr(init)};")
            elif cursor.storage_class == cx.StorageClass.EXTERN:
                self._emit("extern")
                self._emit("{")
                self._emit(f"    {decl_txt};")
                self._emit("};")
            else:
                self._emit(f"{decl_txt};")
            return
        if init:
            val = self._emit_expr(init)
            self._emit(f"{_with_name(ftype, name)} = {val};")
        elif cursor.storage_class == cx.StorageClass.EXTERN:
            # C's `extern T x;` declares a variable defined in another file
            self._emit("extern")
            self._emit("{")
            self._emit(f"    {_with_name(ftype, name)};")
            self._emit("};")
        else:
            # No initializer: C zero-initializes globals (BSS); IDEKA also zero-initializes by default
            self._emit(f"{_with_name(ftype, name)};")

    _last_args = None

    def _expand_string_macro(self, name):
        """Value of an object-like macro whose body builds a string out of other macros
        (a literal followed by PATHSEP, ALSO_TRIPLET(...)): let clang expand it. Returns
        the quoted literal, or None."""
        main = self.tu.spelling
        scratch = main + ".cit_exp.c"
        src = f'#include "{main}"\nconst char* _cit_x = {name};\n'
        try:
            tu = self._index.parse(scratch, args=CTranslator._last_args or CFT_CONFIG.default_clang_args,
                                   unsaved_files=[(scratch, src)])
        except Exception:
            return None
        for c in tu.cursor.get_children():
            if c.kind == CursorKind.VAR_DECL and c.spelling == "_cit_x":
                for ch in c.get_children():
                    lit = self._strip_wrappers(ch)
                    if lit.kind == CursorKind.STRING_LITERAL and lit.spelling.startswith('"'):
                        return lit.spelling
        return None

    def _string_literal_text(self, cursor):
        """Source text of a string literal. Adjacent literals and literals produced by
        macros (PATHSEP, ALSO_TRIPLET(...)) are not one token, so use the concatenated
        value libclang reports."""
        toks = [t for t in cursor.get_tokens() if t.kind != cx.TokenKind.COMMENT]
        if len(toks) == 1 and toks[0].kind == cx.TokenKind.LITERAL:
            return toks[0].spelling
        sp = cursor.spelling
        if sp.startswith('"') and sp.endswith('"') and len(sp) >= 2:
            return sp
        return toks[0].spelling if toks else '""'

    def _emit_codegen_macro(self, name, params, body_toks):
        """Translate a ##-pasting code-generating macro into a comptime/emitideka block.
        Returns True if successfully translated, False if the pattern is unrecognized."""

        def tok_to_IDEKA(t, next_t=None):
            """Convert a single token, handling ## paste and & address-of."""
            if t.spelling == '##':
                return None  # handled by caller
            if t.spelling == '&':
                return '@'
            return t.spelling

        # Reconstruct token list replacing prefix##param with {param} interpolation
        def rebuild_toks(toks):
            result = []
            i = 0
            while i < len(toks):
                tok = toks[i]
                s = tok.spelling
                if tok.kind == cx.TokenKind.COMMENT:
                    converted = s.replace('/*', '///').replace('*/', '///')
                    result.append(converted)
                    i += 1
                    continue
                if i + 2 < len(toks) and toks[i+1].spelling == '##':
                    # prefix##param or ##param (prefix may be empty string token)
                    param = toks[i+2].spelling
                    result.append(f"{s}{{{param}}}")
                    i += 3
                elif s == '##' and i + 1 < len(toks):
                    # standalone ## param (no prefix)
                    param = toks[i+1].spelling
                    result.append(f"{{{param}}}")
                    i += 2
                elif s == '&':
                    result.append('@')
                    i += 1
                else:
                    result.append(s)
                    i += 1
            return result

        # Split body tokens into function definitions at top-level { } boundaries
        # Each function is: [qualifiers] ret_type name ( params ) { body }
        functions = []
        i = 0
        toks = body_toks
        while i < len(toks):
            # Skip comments and qualifiers like ATTRIBUTE_PURE, static
            # Find: ret_type name ( param_list ) { body }
            # Look for '(' to identify start of param list
            fn_start = i
            # Scan forward to find '{'
            brace_start = None
            j = i
            while j < len(toks):
                if toks[j].spelling == '{':
                    brace_start = j
                    break
                j += 1
            if brace_start is None:
                break
            # Find matching '}'
            depth = 0
            brace_end = None
            for k in range(brace_start, len(toks)):
                if toks[k].spelling == '{':
                    depth += 1
                elif toks[k].spelling == '}':
                    depth -= 1
                    if depth == 0:
                        brace_end = k
                        break
            if brace_end is None:
                break

            signature_toks = toks[fn_start:brace_start]
            body_inner_toks = toks[brace_start+1:brace_end]
            functions.append((signature_toks, body_inner_toks))
            i = brace_end + 1

        if not functions:
            return False

        # Build emitideka string lines
        lines = []
        for sig_toks, body_inner_toks in functions:
            sig_parts = rebuild_toks(sig_toks)
            body_parts = rebuild_toks(body_inner_toks)

            # Parse signature: find '(' and ')' to split ret+name from params
            sig_str = " ".join(sig_parts)
            # Find the param '(' -- last one before end of sig
            paren_depth = 0
            paren_start = None
            paren_end = None
            for idx, ch in enumerate(sig_str):
                if ch == '(':
                    if paren_depth == 0:
                        paren_start = idx
                    paren_depth += 1
                elif ch == ')':
                    paren_depth -= 1
                    if paren_depth == 0:
                        paren_end = idx
                        break
            if paren_start is None:
                continue

            ret_and_name = sig_str[:paren_start].strip()
            fn_params = sig_str[paren_start+1:paren_end].strip()
            # Strip qualifiers: static, ATTRIBUTE_PURE, inline, etc.
            for qual in ('static ', 'ATTRIBUTE_PURE ', 'inline ', 'extern '):
                ret_and_name = ret_and_name.replace(qual, '')
            ret_and_name = ret_and_name.strip()

            # Split ret type from function name: last word is the name
            parts = ret_and_name.rsplit(None, 1)
            if len(parts) == 2:
                ret_type, fn_name = parts
            else:
                ret_type = 'void'
                fn_name = parts[0]

            body_str = " ".join(body_parts).strip()
            # Strip leading/trailing semicolons from body statements for clean emit
            fn_line = f"        cdecl {fn_name}({fn_params}) -> {ret_type} {{ {body_str} }};"
            lines.append(fn_line)

        if not lines:
            return False

        param_str = ", ".join(params)
        self._emit(f"// code-generating macro: call with ({param_str})")
        self._emit(f"comptime")
        self._emit("{")
        self._emit(f"    emitideka")
        self._emit(f"    {{")
        self._emit(f"~$f\"")
        for line in lines:
            self._emit(line)
        self._emit(f"\";")
        self._emit(f"    }};")
        self._emit("};")
        self._emit("")
        return True

    def _translate_macro_body(self, toks):
        """Translate a sequence of macro body tokens to IDEKA syntax.
        Key transforms: unary & -> @, binary & -> `&, ## paste -> {param}, /* */ -> /// ///"""
        result = []
        i = 0
        while i < len(toks):
            tok = toks[i]
            s = tok.spelling
            if tok.kind == cx.TokenKind.COMMENT:
                result.append(s.replace('/*', '///').replace('*/', '///'))
                i += 1
                continue
            if s == '##':
                # ## param: merge previous token with next as {next}
                if result and i + 1 < len(toks):
                    prev = result.pop()
                    param = toks[i + 1].spelling
                    result.append(f"{prev}{{{param}}}")
                    i += 2
                    continue
            if s == '&':
                prev = result[-1].strip() if result else ''
                if not prev or prev in ('(', ',', '=', '+', '-', '*', '/', '%',
                                        '!', '~', '|', '^', '<', '>', '&', '?', ':'):
                    result.append('@')
                else:
                    result.append('`&')
                i += 1
                continue
            if s == '~':
                result.append('`!')
                i += 1
                continue
            result.append(s)
            i += 1
        return " ".join(result).strip()

    # -----------------------------------------------------------------------
    # Macro
    # -----------------------------------------------------------------------

    def _emit_macro(self, cursor):
        name = cursor.spelling
        if not name or name.startswith("_"):
            return
        tokens = list(cursor.get_tokens())
        body_tokens = tokens[1:]
        if not body_tokens:
            return
        body = " ".join(t.spelling for t in body_tokens).strip()
        if not body:
            return

        # Detect function-like macros: '(' immediately follows the name with no gap
        is_functionlike = (len(tokens) >= 2 and
                           tokens[1].spelling == '(' and
                           tokens[0].extent.end.offset == tokens[1].extent.start.offset)
        if name in self._macro_expand_set() or (is_functionlike and self._system_file):
            self._emit(f"// #define {name}: translated at each use site")
            return

        if is_functionlike:
            # Parse: NAME ( param1, param2, ... ) body...
            # tokens[0] is the macro name, tokens[1] is '('
            params = []
            i = 2  # skip name and '('
            while i < len(tokens) and tokens[i].spelling != ')':
                if tokens[i].spelling != ',':
                    params.append(tokens[i].spelling)
                i += 1
            i += 1  # skip ')'
            body_toks = tokens[i:]
            body = self._translate_macro_body(body_toks)
            if not body:
                return
            # Multi-statement macros: check if it's a code-generating ## paste macro
            if ';' in body or (body.startswith('do') and 'while' in body):
                if '##' in body:
                    result = self._emit_codegen_macro(name, params, body_toks)
                    if result:
                        return
                self._emit(f"// macro (multi-statement, manual translation needed): {name}({', '.join(params)}) {body}")
                return
            param_str = ", ".join(params)
            self._emit(f"macro {name}({param_str})")
            self._emit("{")
            self._emit(f"    {body}")
            self._emit("};")
            self._emit("")
            return

        val = _c_int_value(body)
        try:
            if val is None:
                raise ValueError(body)
            if val < 0:
                if val >= -(2**31):
                    self._emit(f"int {name} = {val};")
                else:
                    self._emit(f"long {name} = {val};")
            else:
                if val <= 0xFFFFFFFF:
                    self._emit(f"uint {name} = {val};")
                else:
                    self._emit(f"ulong {name} = {val};")
            return
        except ValueError:
            pass

        try:
            float(body)
            self._emit(f"double {name} = {_num_suffixes(body)};")
            return
        except ValueError:
            pass

        if body.startswith('"'):
            if not _is_plain_string(body):
                body = self._expand_string_macro(name) or body
            self._emit(f"byte* {name} = {body};")
            return

        # Multi-statement object-like macro -- comment
        if ';' in body or (body.startswith('do') and 'while' in body):
            self._emit(f"// macro (multi-statement, manual translation needed): {name} {body}")
            return

        # Expression object-like macro -- emit as parameterless macro block
        translated = self._translate_macro_body(body_tokens)
        self._emit(f"macro {name}")
        self._emit("{")
        self._emit(f"    {translated}")
        self._emit("};")
        self._emit("")

    # -----------------------------------------------------------------------
    # Statement emission
    # -----------------------------------------------------------------------

    # -----------------------------------------------------------------------
    # goto into a loop. IDEKA only lets a goto inside a loop reach a label inside
    # that loop, so a C goto from outside is rewritten with an entry flag:
    #     goto L;   ->   _gt_L = true; goto _gte_L;
    # _gte_L sits just before the outermost loop holding L. While _gt_L is set,
    # everything on the way down to L is skipped (statements before L are guarded,
    # loop and if conditions are bypassed, a switch jumps to L's case), and the
    # label clears the flag. Nothing else about the code changes.
    # -----------------------------------------------------------------------

    _LOOP_KINDS = (CursorKind.FOR_STMT, CursorKind.WHILE_STMT, CursorKind.DO_STMT)

    def _gt_reset(self):
        self._gt_path = {}       # node hash -> (label, hash of next node down the path)
        self._gt_enter = {}      # loop hash -> [labels entered before it]
        self._gt_gotos = {}      # goto hash -> label
        self._gt_labels = []     # labels that got the flag treatment, in order
        self._gt_body = None
        self._gt_cur_switch_info = None

    def _gt_analyze(self, body):
        self._gt_reset()
        self._gt_body = body.hash
        labels = {}
        gotos = []

        def rec(c, loops, anc):
            for ch in c.get_children():
                if ch.kind == CursorKind.LABEL_STMT:
                    labels[ch.spelling] = (list(loops), list(anc), ch)
                elif ch.kind == CursorKind.GOTO_STMT:
                    kids = list(ch.get_children())
                    if kids:
                        gotos.append((kids[0].spelling, list(loops), ch))
                nl = loops + [ch] if ch.kind in self._LOOP_KINDS else loops
                rec(ch, nl, anc + [ch])

        rec(body, [], [body])
        bad = {}
        for name, gl, g in gotos:
            if name not in labels:
                continue
            ll = labels[name][0]
            if ll and [x.hash for x in gl[:len(ll)]] != [x.hash for x in ll]:
                bad.setdefault(name, []).append(g)
        for name, gs in bad.items():
            ll, anc, lc = labels[name]
            outer = ll[0]
            hashes = [a.hash for a in anc]
            chain = anc[hashes.index(outer.hash):] + [lc]
            if any(c.hash in self._gt_path for c in chain[:-1]):
                self._emit(f'{"    " * self._indent}#warn "goto {name} jumps into a loop and shares a path with another such goto, manual restructuring needed";')
                continue
            for a, b in zip(chain, chain[1:]):
                self._gt_path[a.hash] = (name, b.hash)
            self._gt_enter.setdefault(outer.hash, []).append(name)
            for g in gs:
                self._gt_gotos[g.hash] = name
            self._gt_labels.append(name)

    def _emit_stmt_seq(self, stmts, info):
        """Emit stmts; the ones ahead of the statement on the goto path are skipped
        while the entry flag is set. Declarations stay outside the guard so the
        names they introduce keep their scope."""
        if not info:
            for st in stmts:
                self._emit_stmt(st)
            return
        flag = f"_gt_{info[0]}"
        idx = next((i for i, st in enumerate(stmts) if st.hash == info[1]), None)
        if idx is None:
            for st in stmts:
                self._emit_stmt(st)
            return
        pad = "    " * self._indent
        run = []

        def flush():
            if not run:
                return
            self._emit(f"{pad}if (!{flag})")
            self._emit(f"{pad}{{")
            self._indent += 1
            for st in run:
                self._emit_stmt(st)
            self._indent -= 1
            self._emit(f"{pad}}};")
            del run[:]

        for st in stmts[:idx]:
            if st.kind == CursorKind.DECL_STMT:
                flush()
                self._emit_stmt(st)
            else:
                run.append(st)
        flush()
        for st in stmts[idx:]:
            self._emit_stmt(st)

    def _gt_case_value(self, compound, target):
        """Text of the case constant of the case group holding the statement with hash
        target, or None when it is the default group or not found."""
        cur = None
        for ch in compound.get_children():
            if ch.kind in (CursorKind.CASE_STMT, CursorKind.DEFAULT_STMT):
                cur = ch
            if ch.hash == target:
                if cur is None or cur.kind == CursorKind.DEFAULT_STMT:
                    return None
                return self._emit_expr(list(cur.get_children())[0])
        return None

    def _emit_compound(self, cursor):
        pad = "    " * self._indent
        self._emit(f"{pad}{{")
        self._indent += 1
        if cursor.hash == self._gt_body:
            for nm in self._gt_labels:
                self._emit(f"{'    ' * self._indent}bool _gt_{nm} = false;")
        self._emit_stmt_seq(list(cursor.get_children()), self._gt_path.get(cursor.hash))
        self._indent -= 1
        self._emit(f"{pad}}};")

    def _call_is_noreturn(self, cursor):
        """True when the statement is a call to a function declared noreturn."""
        top = cursor
        while top.kind in (CursorKind.UNEXPOSED_EXPR, CursorKind.PAREN_EXPR):
            kids = list(top.get_children())
            if len(kids) != 1:
                return False
            top = kids[0]
        if top.kind != CursorKind.CALL_EXPR:
            return False
        ref = top.referenced
        if ref is None or ref.kind != CursorKind.FUNCTION_DECL:
            return False
        rl = ref.location
        key = (ref.spelling, rl.file.name if rl.file else "", rl.line)
        cache = self.__dict__.setdefault("_noreturn_cache", {})
        if key not in cache:
            cache[key] = self._decl_is_noreturn(ref)
        return cache[key]

    _NORETURN_WORDS = ("noreturn", "_Noreturn", "__noreturn__")

    def _noreturn_macro_names(self):
        """Names of macros whose body mentions noreturn (e.g. NORETURN)."""
        names = self.__dict__.get("_noreturn_macros")
        if names is None:
            names = set()
            for c in self.tu.cursor.get_children():
                if c.kind != CursorKind.MACRO_DEFINITION:
                    continue
                toks = [t.spelling for t in c.get_tokens()]
                if any(t in self._NORETURN_WORDS for t in toks[1:]):
                    names.add(toks[0])
            self._noreturn_macros = names
        return names

    def _decl_is_noreturn(self, decl):
        """libclang does not expose __attribute__((noreturn)) and the token extents of a
        declaration shift after attribute macros, so the declaration is read from its
        source text: everything between the previous `;` `{` `}` and the function name."""
        loc = decl.location
        if loc.file is None:
            return False
        texts = self.__dict__.setdefault("_noreturn_src", {})
        path = loc.file.name
        if path not in texts:
            try:
                with open(path, "rb") as fh:
                    texts[path] = fh.read().decode("utf-8", errors="replace")
            except OSError:
                texts[path] = ""
        src = texts[path]
        # byte offset to character offset
        pos = len(src.encode("utf-8")[:loc.offset].decode("utf-8", errors="replace"))
        start = pos
        while start > 0 and src[start - 1] not in ";{}":
            start -= 1
        seg = []
        for line in src[start:pos].split("\n"):
            ls = line.strip()
            if ls.startswith("#"):
                continue
            seg.append(line.split("//")[0])
        text = " ".join(seg)
        words = []
        k = 0
        while k < len(text):
            if text[k].isalpha() or text[k] == "_":
                e = k
                while e < len(text) and (text[e].isalnum() or text[e] == "_"):
                    e += 1
                words.append(text[k:e])
                k = e
            else:
                k += 1
        macros = self._noreturn_macro_names()
        return any(w in self._NORETURN_WORDS or w in macros for w in words)

    def _emit_stmt(self, cursor):
        self._emit_stmt_inner(cursor)
        # control never leaves a call to a noreturn function; say so, since IDEKA
        # requires a function to end in a return or an unreachable marker
        if self._call_is_noreturn(cursor):
            self._emit("    " * self._indent + "noreturn;")

    def _emit_stmt_inner(self, cursor):
        pad = "    " * self._indent
        kind = cursor.kind
        for nm in self._gt_enter.get(cursor.hash, ()):
            self._emit(f"{pad}label _gte_{nm}:")

        if kind == CursorKind.COMPOUND_STMT:
            self._emit_compound(cursor)

        elif (kind == CursorKind.CSTYLE_CAST_EXPR
              and cursor.type.get_canonical().kind == TypeKind.VOID):
            # `(void)x;` is discarded by C, but a void cast means something specific
            # in IDEKA, so it is not carried over 1:1.
            kids = list(cursor.get_children())
            operand = (self._src_slice(kids[-1]) if kids else "") or "x"
            operand = operand.replace('"', "'")
            self._emit(f'{pad}#warn "(void){operand}; would be discarded by C, manual review advised";')

        elif kind == CursorKind.RETURN_STMT:
            children = list(cursor.get_children())
            if children:
                val, hoisted = self._cond_with_hoist(children[0])
                for h in hoisted:
                    self._emit(f"{pad}{h}")
                self._emit(f"{pad}return {val};")
            else:
                self._emit(f"{pad}return void;")

        elif kind == CursorKind.DECL_STMT:
            for child in cursor.get_children():
                if child.kind == CursorKind.VAR_DECL:
                    self._emit_local_var(child)

        elif kind == CursorKind.IF_STMT:
            self._emit_if(cursor)

        elif kind == CursorKind.FOR_STMT:
            self._emit_for(cursor)

        elif kind == CursorKind.WHILE_STMT:
            self._emit_while(cursor)

        elif kind == CursorKind.DO_STMT:
            self._emit_do_while(cursor)

        elif kind == CursorKind.SWITCH_STMT:
            self._emit_switch(cursor)

        elif kind == CursorKind.CASE_STMT:
            # Should be handled by _emit_switch_body_flat; fallback if encountered standalone
            self._emit_case(cursor, [])

        elif kind == CursorKind.DEFAULT_STMT:
            # Should be handled by _emit_switch_body_flat; fallback if encountered standalone
            self._emit_default(cursor, [])

        elif kind == CursorKind.BREAK_STMT:
            # In IDEKA, plain break exits loops. To exit a switch, use 'break switch;'.
            if self._switch_depth == 0 or (self._loop_depth_in_switch_stack and self._loop_depth_in_switch_stack[-1] > 0):
                self._emit(f"{pad}break;")
            else:
                self._emit(f"{pad}break switch;")

        elif kind == CursorKind.CONTINUE_STMT:
            self._emit(f"{pad}continue;")

        elif kind == CursorKind.GOTO_STMT:
            children = list(cursor.get_children())
            label = children[0].spelling if children else "?"
            if cursor.hash in self._gt_gotos:
                self._emit(f"{pad}_gt_{label} = true;")
                self._emit(f"{pad}goto _gte_{label};")
            else:
                self._emit(f"{pad}goto {label};")

        elif kind == CursorKind.LABEL_STMT:
            children = list(cursor.get_children())
            self._emit(f"{pad}label {cursor.spelling}:")
            if cursor.spelling in self._gt_labels:
                self._emit(f"{pad}_gt_{cursor.spelling} = false;")
            if children:
                self._emit_stmt(children[0])

        elif kind == CursorKind.NULL_STMT:
            pass

        elif self._comma_node(cursor) is not None:
            # IDEKA has no comma operator: `a = b, c = d;` becomes two statements
            kids = list(self._comma_node(cursor).get_children())
            self._emit_stmt(kids[0])
            self._emit_stmt(kids[1])

        else:
            # Expression statement. Assignments nested inside the expression
            # (`a = *(p = &q)`) are not allowed in IDEKA expressions: hoist them out
            # as statements of their own, ahead of this one.
            top = cursor
            while top.kind in (CursorKind.UNEXPOSED_EXPR, CursorKind.PAREN_EXPR):
                kids = list(top.get_children())
                if len(kids) != 1:
                    break
                top = kids[0]
            tkids = list(top.get_children()) if top.kind == CursorKind.BINARY_OPERATOR else []
            if (top.kind == CursorKind.CONDITIONAL_OPERATOR
                    and top.type.get_canonical().kind == TypeKind.VOID):
                # `c ? (void)0 : f()` as a statement (assert): an if/else
                ck = list(top.get_children())
                cnd, hoisted = self._cond_with_hoist(ck[0])
                for h in hoisted:
                    self._emit(f"{pad}{h}")
                def _void_noop(n):
                    n = self._strip_wrappers(n)
                    while n.kind in (CursorKind.CSTYLE_CAST_EXPR, CursorKind.PAREN_EXPR,
                                     CursorKind.UNEXPOSED_EXPR):
                        kk = list(n.get_children())
                        if len(kk) != 1 and n.kind != CursorKind.CSTYLE_CAST_EXPR:
                            break
                        if not kk:
                            break
                        n = kk[-1]
                    return n.kind == CursorKind.INTEGER_LITERAL
                if _void_noop(ck[1]):
                    self._emit(f"{pad}if (!({cnd})) {{")
                    self._indent += 1
                    self._emit_stmt(ck[2])
                    self._indent -= 1
                    self._emit(f"{pad}}};")
                else:
                    self._emit(f"{pad}if ({cnd}) {{")
                    self._indent += 1
                    self._emit_stmt(ck[1])
                    self._indent -= 1
                    self._emit(f"{pad}}} else {{")
                    self._indent += 1
                    self._emit_stmt(ck[2])
                    self._indent -= 1
                    self._emit(f"{pad}}};")
            elif top.kind == CursorKind.COMPOUND_ASSIGNMENT_OPERATOR:
                ck = list(top.get_children())
                lhs = self._emit_expr(ck[0])
                rhs, hoisted = self._cond_with_hoist(ck[1])
                for h in hoisted:
                    self._emit(f"{pad}{h}")
                cop = _BINOP_MAP.get(self._extract_binary_op(top, ck), self._extract_binary_op(top, ck))
                if not self._union_write(pad, ck[0], lhs, cop, rhs):
                    self._emit(f"{pad}{lhs} {cop} {rhs};")
            elif len(tkids) == 2 and self._extract_binary_op(top, tkids) == "=":
                lhs = self._emit_expr(tkids[0])
                rhs, hoisted = self._cond_with_hoist(tkids[1])
                for h in hoisted:
                    self._emit(f"{pad}{h}")
                if not self._union_write(pad, tkids[0], lhs, "=", rhs):
                    self._emit(f"{pad}{lhs} = {rhs};")
            else:
                expr, hoisted = self._cond_with_hoist(cursor)
                for h in hoisted:
                    self._emit(f"{pad}{h}")
                if expr:
                    self._emit(f"{pad}{expr};")

    def _union_target(self, cursor):
        """(variable text, member, union record) when cursor is `v.m` for a union variable v."""
        c = cursor
        while c.kind in (CursorKind.UNEXPOSED_EXPR, CursorKind.PAREN_EXPR):
            kids = list(c.get_children())
            if len(kids) != 1:
                return None
            c = kids[0]
        if c.kind != CursorKind.MEMBER_REF_EXPR:
            return None
        kids = list(c.get_children())
        if not kids:
            return None
        base = kids[0]
        bt = base.type.get_canonical()
        if bt.kind != TypeKind.RECORD:
            return None
        rec = bt.get_declaration()
        if rec.kind != CursorKind.UNION_DECL:
            return None
        return self._emit_expr(base), c.spelling, rec

    def _union_write(self, pad, lcur, lhs, op, rhs):
        """A union variable may switch members but never rewrite the one it holds. C code that
        writes the same member again (`y.u = A; ... y.u |= B;`) writes another member first:
        the value is kept in a temporary, `y.other = 0;`, then the member is written. Returns
        True when the statement was emitted here."""
        tgt = self._union_target(lcur)
        if tgt is None:
            return False
        var, mem, rec = tgt
        last = self._union_last
        prev = last.get(var)
        last[var] = mem
        if prev != mem:
            return False
        other = None
        zero = "0"
        for f in rec.get_children():
            fk = f.type.get_canonical().kind
            if (f.kind == CursorKind.FIELD_DECL and f.spelling and f.spelling != mem
                    and (fk in _INTEGRAL_KINDS or fk in (TypeKind.FLOAT, TypeKind.DOUBLE))):
                other = f.spelling
                zero = "0" if fk in _INTEGRAL_KINDS else "0.0"
                break
        if other is None:
            return False
        self._union_tmp += 1
        tmp = f"_cit_u{self._union_tmp}"
        ty = self._IDEKA_type(lcur.type, "")
        if op == "=":
            self._emit(f"{pad}{ty} {tmp} = {rhs};")
            self._emit(f"{pad}{var}.{other} = {zero};")
            self._emit(f"{pad}{lhs} = {tmp};")
        else:
            self._emit(f"{pad}{ty} {tmp} = {lhs};")
            self._emit(f"{pad}{var}.{other} = {zero};")
            self._emit(f"{pad}{lhs} = {tmp} {op[:-1]} ({rhs});")
        return True

    def _comma_node(self, cursor):
        """The BINARY_OPERATOR node when cursor is a comma expression, else None."""
        c = cursor
        while c.kind in (CursorKind.UNEXPOSED_EXPR, CursorKind.PAREN_EXPR):
            kids = list(c.get_children())
            if len(kids) != 1:
                return None
            c = kids[0]
        if c.kind != CursorKind.BINARY_OPERATOR:
            return None
        kids = list(c.get_children())
        if len(kids) == 2 and self._extract_binary_op(c, kids) == ",":
            return c
        return None

    def _emit_local_var(self, cursor):
        pad = "    " * self._indent
        ftype = self._IDEKA_type(cursor.type, cursor.spelling)
        children = list(cursor.get_children())
        init = None
        for child in children:
            if child.kind in (CursorKind.TYPE_REF, CursorKind.TEMPLATE_REF):
                continue
            # For array types, libclang may expose the array size as an INTEGER_LITERAL
            # child even when there is no C initializer. Skip it.
            if (cursor.type.get_canonical().kind == TypeKind.CONSTANTARRAY
                    and child.kind == CursorKind.INTEGER_LITERAL):
                continue
            init = self._only_if_after_eq(cursor, child)
            break
        vname = _rename(cursor.spelling)
        if init:
            val, hoisted = self._cond_with_hoist(init)
            for h in hoisted:
                self._emit(f"{pad}{h}")
            self._emit(f"{pad}{_with_name(ftype, vname)} = {val};")
        else:
            self._emit(f"{pad}{_with_name(ftype, vname)};")

    @staticmethod
    def _strip_wrappers(c):
        while c.kind in (CursorKind.UNEXPOSED_EXPR, CursorKind.PAREN_EXPR):
            kids = list(c.get_children())
            if len(kids) != 1:
                break
            c = kids[0]
        return c

    def _cond_structured(self, cursor):
        """Condition with assignments under && / || as (statement lines, expression).
        `a && (x = f()) && x > 0` cannot hoist `x = f()` ahead of the test, so the
        test becomes a bool built step by step, each step guarded by the ones before:
            bool _c1 = a;  if (_c1) { x = f(); _c1 = x != 0; }  ...
        Statement lines carry their own relative indentation."""
        node = self._strip_wrappers(cursor)
        if node.kind == CursorKind.BINARY_OPERATOR:
            kids = list(node.get_children())
            op = self._extract_binary_op(node, kids) if len(kids) == 2 else None
            if op in ("&&", "||"):
                sl, el = self._cond_structured(kids[0])
                sr, er = self._cond_structured(kids[1])
                idk_op = _BINOP_MAP.get(op, op)
                if not sr:
                    return sl, f"{el} {idk_op} {er}"
                self._cond_tmp_n = getattr(self, '_cond_tmp_n', 0) + 1
                tmp = f"_c{self._cond_tmp_n}"
                guard = tmp if op == "&&" else f"!{tmp}"
                lines = list(sl)
                lines.append(f"bool {tmp} = {el};")
                lines.append(f"if ({guard})")
                lines.append("{")
                lines.extend("    " + x for x in sr)
                lines.append(f"    {tmp} = {er};")
                lines.append("};")
                return lines, tmp
        if node.kind == CursorKind.UNARY_OPERATOR:
            api = _api_unop(node)
            kids = list(node.get_children())
            if api and api[0] == "!" and kids:
                sl, el = self._cond_structured(kids[0])
                if sl:
                    return sl, (f"!{el}" if el.isidentifier() else f"!({el})")
        expr, hoisted = self._cond_with_hoist_plain(cursor)
        return hoisted, expr

    def _cond_with_hoist(self, cond_cursor):
        saved = getattr(self, '_hoist_blocked', False)
        self._hoist_blocked = False
        try:
            plain = self._cond_with_hoist_plain(cond_cursor)
            blocked = self._hoist_blocked
        finally:
            self._hoist_blocked = saved
        if not blocked:
            return plain
        stmts, expr = self._cond_structured(cond_cursor)
        return expr, stmts

    def _cond_with_hoist_plain(self, cond_cursor):
        """Emit an if condition with every assignment inside it hoisted out.
        IDEKA bans assignment inside a condition, so `if ((fh = fopen(p)) == NULL)`
        becomes `fh = fopen(p);` then `if (fh == NULL)`. Assignments that sit under the
        right side of && / || are left in place, because hoisting them would run them
        unconditionally. Returns (condition_text, [hoisted statements])."""
        saved = (getattr(self, '_hoist_pending', None), getattr(self, '_hoist_shortcircuit', 0))
        self._hoist_pending = []
        self._hoist_shortcircuit = 0
        try:
            cond = self._emit_expr(cond_cursor)
            hoisted = self._hoist_pending
        finally:
            self._hoist_pending, self._hoist_shortcircuit = saved
        return cond, hoisted

    def _emit_braced_body(self, stmt):
        """Emit stmt as a braced block { ... }; wrapping a single statement when needed,
        so an if/elif/else chain always has the closing }; the chain code relies on."""
        if stmt.kind == CursorKind.COMPOUND_STMT:
            self._emit_compound(stmt)
            return
        pad = "    " * self._indent
        self._emit(f"{pad}{{")
        self._indent += 1
        self._emit_stmt(stmt)
        self._indent -= 1
        self._emit(f"{pad}}};")

    def _emit_if_gt(self, cursor, info):
        """An if on the way to a goto-entered label: while the entry flag is set the
        condition is bypassed toward the branch holding the label, and the
        condition's own hoisted statements are skipped."""
        pad = "    " * self._indent
        children = list(cursor.get_children())
        flag = f"_gt_{info[0]}"
        cond, hoisted = self._cond_with_hoist(children[0])
        if hoisted:
            self._emit(f"{pad}if (!{flag})")
            self._emit(f"{pad}{{")
            for h in hoisted:
                self._emit(f"{pad}    {h}")
            self._emit(f"{pad}}};")
        if children[1].hash == info[1]:
            cond = f"({flag} | ({cond}))"
        else:
            cond = f"(!{flag} & ({cond}))"
        self._emit(f"{pad}if ({cond})")
        self._emit_braced_body(children[1])
        if len(children) > 2:
            if self.lines and self.lines[-1].rstrip().endswith("};"):
                self.lines[-1] = self.lines[-1].rstrip()[:-1]
            self._emit(f"{pad}else")
            self._emit_braced_body(children[2])

    def _emit_if(self, cursor):
        pad = "    " * self._indent
        children = list(cursor.get_children())
        info = self._gt_path.get(cursor.hash)
        if info:
            self._emit_if_gt(cursor, info)
            return
        # children: cond, then, [else]
        cond, hoisted = self._cond_with_hoist(children[0])
        for h in hoisted:
            self._emit(f"{pad}{h}")
        self._emit(f"{pad}if ({cond})")
        self._emit_braced_body(children[1])
        if len(children) > 2:
            else_child = children[2]
            # strip the trailing ; of the previous }; so elif/else chains on
            if self.lines and self.lines[-1].rstrip().endswith("};"):
                self.lines[-1] = self.lines[-1].rstrip()[:-1]
            if (else_child.kind == CursorKind.IF_STMT
                    and else_child.hash not in self._gt_path
                    and not self._cond_with_hoist(list(else_child.get_children())[0])[1]):
                sub = list(else_child.get_children())
                self._emit(f"{pad}elif ({self._emit_expr(sub[0])})")
                self._emit_braced_body(sub[1])
                if len(sub) > 2:
                    self._emit_else_tail(sub[2], pad)
            else:
                self._emit_else_tail(else_child, pad)

    def _emit_else_tail(self, stmt, pad):
        """Emit the else part of an if chain; a nested if becomes another elif."""
        if (stmt.kind == CursorKind.IF_STMT
                and stmt.hash not in self._gt_path
                and not self._cond_with_hoist(list(stmt.get_children())[0])[1]):
            sub = list(stmt.get_children())
            if self.lines and self.lines[-1].rstrip().endswith("};"):
                self.lines[-1] = self.lines[-1].rstrip()[:-1]
            self._emit(f"{pad}elif ({self._emit_expr(sub[0])})")
            self._emit_braced_body(sub[1])
            if len(sub) > 2:
                self._emit_else_tail(sub[2], pad)
            return
        if self.lines and self.lines[-1].rstrip().endswith("};"):
            self.lines[-1] = self.lines[-1].rstrip()[:-1]
        self._emit(f"{pad}else")
        self._emit_braced_body(stmt)

    def _emit_guarded_body(self, hoisted, cond, body, pad, flag=None, info=None):
        """Body of a loop whose condition held assignments. The assignments run first
        in every iteration, then `if (!(cond)) break;`, then the original body, so
        `continue` still re-evaluates the condition. body may be None."""
        self._emit(f"{pad}{{")
        self._indent += 1
        ipad = "    " * self._indent
        if flag:
            # entering toward a goto label: the condition is not evaluated this once
            self._emit(f"{ipad}if (!{flag})")
            self._emit(f"{ipad}{{")
            self._indent += 1
            ipad = "    " * self._indent
        for h in hoisted:
            self._emit(f"{ipad}{h}")
        self._emit(f"{ipad}if (!({cond}))")
        self._emit(f"{ipad}{{")
        self._emit(f"{ipad}    break;")
        self._emit(f"{ipad}}};")
        if flag:
            self._indent -= 1
            ipad = "    " * self._indent
            self._emit(f"{ipad}}};")
        if body is not None:
            if body.kind == CursorKind.COMPOUND_STMT:
                self._emit_stmt_seq(list(body.get_children()), self._gt_path.get(body.hash))
            else:
                self._emit_stmt(body)
        self._indent -= 1
        self._emit(f"{pad}}};")

    def _comma_leaves(self, c):
        """The operands of a comma expression in order; [c] when it is not one."""
        node = self._comma_node(c)
        if node is None:
            return [c]
        kids = list(node.get_children())
        return self._comma_leaves(kids[0]) + self._comma_leaves(kids[1])

    def _emit_for_multi_inc(self, init_str, cond_str, hoisted, inc_leaves, body, pad):
        """for (init; cond; a, b): the increments cannot share one slot, so they run
        at the top of every iteration but the first, ahead of the test. `continue`
        lands there exactly as it lands on the increment in C."""
        self._for_counter = getattr(self, '_for_counter', 0) + 1
        first = f"_for_first{self._for_counter}"
        self._emit(f"{pad}{{")
        self._indent += 1
        ipad = "    " * self._indent
        self._emit(f"{ipad}bool {first} = true;")
        self._emit(f"{ipad}for ({init_str}; ; )")
        self._emit(f"{ipad}{{")
        self._indent += 1
        jpad = "    " * self._indent
        self._emit(f"{jpad}if (!{first})")
        self._emit(f"{jpad}{{")
        self._indent += 1
        for leaf in inc_leaves:
            self._emit_stmt(leaf)
        self._indent -= 1
        self._emit(f"{jpad}}};")
        self._emit(f"{jpad}{first} = false;")
        for h in hoisted:
            self._emit(f"{jpad}{h}")
        if cond_str:
            self._emit(f"{jpad}if (!({cond_str}))")
            self._emit(f"{jpad}{{")
            self._emit(f"{jpad}    break;")
            self._emit(f"{jpad}}};")
        if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] += 1
        if body is not None and body.kind == CursorKind.COMPOUND_STMT:
            self._emit_stmt_seq(list(body.get_children()), self._gt_path.get(body.hash))
        elif body is not None:
            self._emit_stmt(body)
        if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] -= 1
        self._indent -= 1
        self._emit(f"{ipad}}};")
        self._indent -= 1
        self._emit(f"{pad}}};")

    def _for_slots(self, cursor, children):
        """Which child of a for statement is its init, condition, increment and body.
        libclang lists only the parts that exist, so `for (; c; c = c->prev)` has no
        marker for the empty init; the header's own `;` and `)` tokens say where each
        part sits. None when the tokens cannot be trusted (a for from a macro)."""
        toks = list(cursor.get_tokens())
        if not toks or toks[0].spelling != "for" or len(toks) < 3 or toks[1].spelling != "(":
            return None
        depth, semis, close = 0, [], None
        for t in toks[1:]:
            sp = t.spelling
            if sp in ("(", "[", "{"):
                depth += 1
            elif sp in (")", "]", "}"):
                depth -= 1
                if depth == 0:
                    close = t.extent.start.offset
                    break
            elif sp == ";" and depth == 1:
                semis.append(t.extent.start.offset)
        if close is None or len(semis) != 2:
            return None
        out = {"init": None, "cond": None, "inc": None, "body": None}
        for ch in children:
            o = ch.extent.start.offset
            if o < semis[0]:
                slot = "init"
            elif o < semis[1]:
                slot = "cond"
            elif o < close:
                slot = "inc"
            else:
                slot = "body"
            if out[slot] is not None and slot != "body":
                return None
            if slot == "body" and out[slot] is not None:
                return None
            out[slot] = ch
        return out

    def _emit_for(self, cursor):
        pad = "    " * self._indent
        children = list(cursor.get_children())
        # For stmt children in clang: init, cond, inc, body (any may be absent)
        # libclang exposes them positionally; absent parts are NullStmt or missing
        # Use token-based reconstruction for the header since absent parts are hard to detect
        init_str = cond_str = inc_str = ""
        body = None
        body_single = None  # non-compound single-statement body
        parts = []
        for child in children:
            if child.kind == CursorKind.COMPOUND_STMT:
                body = child
            else:
                parts.append(child)

        slots = self._for_slots(cursor, children)
        if slots is not None:
            Null = type("NullPart", (), {"kind": CursorKind.NULL_STMT})
            body = slots["body"] if slots["body"] is not None and \
                slots["body"].kind == CursorKind.COMPOUND_STMT else None
            body_single = slots["body"] if body is None else None
            parts = [slots[k] if slots[k] is not None else Null() for k in ("init", "cond", "inc")]
            if body_single is not None and body_single.kind == CursorKind.NULL_STMT:
                body_single = None
        # The body is the last part if it is not a NULL_STMT and there are more
        # parts than the expected 3 (init, cond, inc). A single-statement body
        # has no braces so it appears as a 4th non-compound child.
        if slots is not None:
            pass
        elif len(parts) > 3 and parts[-1].kind != CursorKind.NULL_STMT:
            body_single = parts.pop()
        elif len(parts) == 3 and body is None:
            # All three slots filled and no compound -- last may still be body
            # if the for header has fewer than 3 meaningful parts. Check via
            # source extent: the body must start after the closing ')' of the for.
            # Simpler heuristic: if parts[2] is not an increment-like expression
            # (e.g. it's a full statement kind), treat it as body.
            pass  # leave as-is; covered by NULL_STMT guards below

        if len(parts) >= 1 and parts[0].kind != CursorKind.NULL_STMT:
            if parts[0].kind == CursorKind.DECL_STMT:
                decl = list(parts[0].get_children())[0]
                ftype = self._IDEKA_type(decl.type, decl.spelling)
                decl_children = [c for c in decl.get_children()
                                 if c.kind not in (CursorKind.TYPE_REF, CursorKind.TEMPLATE_REF)]
                if decl_children:
                    init_str = f"{_with_name(ftype, decl.spelling)} = {self._emit_expr(decl_children[0])}"
                else:
                    init_str = _with_name(ftype, decl.spelling)
            else:
                init_leaves = self._comma_leaves(parts[0])
                if len(init_leaves) > 1:
                    # IDEKA has no comma operator: each part runs as a statement
                    for leaf in init_leaves:
                        self._emit_stmt(leaf)
                    init_str = ""
                    parts = [None] + list(parts[1:])
                    parts[0] = type("NullPart", (), {"kind": CursorKind.NULL_STMT})()
                else:
                    init_str = self._emit_expr(parts[0])
        hoisted = []
        if len(parts) >= 2 and parts[1].kind != CursorKind.NULL_STMT:
            cond_str, hoisted = self._cond_with_hoist(parts[1])
        inc_leaves = []
        if len(parts) >= 3 and parts[2].kind != CursorKind.NULL_STMT:
            inc_leaves = self._comma_leaves(parts[2])
            if len(inc_leaves) == 1:
                inc_str = self._emit_expr(parts[2])
        if len(inc_leaves) > 1:
            self._emit_for_multi_inc(init_str, cond_str, hoisted, inc_leaves,
                                     body or body_single, pad)
            return

        info = self._gt_path.get(cursor.hash)
        if info:
            flag = f"_gt_{info[0]}"
            # Entering toward a goto label skips the initialiser and the first test.
            # A declaration initialiser stays: skipping it would leave the name out.
            if init_str and parts[0].kind != CursorKind.DECL_STMT:
                self._emit(f"{pad}if (!{flag})")
                self._emit(f"{pad}{{")
                self._indent += 1
                self._emit_stmt(parts[0])
                self._indent -= 1
                self._emit(f"{pad}}};")
                init_str = ""
            if cond_str and not hoisted:
                cond_str = f"({flag} | ({cond_str}))"
        if hoisted:
            # The condition slot cannot hold an assignment: leave it empty and test
            # inside the body instead.
            self._emit(f"{pad}for ({init_str}; ; {inc_str})")
            if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] += 1
            self._emit_guarded_body(hoisted, cond_str, body or body_single, pad,
                                    flag=f"_gt_{info[0]}" if info else None)
            if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] -= 1
            return
        self._emit(f"{pad}for ({init_str}; {cond_str}; {inc_str})")
        if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] += 1
        if body:
            self._emit_compound(body)
        elif body_single:
            self._emit_braced_body(body_single)
        else:
            self._emit(f"{pad}{{}};")
        if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] -= 1

    def _emit_while(self, cursor):
        pad = "    " * self._indent
        children = list(cursor.get_children())
        cond_cursor = children[0]
        # while(1) / while(true) -- libclang folds 'true' to integer 1
        if cond_cursor.kind == CursorKind.INTEGER_LITERAL:
            toks = list(cond_cursor.get_tokens())
            raw = toks[0].spelling if toks else "0"
            cond = "true" if raw == "1" else raw
        else:
            cond, hoisted = self._cond_with_hoist(cond_cursor)
            info = self._gt_path.get(cursor.hash)
            if hoisted:
                self._emit(f"{pad}while (true)")
                if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] += 1
                self._emit_guarded_body(hoisted, cond,
                                        children[1] if len(children) > 1 else None, pad,
                                        flag=f"_gt_{info[0]}" if info else None)
                if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] -= 1
                return
            if info:
                cond = f"(_gt_{info[0]} | ({cond}))"
        self._emit(f"{pad}while ({cond})")
        if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] += 1
        if len(children) > 1:
            self._emit_braced_body(children[1])
        else:
            self._emit(f"{pad}{{}};")
        if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] -= 1

    def _emit_do_while(self, cursor):
        pad = "    " * self._indent
        children = list(cursor.get_children())
        body = children[0]
        cond, hoisted = self._cond_with_hoist(children[1])
        if hoisted:
            # The condition holds an assignment, which a condition cannot. The
            # assignments and the test run at the top of every iteration but the
            # first, so `continue` still reaches them as it does in C.
            self._dw_counter = getattr(self, '_dw_counter', 0) + 1
            first = f"_dw_first{self._dw_counter}"
            self._emit(f"{pad}{{")
            self._indent += 1
            ipad = "    " * self._indent
            self._emit(f"{ipad}bool {first} = true;")
            self._emit(f"{ipad}while (true)")
            self._emit(f"{ipad}{{")
            self._indent += 1
            jpad = "    " * self._indent
            self._emit(f"{jpad}if (!{first})")
            self._emit(f"{jpad}{{")
            for h in hoisted:
                self._emit(f"{jpad}    {h}")
            self._emit(f"{jpad}    if (!({cond}))")
            self._emit(f"{jpad}    {{")
            self._emit(f"{jpad}        break;")
            self._emit(f"{jpad}    }};")
            self._emit(f"{jpad}}};")
            self._emit(f"{jpad}{first} = false;")
            if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] += 1
            if body.kind == CursorKind.COMPOUND_STMT:
                self._emit_stmt_seq(list(body.get_children()), self._gt_path.get(body.hash))
            else:
                self._emit_stmt(body)
            if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] -= 1
            self._indent -= 1
            self._emit(f"{ipad}}};")
            self._indent -= 1
            self._emit(f"{pad}}};")
            return
        self._emit(f"{pad}do")
        if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] += 1
        self._emit_braced_body(body)
        if self._loop_depth_in_switch_stack: self._loop_depth_in_switch_stack[-1] -= 1
        # Replace trailing }; with } for do/while continuation
        if self.lines and self.lines[-1].rstrip().endswith("};"):
            self.lines[-1] = self.lines[-1].rstrip()[:-1]
        self._emit(f"{pad}while ({cond});")

    def _emit_switch(self, cursor):
        pad = "    " * self._indent
        children = list(cursor.get_children())
        cond, hoisted = self._cond_with_hoist(children[0])
        info = self._gt_path.get(cursor.hash)
        for h in hoisted:
            if info:
                self._emit(f"{pad}if (!_gt_{info[0]})")
                self._emit(f"{pad}{{")
                self._emit(f"{pad}    {h}")
                self._emit(f"{pad}}};")
            else:
                self._emit(f"{pad}{h}")
        if info and len(children) > 1:
            inner = self._gt_path.get(children[1].hash)
            val = self._gt_case_value(children[1], inner[1]) if inner else None
            if val is None:
                self._emit(f'{pad}#warn "goto {info[0]} enters a default case, manual restructuring needed";')
            else:
                cond = f"(_gt_{info[0]} ? ({val}) : ({cond}))"

        self._switch_depth += 1
        self._loop_depth_in_switch_stack.append(0)

        self._emit(f"{pad}switch ({cond})")
        self._emit(f"{pad}{{")
        self._indent += 1
        if len(children) > 1:
            self._emit_switch_body_flat(children[1])
        self._indent -= 1
        self._emit(f"{pad}}};")

        self._loop_depth_in_switch_stack.pop()
        self._switch_depth -= 1

    def _emit_case(self, cursor, body_stmts):
        """Emit a case block. body_stmts is the list of sibling statements
        that belong to this case (collected by _emit_switch_body_flat)."""
        pad = "    " * self._indent
        children = list(cursor.get_children())
        val = self._emit_expr(children[0])
        self._emit(f"{pad}case ({val})")
        self._emit(f"{pad}{{")
        self._indent += 1
        self._emit_case_label(cursor)
        # child[1] of the CASE_STMT itself is the first inline stmt (if any)
        seq = []
        if len(children) > 1:
            first = children[1]
            if first.kind not in (CursorKind.CASE_STMT, CursorKind.DEFAULT_STMT,
                                  CursorKind.BREAK_STMT, CursorKind.NULL_STMT):
                seq.append(first)
        seq.extend(body_stmts)
        self._emit_stmt_seq(seq, self._gt_path.get(cursor.hash) or self._gt_cur_switch_info)
        self._indent -= 1
        self._emit(f"{pad}}}")

    def _emit_case_label(self, case_cursor):
        name = self._case_labels.get(case_cursor.hash)
        if name:
            self._emit(f"{'    ' * self._indent}label {name}:")

    def _emit_default(self, cursor, body_stmts, has_break=True, is_last=True):
        pad = "    " * self._indent
        self._emit(f"{pad}default")
        self._emit(f"{pad}{{")
        self._indent += 1
        self._emit_case_label(cursor)
        # the first statement of `default: stmt` is the DEFAULT_STMT's own child
        seq = []
        kids = list(cursor.get_children())
        if kids and kids[0].kind not in (CursorKind.CASE_STMT, CursorKind.DEFAULT_STMT,
                                         CursorKind.BREAK_STMT, CursorKind.NULL_STMT):
            seq.append(kids[0])
        seq.extend(body_stmts)
        self._emit_stmt_seq(seq,
                            self._gt_path.get(cursor.hash) or self._gt_cur_switch_info)
        if not has_break and not is_last:
            self._emit(f"{'    ' * self._indent}// FALLTHROUGH -- manual review required")
        self._indent -= 1
        self._emit(f"{pad}}};")

    @staticmethod
    def _case_chain(cursor):
        """The labels stacked on a case (`case 1: case 2: stmt` nests in the AST) and the
        statement they end on, as ([label cursors], statement or None)."""
        labels = [cursor]
        cur = cursor
        while True:
            kids = list(cur.get_children())
            if cur.kind == CursorKind.CASE_STMT:
                sub = kids[1] if len(kids) > 1 else None
            else:
                sub = kids[0] if kids else None
            if sub is not None and sub.kind in (CursorKind.CASE_STMT, CursorKind.DEFAULT_STMT):
                labels.append(sub)
                cur = sub
                continue
            return labels, sub

    @classmethod
    def _ends_in_jump(cls, stmt):
        """True when control cannot run off the end of the statement."""
        while stmt is not None and stmt.kind == CursorKind.COMPOUND_STMT:
            kids = list(stmt.get_children())
            if not kids:
                return False
            stmt = kids[-1]
        return stmt is not None and stmt.kind in (
            CursorKind.RETURN_STMT, CursorKind.GOTO_STMT, CursorKind.CONTINUE_STMT,
            CursorKind.BREAK_STMT)

    def _emit_switch_body_flat(self, body_cursor):
        """The body of a C switch as Ideka cases. Ideka cases do not fall through and
        hold one value, so a run of stacked labels (`case 1: case 2:`) and a body that
        runs on into the next case are joined with gotos to a label in the target case."""
        if body_cursor.kind != CursorKind.COMPOUND_STMT:
            self._emit_stmt(body_cursor)
            return

        children = list(body_cursor.get_children())
        saved_info = self._gt_cur_switch_info
        self._gt_cur_switch_info = self._gt_path.get(body_cursor.hash)

        # segments: {labels: [case/default cursors], stmts: [...], brk: bool}
        segs = []
        cur = None
        for child in children:
            if child.kind == CursorKind.LABEL_STMT:
                # `lbl: default:` / `lbl: case N:` -- the label belongs to the case
                kids = list(child.get_children())
                if kids and kids[0].kind in (CursorKind.CASE_STMT, CursorKind.DEFAULT_STMT):
                    self._case_labels[kids[0].hash] = child.spelling
                    child = kids[0]
            if child.kind in (CursorKind.CASE_STMT, CursorKind.DEFAULT_STMT):
                labels, first = self._case_chain(child)
                cur = {'labels': labels, 'stmts': [], 'brk': False}
                segs.append(cur)
                if first is not None:
                    if first.kind == CursorKind.BREAK_STMT:
                        cur['brk'] = True
                        cur = None
                    elif first.kind != CursorKind.NULL_STMT:
                        cur['stmts'].append(first)
            elif child.kind == CursorKind.BREAK_STMT:
                if cur is not None:
                    cur['brk'] = True
                    cur = None
            else:
                if cur is not None:
                    cur['stmts'].append(child)
                else:
                    self._emit_stmt(child)      # unreachable text before the first case

        # `default` closes the switch in IDEKA. Every hand-over between cases is a goto,
        # so the order of the cases is free: the default goes last.
        for seg in segs:
            seg['labels'] = ([l for l in seg['labels'] if l.kind != CursorKind.DEFAULT_STMT]
                             + [l for l in seg['labels'] if l.kind == CursorKind.DEFAULT_STMT][:1])
        sid = getattr(self, '_sw_counter', 0)
        self._sw_counter = sid + 1
        needs = set()
        for k, seg in enumerate(segs):
            if len(seg['labels']) > 1:
                needs.add(k)
        falls = []
        for k, seg in enumerate(segs):
            ft = (not seg['brk'] and k + 1 < len(segs)
                  and not (seg['stmts'] and self._ends_in_jump(seg['stmts'][-1])))
            falls.append(ft)
            if ft:
                needs.add(k + 1)

        pad = "    " * self._indent
        order = ([k for k, sg in enumerate(segs) if sg['labels'][-1].kind != CursorKind.DEFAULT_STMT]
                 + [k for k, sg in enumerate(segs) if sg['labels'][-1].kind == CursorKind.DEFAULT_STMT])
        for k in order:
            seg = segs[k]
            labels = seg['labels']
            name = f"_cit_sw{sid}_{k}"
            for lab in labels[:-1]:
                if lab.kind == CursorKind.DEFAULT_STMT:
                    self._emit(f"{pad}default")
                else:
                    self._emit(f"{pad}case ({self._emit_expr(list(lab.get_children())[0])})")
                self._emit(f"{pad}{{")
                self._emit(f"{pad}    goto {name};")
                self._emit(f"{pad}}}")
            last = labels[-1]
            if last.kind == CursorKind.DEFAULT_STMT:
                self._emit(f"{pad}default")
            else:
                self._emit(f"{pad}case ({self._emit_expr(list(last.get_children())[0])})")
            self._emit(f"{pad}{{")
            self._indent += 1
            for lab in labels:
                self._emit_case_label(lab)     # a user label on any stacked case reaches this body
            if k in needs:
                self._emit(f"{'    ' * self._indent}label {name}:")
            self._emit_stmt_seq(seg['stmts'], self._gt_path.get(last.hash)
                                or self._gt_cur_switch_info)
            if seg['brk']:
                self._emit(f"{'    ' * self._indent}break switch;")
            elif falls[k]:
                self._emit(f"{'    ' * self._indent}goto _cit_sw{sid}_{k + 1};")
            self._indent -= 1
            if last.kind == CursorKind.DEFAULT_STMT:
                self._emit(f"{pad}}};")
            else:
                self._emit(f"{pad}}}")
        if not any(seg['labels'][-1].kind == CursorKind.DEFAULT_STMT
                   or any(l.kind == CursorKind.DEFAULT_STMT for l in seg['labels'])
                   for seg in segs):
            # IDEKA requires every switch to have a default case
            self._emit(f"{pad}default")
            self._emit(f"{pad}{{")
            self._emit(f"{pad}}};")
        self._gt_cur_switch_info = saved_info

    _CAST_MAP = {
        'void': 'void', 'char': 'char', 'signed char': 'i8',
        'unsigned char': 'byte', 'short': 'i16', 'unsigned short': 'u16',
        'int': 'int', 'unsigned int': 'uint', 'unsigned': 'uint',
        'long': 'long', 'unsigned long': 'ulong',
        'long long': 'long', 'unsigned long long': 'ulong',
        'float': 'float', 'double': 'double',
    }
    _CAST_BASES = (('long', 'long'), ('long',), ('short',), ('char',), ('int',),
                   ('float',), ('double',), ('void',))

    @classmethod
    def _cast_at(cls, s, i):
        """If s[i] opens a C cast to a primitive type, `(unsigned long *)`, return
        (end index, IDEKA cast text), else None."""
        n = len(s)
        j = i + 1
        words = []
        while True:
            while j < n and s[j].isspace():
                j += 1
            e = _ident_end(s, j)
            if e == j:
                break
            words.append(s[j:e])
            j = e
        if not words:
            return None
        sign = ''
        if words[0] in ('unsigned', 'signed'):
            sign = words[0]
            words = words[1:]
        if tuple(words) not in cls._CAST_BASES:
            return None
        star = ''
        if j < n and s[j] == '*':
            star = '*'
            j += 1
            while j < n and s[j].isspace():
                j += 1
        if j >= n or s[j] != ')':
            return None
        t = (sign + ' ' if sign else '') + ' '.join(words)
        return j + 1, f"({cls._CAST_MAP.get(t, t)}{star})"

    def _norm(self, s):
        """Normalise a raw C expression string to IDEKA conventions."""
        s = s.replace("->", ".")
        out = []
        i = 0
        n = len(s)
        while i < n:
            c = s[i]
            if c in '"\'':
                j = _skip_quoted(s, i)
                out.append(s[i:j])
                i = j
                continue
            if c.isalpha() or c == '_':
                e = _ident_end(s, i)
                w = s[i:e]
                if i > 0 and (s[i - 1].isdigit()):
                    out.append(w)          # the tail of a number like 10UL
                    i = e
                    continue
                if w == '__acrt_iob_func':
                    # Collapse platform-specific stdio handle expansions to standard names
                    k = e
                    while k < n and s[k].isspace():
                        k += 1
                    if k < n and s[k] == '(':
                        k += 1
                        while k < n and s[k].isspace():
                            k += 1
                        if k < n and s[k] in '012':
                            d = s[k]
                            k += 1
                            while k < n and s[k].isspace():
                                k += 1
                            if k < n and s[k] == ')':
                                out.append({'0': 'stdin', '1': 'stdout', '2': 'stderr'}[d])
                                i = k + 1
                                continue
                if w in ('__stdin', '__stdout', '__stderr'):
                    w = w[2:]
                # `(uint)x`, `(double *)p`: a type written by this tool is not renamed
                before = ''.join(out).rstrip()[-1:]
                after = s[e:].lstrip()[:1]
                if before == '(' and after in (')', '*') and w in (
                        'uint', 'ulong', 'double', 'float', 'long', 'bool', 'byte'):
                    out.append(w)
                else:
                    out.append(_rename(w))
                i = e
                continue
            if c == '~' and not (i > 0 and _wc(s[i - 1])):
                out.append('`!')
                i += 1
                continue
            if c == '(':
                cast = self._cast_at(s, i)
                if cast:
                    out.append(cast[1])
                    i = cast[0]
                    continue
            if c == '0' and s[i + 1:i + 2] in ('x', 'X') and i + 2 < n \
                    and s[i + 2] in '0123456789abcdefABCDEF':
                j = i + 2
                while j < n and s[j] in '0123456789abcdefABCDEF':
                    j += 1
                out.append('0x' + s[i + 2:j].upper())
                i = j
                continue
            out.append(c)
            i += 1
        return _num_suffixes(''.join(out))

    def _src_slice(self, cursor):
        """Return the raw source text for a cursor's extent, or None if
        the extent is not from the main file."""
        ext = cursor.extent
        start_file = ext.start.file
        if not start_file:
            return None
        if os.path.abspath(start_file.name) != os.path.abspath(self.filepath):
            return None
        # A cursor produced by a macro expansion has no tokens of its own and its extent
        # points at the macro definition, so slicing would copy unrelated source text.
        if ext.end.offset <= ext.start.offset or not any(True for _ in cursor.get_tokens()):
            return None
        raw = self._src_bytes[ext.start.offset:ext.end.offset].decode('utf-8', errors='replace').strip()
        # IDEKA uses . for all member access including pointer dereference
        return self._norm(raw)

    def _macro_source_spelling(self, cursor):
        """If the cursor's extent in the source file is a single macro invocation
        (i.e. the raw tokens spell a macro name followed by optional parens),
        return the raw source text. Otherwise return None."""
        tokens = list(cursor.get_tokens())
        if not tokens:
            return None
        first = tokens[0]
        if first.kind != cx.TokenKind.IDENTIFIER:
            return None
        raw = " ".join(t.spelling for t in tokens)
        return raw

    # -----------------------------------------------------------------------
    # Expression emission -- returns a string
    # -----------------------------------------------------------------------

    _MACRO_STMT_TOKS = frozenset(('do', 'if', 'else', 'while', 'for', 'switch', 'return',
                                  'goto', 'break', 'continue', ';', '{', '}'))

    @classmethod
    def _macro_expand_only(cls, body_toks):
        """True for a macro that cannot stay a #def / #psub. #psub is plain text
        substitution, so a body with statements or with the # and ## operators has
        no 1:1 form. Those macros are not emitted; libclang already holds each
        expansion as real AST, so every use site is translated from that AST.
        A ## macro with statements keeps its own path (_emit_codegen_macro)."""
        toks = list(body_toks)
        # an assignment in the body is no use as plain text either: IDEKA bans it
        # inside expressions, and the use site decides where it can go
        has_op = ('#' in toks or '##' in toks
                  or any(t in ('=', '+=', '-=', '*=', '/=', '%=', '&=', '|=', '^=',
                               '<<=', '>>=') for t in toks))
        has_stmt = any(t in cls._MACRO_STMT_TOKS for t in toks)
        # a comma that is not an argument separator is the comma operator: outside every
        # bracket, or directly inside a grouping paren like `(a(), b())`
        stack = []        # True for a call / index bracket, False for a grouping one
        for k, t in enumerate(toks):
            if t in ('(', '['):
                prev = toks[k - 1] if k else ''
                stack.append(bool(prev) and (prev[0].isalnum() or prev[0] == '_'
                                             or prev in (')', ']')) and prev != 'sizeof'
                             or t == '[')
            elif t == '{':
                stack.append(False)
            elif t in (')', ']', '}'):
                if stack:
                    stack.pop()
            elif t == ',' and (not stack or stack[-1] is False):
                has_op = True
                break
        if '##' in toks and has_stmt:
            return False
        return has_op or has_stmt

    @staticmethod
    def _is_system_path(path):
        """True for a file under one of the configured system include roots."""
        roots = [os.path.abspath(r) for r in CFT_CONFIG.include_roots]
        return bool(path) and _best_relative(os.path.abspath(path), roots) is not None

    def _macro_expand_set(self):
        """Names of the macros of this translation unit that are expanded at their use sites."""
        names = getattr(self, '_expand_macros', None)
        if names is not None:
            return names
        names = set()
        # a macro that shares its name with a function or variable would, as a #psub,
        # rewrite that declaration and every call to it: it is expanded instead
        declared = {c.spelling for c in self.tu.cursor.get_children()
                    if c.kind in (CursorKind.FUNCTION_DECL, CursorKind.VAR_DECL,
                                  CursorKind.TYPEDEF_DECL)}
        bodies = {}
        objlike = {}
        fn_macros = set()
        for c in self.tu.cursor.get_children():
            if c.kind != CursorKind.MACRO_DEFINITION:
                continue
            t = list(c.get_tokens())
            if (len(t) > 1 and t[1].spelling == '('
                    and t[0].extent.end.offset == t[1].extent.start.offset):
                fn_macros.add(c.spelling)
        for c in self.tu.cursor.get_children():
            if c.kind != CursorKind.MACRO_DEFINITION:
                continue
            toks = list(c.get_tokens())
            if not toks:
                continue
            i = 1
            function_like = False
            if (len(toks) > 1 and toks[1].spelling == '('
                    and toks[0].extent.end.offset == toks[1].extent.start.offset):
                function_like = True
                while i < len(toks) and toks[i].spelling != ')':
                    i += 1
                i += 1
            body = [t.spelling for t in toks[i:]]
            bodies[c.spelling] = body
            if not function_like:
                objlike[c.spelling] = body
            if self._macro_expand_only(body) or (c.spelling in declared and body):
                names.add(c.spelling)
            elif (not function_like and body
                    and (c.spelling in body
                         or any(b in ('->', '.', '[', 'sizeof', 'long', 'unsigned', 'signed',
                                      'short', 'char', 'double', 'float', 'struct', 'union')
                                for b in body)
                         or any(b in fn_macros for b in body))):
                # An object-like macro that reaches into a variable (`tcc_state->x`) or
                # names itself in its own body. As plain text it would also rewrite the
                # member or declaration that shares its name, so it is expanded instead.
                names.add(c.spelling)
            elif not function_like and len(body) == 1 and body[0] in self._enum_owners():
                # a macro that names a member of a named enum (`#define FIRST TOK_byte`): the
                # member is only reachable through its enum, which the use site's AST knows
                names.add(c.spelling)
            elif (function_like and c.location.file
                    and self._is_system_path(c.location.file.name)):
                # system header macros are never written out: their use sites are
                # translated from the expansion
                names.add(c.spelling)
        # a macro whose body names an expanded macro cannot stay a textual #psub: the
        # name it reaches (`addr_t`) only resolves at the use site
        changed = True
        while changed:
            changed = False
            for name, body in bodies.items():
                if name not in names and any(b in names for b in body):
                    names.add(name)
                    changed = True
        self._expand_macros = names
        self._expand_bodies = {n: objlike[n] for n in names if n in objlike}
        return names

    def _macro_invocation_text(self, cursor):
        """If the cursor's extent lies inside a macro invocation of the main file,
        return that invocation's source text (`AL(size)`, `EOF`), else None.

        libclang gives every node produced by a macro expansion the extent of the
        invocation, with tokens and sub-nodes that are the macro body's. Translating
        those nodes would copy the C macro body, so the invocation itself is kept and
        the macro stays a #def / #psub of its own."""
        ext = cursor.extent
        f = ext.start.file
        if not f or os.path.abspath(f.name) != os.path.abspath(self.filepath):
            return None
        ranges = getattr(self, '_macro_inv_ranges', None)
        if ranges is None:
            ranges = []
            for c in self.tu.cursor.get_children():
                if c.kind == CursorKind.MACRO_INSTANTIATION and self._is_from_main_file(c):
                    ranges.append((c.extent.start.offset, c.extent.end.offset))
            ranges.sort()
            self._macro_inv_ranges = ranges
        s0, e0 = ext.start.offset, ext.end.offset
        for ms, me in ranges:
            if ms > s0:
                break
            if s0 >= ms and e0 <= me and me > ms:
                raw = self._src_bytes[ms:me].decode('utf-8', errors='replace').strip()
                mm = raw[:_ident_end(raw, 0)]
                if mm and mm in self._macro_expand_set():
                    return None
                if mm:
                    self._note_macro_use(mm)
                if mm and raw[len(mm):].lstrip()[:1] == '(':
                    raw = mm + raw[len(mm):].lstrip()    # `NAME (x)`: a #psub call needs `NAME(x)`
                nulls = self.__dict__.setdefault('_null_inv', set())
                if (ms, me) in nulls:
                    return None       # an inner node of an invocation already found to need its AST
                if self._has_arg_null_conv(cursor, ms, me):
                    nulls.add((ms, me))
                    return None       # the expansion's own nodes carry the pointer type of the 0
                return self._c_args_to_idk(self._expand_args(self._norm(raw)))
        return None

    def _expand_args(self, text):
        """The arguments of a macro invocation kept as source text name macros that are expanded
        at their use sites (`dwarf_data4(dwarf_info_section, 0)`): those names are replaced by
        their expansion, as the C preprocessor does before the invocation sees them."""
        self._macro_expand_set()
        bodies = self._expand_bodies
        if not bodies:
            return text
        head = _ident_end(text, 0)
        if head == 0 or text[head:head + 1] != '(':
            return text
        out = [text[:head]]
        i, n = head, len(text)
        while i < n:
            c = text[i]
            if c in '"\'':
                j = i + 1
                while j < n and text[j] != c:
                    j += 2 if text[j] == '\\' else 1
                out.append(text[i:j + 1])
                i = j + 1
            elif c.isalpha() or c == '_':
                e = _ident_end(text, i)
                word = text[i:e]
                prev = text[:i].rstrip()[-1:]
                if word in bodies and prev not in ('.', '>'):
                    exp = ' '.join(bodies[word]).replace(' -> ', '.').replace('->', '.')
                    out.append('(' + exp + ')')
                else:
                    out.append(word)
                i = e
            else:
                out.append(c)
                i += 1
        return ''.join(out)

    def _in_macro_expansion(self, cursor):
        """True when the node comes out of a macro invocation in the main file: its
        tokens are then not a reliable record of the expression."""
        self._macro_invocation_text(cursor)       # fills the range table
        ext = cursor.extent
        f = ext.start.file
        if not f or os.path.abspath(f.name) != os.path.abspath(self.filepath):
            return False
        s0, e0 = ext.start.offset, ext.end.offset
        for ms, me in getattr(self, '_macro_inv_ranges', []):
            if ms > s0:
                break
            if s0 >= ms and e0 <= me and me > ms:
                return True
        return False

    @staticmethod
    def _c_args_to_idk(text):
        """Rewrite the C operators that can sit in the arguments of a macro invocation
        kept as source text: unary & becomes @, && and || become & and |, and
        sizeof(x) becomes (sizeof(x) / 8). String and character literals are untouched."""
        out = []
        i, n = 0, len(text)
        prev = ''          # last significant character written
        while i < n:
            c = text[i]
            if c in '"\'':
                j = i + 1
                while j < n and text[j] != c:
                    j += 2 if text[j] == '\\' else 1
                out.append(text[i:j + 1])
                prev = c
                i = j + 1
                continue
            if text.startswith('&&', i):
                out.append('&'); prev = '&'; i += 2; continue
            if text.startswith('||', i):
                out.append('|'); prev = '|'; i += 2; continue
            if c == '&':
                if prev == '' or prev in '(,=+-*/%<>!&|^~?:[{':
                    out.append('@')
                else:
                    out.append('`&')
                prev = '&'; i += 1; continue
            m = _word_at(text, i, 'sizeof') or (text.startswith('sizeof', i)
                                                 and not _wc(text[i + 6:i + 7] or ' '))
            if m and not (i > 0 and (text[i - 1].isalnum() or text[i - 1] == '_')):
                j = i + 6
                while j < n and text[j] == ' ':
                    j += 1
                if j < n and text[j] == '(':
                    depth, k = 0, j
                    while k < n:
                        if text[k] == '(':
                            depth += 1
                        elif text[k] == ')':
                            depth -= 1
                            if depth == 0:
                                break
                        k += 1
                    out.append('(sizeof' + text[j:k + 1] + ' / 8)')
                    prev = ')'
                    i = k + 1
                    continue
                if j < n and (text[j].isalpha() or text[j] in '_*&-!~'):
                    # sizeof expr without parentheses: prefix operators, a name, then
                    # member access, indexing and calls
                    k = j
                    while k < n and text[k] in '*&-!~ ':
                        k += 1
                    while k < n and (text[k].isalnum() or text[k] == '_'):
                        k += 1
                    while k < n:
                        if text.startswith('->', k):
                            k += 2
                        elif text[k] == '.':
                            k += 1
                        elif text[k] in '([':
                            close = ')' if text[k] == '(' else ']'
                            opn = text[k]
                            depth = 0
                            while k < n:
                                if text[k] == opn:
                                    depth += 1
                                elif text[k] == close:
                                    depth -= 1
                                    if depth == 0:
                                        break
                                k += 1
                            k += 1
                            continue
                        else:
                            break
                        while k < n and (text[k].isalnum() or text[k] == '_'):
                            k += 1
                    operand = text[j:k].strip()
                    out.append('(sizeof(' + CTranslator._c_args_to_idk(operand) + ') / 8)')
                    prev = ')'
                    i = k
                    continue
            out.append(c)
            if not c.isspace():
                prev = c
            i += 1
        return _num_suffixes(''.join(out))

    @staticmethod
    def _is_enum_member_ref(cursor):
        """True when the expression is a bare reference to an enumerator (through the
        implicit casts libclang wraps it in)."""
        c = cursor
        while c.kind in (CursorKind.UNEXPOSED_EXPR, CursorKind.PAREN_EXPR):
            kids = list(c.get_children())
            if len(kids) != 1:
                return False
            c = kids[0]
        return (c.kind == CursorKind.DECL_REF_EXPR and c.referenced is not None
                and c.referenced.kind == CursorKind.ENUM_CONSTANT_DECL)

    @staticmethod
    def _null_literal(cursor):
        """The integer literal 0 that clang converts to a pointer under `cursor`, else None."""
        if cursor.kind != CursorKind.UNEXPOSED_EXPR:
            return None
        if cursor.type.get_canonical().kind != TypeKind.POINTER:
            return None
        c = cursor
        while c.kind in (CursorKind.UNEXPOSED_EXPR, CursorKind.PAREN_EXPR):
            ch = list(c.get_children())
            if len(ch) != 1:
                return None
            c = ch[0]
        if c.kind != CursorKind.INTEGER_LITERAL or c.type.get_canonical().kind == TypeKind.POINTER:
            return None
        if _eval_int(c) != 0:
            return None
        return c

    def _null_pointer_conv(self, cursor):
        """C converts the integer constant 0 to a null pointer where a pointer is expected
        (`get_tok_str(t, 0)`, `p = 0`). Ideka has no such implicit conversion, so the
        conversion clang applied is written out: `(T*)0`."""
        if self._null_literal(cursor) is None:
            return None
        return f"(({self._IDEKA_type(cursor.type, '')})0)"

    def _has_arg_null_conv(self, cursor, ms, me):
        """True when a 0 written in the arguments of the macro invocation [ms, me) is converted
        to a pointer by the expansion. The invocation text cannot say so, the expansion can."""
        for node in cursor.walk_preorder():
            lit = self._null_literal(node)
            if lit is None:
                continue
            toks = list(lit.get_tokens())
            if toks and ms < toks[0].extent.start.offset < me:
                return True
        return False

    def _note_macro_use(self, name):
        """A macro written by name here is #def'd in the file that defines it. When that is
        another translated file (a header C reaches through a conditional include the
        translation did not keep), this file imports it."""
        defs = getattr(self, '_macro_def_files', None)
        if defs is None:
            defs = {}
            for c in self.tu.cursor.get_children():
                if c.kind == CursorKind.MACRO_DEFINITION and c.location.file:
                    defs.setdefault(c.spelling, os.path.abspath(c.location.file.name))
            self._macro_def_files = defs
            self._macro_imports = []
        f = defs.get(name)
        if not f or f == os.path.abspath(self.filepath) or not f.endswith(".h"):
            return
        if any(f.startswith(os.path.abspath(r) + os.sep) for r in CFT_CONFIG.include_roots):
            return                                  # a system header: reached by its own import
        here = os.path.dirname(os.path.abspath(self.filepath))
        imp = _idk_name(os.path.relpath(f, here), here)
        if imp not in self._macro_imports:
            self._macro_imports.append(imp)

    @staticmethod
    def _ptr_truth(operand, text):
        """A pointer used as a truth value (`p && x`) is a not-null test: `p!?`."""
        if operand.type.get_canonical().kind != TypeKind.POINTER:
            return text
        if not text.replace('.', '').replace('_', '').isalnum():
            text = f"({text})"
        return f"{text}!?"

    @staticmethod
    def _is_int_to_float_conv(cursor):
        """True for the implicit conversion C inserts where an integer meets a floating
        operand (`ld != 0`, `d = i`)."""
        if cursor.kind != CursorKind.UNEXPOSED_EXPR:
            return False
        ik = list(cursor.get_children())
        return (len(ik) == 1
                and cursor.type.get_canonical().kind in (TypeKind.FLOAT, TypeKind.DOUBLE,
                                                         TypeKind.LONGDOUBLE)
                and ik[0].type.get_canonical().kind in _INTEGRAL_KINDS)

    def _emit_expr(self, cursor):
        kind = cursor.kind
        np = self._null_pointer_conv(cursor)
        if np is not None:
            return np
        if kind not in (CursorKind.UNEXPOSED_EXPR, CursorKind.UNEXPOSED_STMT):
            inv = self._macro_invocation_text(cursor)
            if inv:
                return inv

        if kind == CursorKind.INTEGER_LITERAL:
            tokens = list(cursor.get_tokens())
            if not tokens:
                # No tokens: the node comes out of a macro expansion. Ask libclang for
                # its value.
                val = _eval_int(cursor)
                if val is not None:
                    return str(val)
                raw = self._src_slice(cursor)
                return raw if raw else "0"
            spelling = tokens[0].spelling
            # If the source token is an identifier (enum constant or macro name), preserve it
            if tokens[0].kind == cx.TokenKind.IDENTIFIER:
                if spelling in self._macro_expand_set():
                    val = _eval_int(cursor)       # a macro that is never written out
                    if val is not None:
                        return str(val)
                self._note_macro_use(spelling)
                return spelling
            # Uppercase hex literals: 0xdeadbeef -> 0xDEADBEEF
            if spelling.lower().startswith("0x"):
                spelling = "0x" + spelling[2:].upper()
            return _num_suffixes(spelling)

        if kind == CursorKind.FLOATING_LITERAL:
            tokens = list(cursor.get_tokens())
            return _num_suffixes(tokens[0].spelling) if tokens else "0.0"

        if kind == CursorKind.STRING_LITERAL:
            return self._string_literal_text(cursor)

        if kind == CursorKind.CHARACTER_LITERAL:
            tokens = list(cursor.get_tokens())
            return tokens[0].spelling if tokens else "'\\0'"

        if kind == CursorKind.DECL_REF_EXPR:
            if cursor.referenced is not None and cursor.referenced.kind == CursorKind.FUNCTION_DECL:
                return "@" + _rename(cursor.spelling)     # a function as a value is its address
            ref = cursor.referenced
            if ref is not None and ref.kind == CursorKind.ENUM_CONSTANT_DECL:
                # the members of a named enum are reached through the enum
                owner = ref.semantic_parent
                ename = (owner.spelling or self._pending_typedefs.get(owner.hash)
                         ) if owner is not None else None
                if ename and '(unnamed' not in ename and '(anonymous' not in ename:
                    return f"{ename}.{_rename(cursor.spelling)}"
            return _rename(cursor.spelling)

        if kind == CursorKind.MEMBER_REF_EXPR:
            children = list(cursor.get_children())
            base = self._emit_expr(children[0]) if children else "?"
            # C11 anonymous members: `v.c` reaches `c` through the unnamed union that
            # holds it. Each unnamed record is a member named where it is declared.
            ref = cursor.referenced
            chain = self._anon_chain(ref.semantic_parent) if ref is not None else []
            if children and chain:
                last = self._anon_step_of(children[0])
                if last in chain:
                    chain = chain[chain.index(last) + 1:]     # the base already went that far
            for step in chain:
                base = f"{base}.{step}"
            am = _anon_loc(cursor.spelling)
            if am:
                return f"{base}._am_{am[0]}_{am[1]}"
            return f"{base}.{_rename(cursor.spelling)}"

        if kind == CursorKind.CALL_EXPR:
            # Platform stdio handle expanders: __acrt_iob_func(N) etc.
            # Their entire extent maps back to the original macro name in source.
            _STDIO_EXPANDERS = ('__acrt_iob_func', '__iob_func')
            if cursor.spelling in _STDIO_EXPANDERS:
                raw = self._src_slice(cursor)
                if raw and raw.isidentifier():
                    return raw
            children = list(cursor.get_children())
            if not children:
                return f"{cursor.spelling}()"
            callee = self._strip_wrappers(children[0])
            while True:
                # `(setup(), fn)(args)`: the left side runs first, as a statement
                cn = self._comma_node(callee)
                if cn is None or getattr(self, '_hoist_pending', None) is None \
                        or self._hoist_shortcircuit > 0:
                    break
                ck = list(cn.get_children())
                self._hoist_pending.append(f"{self._emit_expr(ck[0])};")
                callee = self._strip_wrappers(ck[1])
            direct = (callee.kind == CursorKind.DECL_REF_EXPR and callee.referenced is not None
                      and callee.referenced.kind == CursorKind.FUNCTION_DECL)
            proto = None
            target = callee
            if not direct:
                if (callee.kind == CursorKind.UNARY_OPERATOR and list(callee.get_children())
                        and (_api_unop(callee) or ("?",))[0] == "*"):
                    target = self._strip_wrappers(list(callee.get_children())[0])
                t = target.type.get_canonical()
                if t.kind == TypeKind.POINTER:
                    t = t.get_pointee().get_canonical()
                if t.kind in (TypeKind.FUNCTIONPROTO, TypeKind.FUNCTIONNOPROTO):
                    proto = t
            if direct:
                fn = _rename(callee.spelling)
            else:
                fn = self._emit_expr(target)
            args = [self._emit_expr(c) for c in children[1:]]
            if (proto is not None and proto.kind == TypeKind.FUNCTIONPROTO
                    and proto.is_function_variadic()):
                proto = None      # no typed pointer form for a variadic signature
            if proto is not None and getattr(self, '_hoist_pending', None) is not None:
                if self._hoist_shortcircuit > 0:
                    # evaluating the pointer early could run ahead of a guard (`p && p->f()`)
                    self._hoist_blocked = True
                else:
                    self._fp_call_n = getattr(self, '_fp_call_n', 0) + 1
                    tmp = f"_fpc{self._fp_call_n}"
                    self._hoist_pending.append(
                        f"cdecl{{}}* {tmp}{self._fp_signature(proto)} = {fn};")
                    fn = tmp
            result = f"{fn}({', '.join(args)})"
            return self._norm(result)

        if kind == CursorKind.UNARY_OPERATOR:
            children = list(cursor.get_children())
            operand = self._emit_expr(children[0]) if children else "?"
            tokens = list(cursor.get_tokens())
            # The operator token is the one outside the operand's extent: before it for a
            # prefix operator, after it for a postfix ++ / --.
            op = "?"
            postfix = False
            api = _api_unop(cursor)
            if api:
                op, postfix = api
            elif tokens and children:
                op_start = children[0].extent.start.offset
                op_end = children[0].extent.end.offset
                if tokens[0].extent.start.offset < op_start:
                    op = tokens[0].spelling
                elif tokens[-1].extent.start.offset >= op_end:
                    op = tokens[-1].spelling
                    postfix = op in ("++", "--")
            elif tokens:
                op = tokens[0].spelling
            if op in ("__extension__", "extension"):
                return operand          # GNU marker, no effect on the value
            if op == "*":
                return f"*{operand}"
            if op == "&":
                return f"@{operand}"
            if op == "!":
                # `!!` is a different token in IDEKA (no-mangle), so nest with parentheses
                return f"!({operand})" if operand.startswith("!") else f"!{operand}"
            if op == "-":
                return f"-({operand})" if operand.startswith("-") else f"-{operand}"
            if op == "~":
                return f"`!{operand}"
            if postfix:
                return f"{operand}{op}"
            return f"{op}{operand}"

        _CAST_KINDS = (CursorKind.CSTYLE_CAST_EXPR,)
        _AST_PREFERRED = (CursorKind.CSTYLE_CAST_EXPR, CursorKind.BINARY_OPERATOR,
                          CursorKind.CXX_UNARY_EXPR, CursorKind.PAREN_EXPR,
                          CursorKind.UNARY_OPERATOR)

        def _rhs_expr(rhs_cursor):
            """Emit RHS, using AST path for casts and sizeof-containing exprs."""
            c = rhs_cursor
            if self._null_pointer_conv(rhs_cursor) is not None:
                return self._emit_expr(rhs_cursor)
            if self._is_int_to_float_conv(rhs_cursor):
                return self._emit_expr(rhs_cursor)
            # Unwrap UNEXPOSED_EXPR wrapper
            while c.kind in (CursorKind.UNEXPOSED_EXPR, CursorKind.UNEXPOSED_STMT):
                ch = list(c.get_children())
                if ch:
                    c = ch[0]
                else:
                    break
            if c.kind in _AST_PREFERRED:
                return self._emit_expr(rhs_cursor)
            if self._in_macro_expansion(rhs_cursor):
                return self._emit_expr(rhs_cursor)     # its source text is the invocation
            if c.kind == CursorKind.DECL_REF_EXPR and c.referenced is not None \
                    and c.referenced.kind == CursorKind.ENUM_CONSTANT_DECL:
                return self._emit_expr(rhs_cursor)     # a named enum's member is qualified
            raw_rhs = self._src_slice(rhs_cursor)
            # Raw C text only for a bare name or literal. Anything bigger holds C
            # operators (&, ->, casts, sizeof in bytes) that only the AST path translates.
            if _is_bare_operand(raw_rhs):
                if raw_rhs.isidentifier():
                    self._note_macro_use(raw_rhs)
                return raw_rhs
            return self._emit_expr(rhs_cursor)

        if kind == CursorKind.BINARY_OPERATOR:
            children = list(cursor.get_children())
            n_before = len(self._hoist_pending) if getattr(self, '_hoist_pending', None) is not None else 0
            lhs = self._emit_expr(children[0]) if len(children) > 0 else "?"
            lhs_hoisted = (getattr(self, '_hoist_pending', None) is not None
                           and len(self._hoist_pending) > n_before)
            n_mid = len(self._hoist_pending) if getattr(self, '_hoist_pending', None) is not None else 0
            rhs_cursor = children[1] if len(children) > 1 else None
            rhs = _rhs_expr(rhs_cursor) if rhs_cursor is not None else "?"
            c_op = self._extract_binary_op(cursor, children)
            IDEKA_op = _BINOP_MAP.get(c_op, c_op)
            if c_op in ("&&", "||"):
                lhs = self._ptr_truth(children[0], lhs)
                rhs = self._ptr_truth(rhs_cursor, rhs) if rhs_cursor is not None else rhs
            if getattr(self, '_hoist_pending', None) is not None:
                if c_op == ",":
                    # `a, b` as a condition: a runs as a statement first, b is the test
                    if self._hoist_shortcircuit == 0:
                        l0 = self._strip_wrappers(children[0])
                        lhs_is_assign = (l0.kind == CursorKind.BINARY_OPERATOR
                                         and self._extract_binary_op(l0, list(l0.get_children())) == "=")
                        if not (lhs_hoisted and lhs_is_assign):
                            self._hoist_pending.insert(n_mid, f"{lhs};")
                        return rhs
                    self._hoist_blocked = True
                if c_op in ("&&", "||"):
                    # the right side only runs conditionally: never hoist out of it
                    self._hoist_shortcircuit += 1
                    rhs = _rhs_expr(rhs_cursor) if rhs_cursor is not None else "?"
                    self._hoist_shortcircuit -= 1
                    rhs = self._ptr_truth(rhs_cursor, rhs) if rhs_cursor is not None else rhs
                    return f"{lhs} {IDEKA_op} {rhs}"
                if c_op == "=" and self._hoist_shortcircuit == 0:
                    self._hoist_pending.append(f"{lhs} = {rhs};")
                    return lhs
                if c_op == "=":
                    # an assignment under the right of && / || or in a ?: arm: the
                    # caller rebuilds the whole condition as guarded statements
                    self._hoist_blocked = True
            return f"{lhs} {IDEKA_op} {rhs}"

        if kind == CursorKind.COMPOUND_ASSIGNMENT_OPERATOR:
            children = list(cursor.get_children())
            lhs = self._emit_expr(children[0]) if len(children) > 0 else "?"
            rhs_cursor = children[1] if len(children) > 1 else None
            rhs = _rhs_expr(rhs_cursor) if rhs_cursor is not None else "?"
            c_op = self._extract_binary_op(cursor, children)
            IDEKA_op = _BINOP_MAP.get(c_op, c_op)
            if getattr(self, '_hoist_pending', None) is not None:
                # `x &= 15` inside a condition: a statement ahead of the test, or (under
                # the right side of && / ||) a guarded step built by _cond_structured
                if self._hoist_shortcircuit == 0:
                    self._hoist_pending.append(f"{lhs} {IDEKA_op} {rhs};")
                    return lhs
                self._hoist_blocked = True
            return f"{lhs} {IDEKA_op} {rhs}"

        if kind == CursorKind.CONDITIONAL_OPERATOR:
            children = list(cursor.get_children())
            cond = self._emit_expr(children[0])
            # the arms run conditionally: an assignment in one cannot be hoisted
            if getattr(self, '_hoist_pending', None) is not None:
                self._hoist_shortcircuit += 1
            try:
                then = self._emit_expr(children[1])
                else_ = self._emit_expr(children[2])
            finally:
                if getattr(self, '_hoist_pending', None) is not None:
                    self._hoist_shortcircuit -= 1
            return f"{cond} ? {then} : {else_}"

        if kind == CursorKind.CSTYLE_CAST_EXPR:
            children = list(cursor.get_children())
            ftype = self._IDEKA_type(cursor.type, "")
            operand = self._emit_expr(children[-1]) if children else "?"
            return f"({ftype}){operand}"

        if kind == CursorKind.ARRAY_SUBSCRIPT_EXPR:
            children = list(cursor.get_children())
            base = self._emit_expr(children[0])
            idx = self._emit_expr(children[1])
            return f"{base}[{idx}]"

        if kind == CursorKind.PAREN_EXPR:
            children = list(cursor.get_children())
            before = len(self._hoist_pending) if getattr(self, '_hoist_pending', None) is not None else 0
            inner = self._emit_expr(children[0]) if children else "?"
            if (getattr(self, '_hoist_pending', None) is not None
                    and len(self._hoist_pending) > before and inner.isidentifier()):
                return inner  # (x = f()) hoisted: drop the now pointless parens
            return f"({inner})"

        if kind == CursorKind.INIT_LIST_EXPR:
            children = list(cursor.get_children())
            parts = [self._emit_expr(c) for c in children]
            # a string macro is a `byte*` global in IDEKA; a char array member takes the
            # literal itself
            ctype = cursor.type.get_canonical()
            if ctype.kind == TypeKind.RECORD:
                fields = list(ctype.get_fields())
                for k, ch in enumerate(children):
                    if k >= len(fields) or fields[k].type.get_canonical().kind != TypeKind.CONSTANTARRAY:
                        continue
                    lit = ch
                    while lit.kind in (CursorKind.UNEXPOSED_EXPR, CursorKind.PAREN_EXPR):
                        lk = list(lit.get_children())
                        if len(lk) != 1:
                            break
                        lit = lk[0]
                    if lit.kind == CursorKind.STRING_LITERAL and lit.spelling:
                        parts[k] = lit.spelling
            if cursor.type.get_canonical().kind in (TypeKind.CONSTANTARRAY, TypeKind.INCOMPLETEARRAY):
                return "[" + ", ".join(parts) + "]"       # an array literal
            return "{" + ", ".join(parts) + "}"

        if kind == CursorKind.NULL_STMT:
            return ""

        if kind in (CursorKind.UNEXPOSED_EXPR, CursorKind.UNEXPOSED_STMT):
            # An implicit integer to floating conversion (`ld != 0`, `d = i`): C converts
            # the operand, so the translation says so with an explicit cast
            if self._is_int_to_float_conv(cursor):
                return f"({self._IDEKA_type(cursor.type, '')}){self._emit_expr(list(cursor.get_children())[0])}"
            # Try raw source slice first -- preserves macro names like stderr/stdout/stdin
            # before they get expanded to platform internals
            raw = self._src_slice(cursor)
            if (raw and raw.isidentifier() and raw not in self._macro_expand_set()
                    and not self._is_enum_member_ref(cursor)):
                fc = cursor
                while fc.kind in (CursorKind.UNEXPOSED_EXPR, CursorKind.PAREN_EXPR):
                    fk = list(fc.get_children())
                    if len(fk) != 1:
                        break
                    fc = fk[0]
                if (fc.kind == CursorKind.DECL_REF_EXPR and fc.referenced is not None
                        and fc.referenced.kind == CursorKind.FUNCTION_DECL):
                    return "@" + _rename(raw)         # a function as a value is its address
                self._note_macro_use(raw)
                return raw
            children = list(cursor.get_children())
            if (len(children) == 2 and children[0].kind == CursorKind.TYPE_REF
                    and children[1].kind == CursorKind.MEMBER_REF):
                # offsetof(type, member): IDEKA has none, libclang knows the C layout
                val = _eval_int(cursor)
                if val is not None:
                    return str(val)
            if children:
                return self._norm(self._emit_expr(children[0]))
            if cursor.spelling:
                return cursor.spelling
            tokens = list(cursor.get_tokens())
            if tokens:
                return self._norm(" ".join(t.spelling for t in tokens))
            return "?"

        if kind == CursorKind.ADDR_LABEL_EXPR:
            return f"@{cursor.spelling}"

        if kind == CursorKind.CXX_UNARY_EXPR:
            if self._in_macro_expansion(cursor):
                # sizeof written by a macro: take the value clang computed
                v = _eval_int(cursor)
                if v is not None:
                    return str(v)
            tokens = list(cursor.get_tokens())
            # IDEKA sizeof returns bits, C sizeof returns bytes: divide by 8 so the
            # result is the same byte count C computes (cstruct keeps C layout, so the
            # sizes agree).
            if tokens and tokens[0].spelling == "sizeof":
                self._macro_expand_set()
                bodies = self._expand_bodies
                rest = []
                for k, t in enumerate(tokens[1:], 1):
                    if (t.spelling in bodies and tokens[k - 1].spelling not in ('.', '->')):
                        # a macro that is expanded at its use sites: its expansion, as for any expression
                        rest.extend("." if b == "->" else b for b in bodies[t.spelling])
                    else:
                        rest.append("." if t.spelling == "->" else t.spelling)
                inner = ""
                for tk in rest:
                    if inner and (inner[-1].isalnum() or inner[-1] == "_") \
                            and (tk[0].isalnum() or tk[0] == "_"):
                        inner += " "
                    inner += tk
                # sizeof(struct T) / sizeof(unsigned char *): a C type spelled out
                kids = list(cursor.get_children())
                one = inner.strip()
                if one.startswith("(") and one.endswith(")"):
                    one = one[1:-1].strip()
                bare = [t.spelling for t in tokens[1:] if t.spelling not in ('(', ')')]
                if (len(kids) == 1 and kids[0].kind == CursorKind.TYPE_REF
                        and (len(bare) == 1
                             or any(t.spelling in self._macro_expand_set() for t in tokens[1:]))):
                    # sizeof(addr_t) where addr_t is a macro that names a type: the type
                    # clang resolved it to
                    return f"(sizeof({self._IDEKA_type(kids[0].type, '')}) / 8)"
                tm = self._sizeof_type_text(inner)
                if tm:
                    return f"(sizeof({self._c_type_str_to_IDEKA(tm)}) / 8)"
                # sizeof x  ->  sizeof(x);  sizeof(x) keeps its parentheses
                if not (inner.startswith("(") and inner.endswith(")")
                        and self._parens_wrap_all(inner)):
                    inner = f"({inner})"
                return f"(sizeof{inner} / 8)"
            return " ".join(t.spelling for t in tokens)

        # Fallback: reconstruct from tokens
        tokens = list(cursor.get_tokens())
        if tokens:
            return self._norm(" ".join(t.spelling for t in tokens))
        return f"/* untranslated expr: {kind.name} */"

    # -----------------------------------------------------------------------
    # Type conversion
    # -----------------------------------------------------------------------

    def _IDEKA_type(self, ctype, hint=""):
        kind = ctype.kind

        # _Alignas / aligned types: only applies to scalar integer types
        _SCALAR_KINDS = (TypeKind.CHAR_U, TypeKind.UCHAR, TypeKind.CHAR_S, TypeKind.SCHAR,
                         TypeKind.SHORT, TypeKind.USHORT, TypeKind.INT, TypeKind.UINT,
                         TypeKind.LONG, TypeKind.ULONG, TypeKind.LONGLONG, TypeKind.ULONGLONG)
        if kind in _SCALAR_KINDS:
            align = ctype.get_align()
            natural = self._natural_align(ctype)
            if align > 0 and natural > 0 and align != natural:
                bits = ctype.get_size() * 8
                signed_kinds = (TypeKind.CHAR_S, TypeKind.SCHAR, TypeKind.SHORT,
                                TypeKind.INT, TypeKind.LONG, TypeKind.LONGLONG)
                sign = "signed " if kind in signed_kinds else ""
                return f"{sign}data{{{bits}}}"

        if kind == TypeKind.POINTER:
            pointee = ctype.get_pointee()
            pcanon = pointee.get_canonical()
            if pcanon.kind in (TypeKind.FUNCTIONPROTO, TypeKind.FUNCTIONNOPROTO):
                return self._IDEKA_funcptr_type(pcanon)
            inner = self._IDEKA_type(pointee, "")
            return f"{inner}*"

        if kind == TypeKind.CONSTANTARRAY:
            # `char m[12][4]` is twelve arrays of four: Ideka lists the dimensions in the
            # same order, outermost first
            dims = [ctype.element_count]
            inner = ctype.element_type
            while inner.kind == TypeKind.CONSTANTARRAY:
                dims.append(inner.element_count)
                inner = inner.element_type
            return self._IDEKA_type(inner, "") + "".join(f"[{d}]" for d in dims)

        if kind == TypeKind.INCOMPLETEARRAY:
            elem = self._IDEKA_type(ctype.element_type, "")
            return f"{elem}*"

        if kind == TypeKind.RECORD:
            decl = ctype.get_declaration()
            name = self._struct_name(decl)
            if name == "__va_list_tag":
                self._need_va_tag = True       # clang's own record: it has no source to translate
            return name or "void*"

        if kind == TypeKind.ENUM:
            decl = ctype.get_declaration()
            return decl.spelling or "uint"

        if kind in (TypeKind.ELABORATED, TypeKind.TYPEDEF):
            spelling = ctype.spelling
            base = spelling.replace("const ", "").replace("volatile ", "").replace("struct ", "").strip()
            if base in _TYPEDEF_MAP:
                return _TYPEDEF_MAP[base]
            canon = ctype.get_canonical()
            if canon.kind != kind:
                return self._IDEKA_type(canon, hint)
            return base or "void*"

        if kind == TypeKind.VOID:
            return "void"

        if kind == TypeKind.INT128:
            self._need_i128 = True
            return "__int128_t"

        if kind == TypeKind.UINT128:
            self._need_u128 = True
            return "__uint128_t"

        if kind in _TYPEKIND_MAP:
            return _TYPEKIND_MAP[kind]

        if kind == TypeKind.UNEXPOSED:
            canon = ctype.get_canonical()
            if canon.kind != TypeKind.UNEXPOSED:
                return self._IDEKA_type(canon, hint)

        return f"void* /* untranslated: {ctype.spelling} */"

    def _natural_align(self, ctype):
        """Return the natural alignment in bytes for a type, or 0 if unknown."""
        try:
            kind = ctype.get_canonical().kind
            size = ctype.get_size()
            if size > 0:
                return min(size, 8)
        except Exception:
            pass
        return 0

    def _fp_signature(self, proto):
        """`(params) -> ret` for a C function type."""
        ret = self._IDEKA_type(proto.get_result(), "")
        params = []
        if proto.kind == TypeKind.FUNCTIONPROTO:
            for arg_type in proto.argument_types():
                params.append(self._IDEKA_type(arg_type, ""))
            if proto.is_function_variadic():
                params.append("...")
        return f"({', '.join(params)}) -> {ret}"

    def _param_type(self, ctype, hint=""):
        """A parameter declared as an array (`va_list ap`, `int a[4]`) is a pointer in C."""
        canon = ctype.get_canonical()
        if canon.kind in (TypeKind.CONSTANTARRAY, TypeKind.INCOMPLETEARRAY):
            return f"{self._IDEKA_type(canon.element_type, '')}*"
        return self._IDEKA_type(ctype, hint)

    def _IDEKA_funcptr_type(self, proto):
        # Ideka has no function pointer type name: a `def{}*` declares a variable. As a
        # parameter, field, return or typedef a function pointer travels as `void*`, and
        # a call through it goes through a typed local (see CALL_EXPR).
        return "void*"

    # -----------------------------------------------------------------------
    # Helpers
    # -----------------------------------------------------------------------

    def _extract_binary_op(self, cursor, children):
        """Find the binary operator token by locating the token that falls
        between the end of the lhs extent and the start of the rhs extent."""
        if len(children) < 2:
            return "?"
        api = _api_binop(cursor)
        if api:
            return api
        lhs_end = children[0].extent.end.offset
        rhs_start = children[1].extent.start.offset
        for tok in cursor.get_tokens():
            off = tok.extent.start.offset
            if lhs_end <= off < rhs_start:
                return tok.spelling
        # An operand that is a macro invocation makes libclang's token list useless:
        # the operator is whatever source text lies between the operands.
        between = self._src_bytes[lhs_end:rhs_start].decode('utf-8', errors='replace')
        run = ''
        last = ''
        for ch in between:
            if ch in '-+*/%&|^<>=!,':
                run += ch
            elif run:
                last, run = run, ''
        last = run or last
        return last if last else "?"

    @staticmethod
    def _sizeof_type_text(inner):
        """For `( struct T * )` style text, the type inside the parentheses; else None.
        It must open with a type keyword and hold only words, spaces and stars."""
        t = inner.strip()
        if not (t.startswith('(') and t.endswith(')')):
            return None
        body = t[1:-1].strip()
        words = _words(body)
        if not words or words[0] not in ('struct', 'union', 'enum', 'const', 'volatile',
                                         'unsigned', 'signed', 'long', 'short', 'char',
                                         'int', 'float', 'double', 'void'):
            return None
        if not all(_wc(c) or c.isspace() or c == '*' for c in body):
            return None
        return body

    def _get_field_align(self, field_cursor):
        """Return the _Alignas value in bytes if present, else None."""
        for child in field_cursor.get_children():
            if child.kind == CursorKind.ALIGNED_ATTR:
                tokens = list(field_cursor.get_tokens())
                # Tokens look like: _Alignas ( 16 ) <type> <name>
                for i, t in enumerate(tokens):
                    if t.spelling == "_Alignas" and i + 2 < len(tokens):
                        try:
                            return int(tokens[i + 2].spelling)
                        except ValueError:
                            pass
        return None

    @staticmethod
    def _is_anon_decl(decl):
        """True for a record with no name of its own. Recent libclang spells such a record
        `struct (unnamed at file:line:col)` rather than leaving the spelling empty."""
        sp = decl.spelling
        return (not sp) or "(unnamed" in sp or "(anonymous" in sp

    def _ordinary_names(self):
        """Functions and variables of the unit. C keeps them apart from struct tags
        (`int sigaction(..)` and `struct sigaction` coexist); Ideka has one namespace."""
        names = getattr(self, '_ordinary_cache', None)
        if names is None:
            names = {c.spelling for c in self.tu.cursor.get_children()
                     if c.kind in (CursorKind.FUNCTION_DECL, CursorKind.VAR_DECL)}
            self._ordinary_cache = names
        return names

    def _struct_name(self, cursor):
        if cursor.spelling and not self._is_anon_decl(cursor):
            if cursor.spelling in self._ordinary_names():
                return "struct_" + cursor.spelling
            return cursor.spelling
        return self._pending_typedefs.get(cursor.hash)

    def _collect_typedef_names(self, root):
        for cursor in root.get_children():
            if cursor.kind == CursorKind.TYPEDEF_DECL:
                underlying = cursor.underlying_typedef_type.get_canonical()
                if underlying.kind == TypeKind.RECORD:
                    decl = underlying.get_declaration()
                    if decl and self._is_anon_decl(decl):
                        self._pending_typedefs[decl.hash] = cursor.spelling

    def _is_from_main_file(self, cursor):
        loc = cursor.location
        if not loc or not loc.file:
            return False
        return os.path.abspath(loc.file.name) == os.path.abspath(self.filepath)

    # -----------------------------------------------------------------------
    # Include walking
    # -----------------------------------------------------------------------

    def translate_includes(self, already_translated=None, clang_args=None,
                           local_root=None, local_out=None):
        """Walk all headers included (transitively) by this TU and emit each
        as a .idk file under CFT_CONFIG.cstdlib_root, mirroring the relative
        path from whichever include root the file belongs to.

        already_translated: set of abs paths already written this session.
            Modified in-place so recursive calls skip duplicates.

        Returns the set of abs paths that were written.
        """
        if local_root is not None:
            local_root = os.path.abspath(local_root)
        if CFT_CONFIG.cstdlib_root is None and local_root is None:
            print("cit: include walking skipped -- cstdlib.output_root not set in cit.cfg",
                  file=sys.stderr)
            return set()

        if already_translated is None:
            already_translated = set()

        written = set()
        main_abs = os.path.abspath(self.filepath)

        # Collect unique included file paths from the TU (depth-first order).
        seen_includes = []
        seen_set = set()
        for inc in self.tu.get_includes():
            if not inc.include:
                continue
            inc_abs = os.path.abspath(inc.include.name)
            if inc_abs == main_abs:
                continue
            if inc_abs in seen_set:
                continue
            seen_set.add(inc_abs)
            seen_includes.append(inc_abs)

        # Determine which include roots to use for relative-path mirroring.
        # Priority: explicitly configured roots first, then roots inferred from
        # the actual paths of included files (longest matching prefix wins).
        configured_roots = [os.path.abspath(r) for r in CFT_CONFIG.include_roots]

        for inc_abs in seen_includes:
            if inc_abs in already_translated:
                self._note_out_path(inc_abs, local_root, local_out, configured_roots)
                continue

            # The source tree being translated is itself an include root: its
            # headers mirror into local_out. Otherwise use the configured roots.
            out_base = None
            rel_path = None
            if local_root is not None:
                rel_path = _best_relative(inc_abs, [local_root])
                if rel_path is not None:
                    out_base = local_out if local_out else local_root
            if rel_path is None and CFT_CONFIG.cstdlib_root is not None:
                rel_path = _best_relative(inc_abs, configured_roots)
                out_base = CFT_CONFIG.cstdlib_root
            if rel_path is None:
                print(f"cit: include skipped, outside the source tree and all "
                      f"configured roots: {inc_abs}", file=sys.stderr)
                continue

            # Build the output path: out_base / relative / path.idk
            out_name = _idk_name(os.path.basename(inc_abs), os.path.dirname(inc_abs))
            out_path = os.path.join(out_base, os.path.dirname(rel_path), out_name)
            out_dir = os.path.dirname(out_path)
            os.makedirs(out_dir, exist_ok=True)
            CTranslator._out_paths[inc_abs] = out_path

            already_translated.add(inc_abs)

            try:
                t = CTranslator(inc_abs, args=clang_args, tu=self.tu)
                content = t.translate()
                with open(out_path, "w", encoding="utf-8") as f:
                    f.write(content)
                print(f"cit: include -> {out_path}", file=sys.stderr)
                written.add(inc_abs)

                # Recurse: translate includes pulled in by this header too.
                sub = t.translate_includes(already_translated=already_translated,
                                           clang_args=clang_args,
                                           local_root=local_root,
                                           local_out=local_out)
                written |= sub
            except Exception as exc:
                print(f"cit: error translating include {inc_abs}: {type(exc).__name__}: {exc}",
                      file=sys.stderr)
                import traceback
                traceback.print_exc(file=sys.stderr)

        return written

    def _note_out_path(self, inc_abs, local_root, local_out, configured_roots):
        """Remember where an include already translated by an earlier unit was written."""
        if inc_abs in CTranslator._out_paths:
            return
        out_base = None
        rel_path = None
        if local_root is not None:
            rel_path = _best_relative(inc_abs, [local_root])
            if rel_path is not None:
                out_base = local_out if local_out else local_root
        if rel_path is None and CFT_CONFIG.cstdlib_root is not None:
            rel_path = _best_relative(inc_abs, configured_roots)
            out_base = CFT_CONFIG.cstdlib_root
        if rel_path is None:
            return
        out_name = _idk_name(os.path.basename(inc_abs), os.path.dirname(inc_abs))
        CTranslator._out_paths[inc_abs] = os.path.join(out_base, os.path.dirname(rel_path), out_name)

    @staticmethod
    def flush_part2(clang_args=None):
        """Write the second part of every file an #include took twice, for each file that
        some #import now names."""
        for target, tu in list(CTranslator._wanted_part2.items()):
            out_path = CTranslator._out_paths.get(target)
            if out_path is None:
                print(f"cit: no output path for the second part of {target}", file=sys.stderr)
                continue
            p1 = CTranslator(target, args=clang_args, tu=tu)
            p1._part = 1
            out2 = out_path[:-4] + PART2_SUFFIX + out_path[-4:]
            with open(out2, "w", encoding="utf-8") as f:
                f.write(p1.translate())
            print(f"cit: include -> {out2}", file=sys.stderr)
            del CTranslator._wanted_part2[target]

    def _emit(self, line):
        if line.startswith("#def "):
            parts = line.split()
            if len(parts) > 1:
                self._defd.add(parts[1].rstrip(";"))
        self.lines.append(line)


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def translate_file(input_path, clang_args=None, walk_includes=True,
                   already_translated=None, local_root=None, local_out=None):
    """Translate a single C file to a IDEKA string.

    If walk_includes is True and CFT_CONFIG.cstdlib_root is set, each header
    included by the file is also translated and written to the cstdlib output
    tree, mirroring the include-root-relative path.

    already_translated: shared set passed across recursive calls to avoid
        re-translating the same header multiple times in one session.
    """
    t = CTranslator(input_path, args=clang_args)
    result = t.translate()
    if walk_includes:
        t.translate_includes(already_translated=already_translated,
                             clang_args=clang_args,
                             local_root=local_root, local_out=local_out)
    return result


def translate_pair(c_path, h_path, out_path, clang_args=None,
                   already_translated=None, local_root=None, local_out=None):
    """Translate a .c/.h pair (either may be None) into a single .idk file."""
    # If both exist, translate .c (which will pull in the .h via includes naturally)
    # and also translate the .h separately, merging unique declarations.
    # Simplest correct approach: translate whichever files exist and concatenate,
    # letting _emitted_types dedup across both by sharing a single CTranslator instance
    # with multiple parse passes -- but libclang parses one TU at a time.
    # Instead: translate .c if present (it includes the .h), else translate .h alone.
    # If only .h exists, translate it directly.
    # A source an earlier unit already took through #include (x86_64-gen.c) has its
    # output written that way; its own unit would overwrite the two-part split
    if (c_path and not h_path and already_translated is not None
            and os.path.abspath(c_path) in already_translated):
        print(f"cit: {c_path} already written as an include", file=sys.stderr)
        return

    if c_path and os.path.isfile(c_path):
        primary = c_path
    else:
        primary = h_path

    result = translate_file(primary, clang_args=clang_args,
                            already_translated=already_translated,
                            local_root=local_root, local_out=local_out)
    # A header nothing included still needs its own file
    if (c_path and h_path and os.path.isfile(h_path) and already_translated is not None
            and os.path.abspath(h_path) not in already_translated):
        h_out = os.path.join(os.path.dirname(out_path), _idk_name(os.path.basename(h_path)))
        with open(h_out, "w", encoding="utf-8") as f:
            f.write(translate_file(h_path, clang_args=clang_args,
                                   already_translated=already_translated,
                                   local_root=local_root, local_out=local_out))
        already_translated.add(os.path.abspath(h_path))
        print(f"cit: wrote {h_out}", file=sys.stderr)

    with open(out_path, "w", encoding="utf-8") as f:
        f.write(result)
    print(f"cit: wrote {out_path}", file=sys.stderr)


def translate_directory(dir_path, out_dir=None, clang_args=None):
    """
    Walk a directory, pairing .c and .h files by stem, and emit one .idk per pair.
    If out_dir is None, .idk files are written alongside the source files.
    Includes encountered across all pairs are deduplicated via a shared set.
    """
    if out_dir and not os.path.isdir(out_dir):
        os.makedirs(out_dir)

    # Collect all .c and .h files, grouped by stem
    stems = {}
    for fname in os.listdir(dir_path):
        base, ext = os.path.splitext(fname)
        if ext.lower() == ".c":
            stems.setdefault(base, {})["c"] = os.path.join(dir_path, fname)
        elif ext.lower() == ".h":
            stems.setdefault(base, {})["h"] = os.path.join(dir_path, fname)

    if not stems:
        print(f"cit: no .c or .h files found in {dir_path}", file=sys.stderr)
        return

    # Share one already_translated set so headers included by multiple source
    # files are only emitted once.
    already_translated = set()

    for stem, files in sorted(stems.items()):
        c_path = files.get("c")
        h_path = files.get("h")
        out_name = _idk_name(os.path.basename(c_path or h_path), dir_path)
        out_path = os.path.join(out_dir if out_dir else dir_path, out_name)
        try:
            translate_pair(c_path, h_path, out_path, clang_args=clang_args,
                           already_translated=already_translated,
                           local_root=dir_path,
                           local_out=out_dir if out_dir else dir_path)
        except Exception as e:
            print(f"cit: error translating {stem}: {type(e).__name__}: {e}", file=sys.stderr)
            import traceback
            traceback.print_exc(file=sys.stderr)

    CTranslator.flush_part2(clang_args=clang_args)


def _clang_args_with_include(input_path):
    """Return clang args with -I flags prepended for the input path's parent
    and its parent (to cover both 'llvm-c/foo.h' and sibling includes).
    Starts from the configured default args so any user-set flags are preserved."""
    base_args = list(CFT_CONFIG.default_clang_args)
    # Collect candidate include roots from the input path itself.
    abs_input = os.path.abspath(input_path)
    dirs_to_add = []
    if os.path.isdir(abs_input):
        # Directory mode: add the directory itself and its parent.
        dirs_to_add = [abs_input, os.path.dirname(abs_input)]
    else:
        # File mode: add the file's directory and its parent.
        file_dir = os.path.dirname(abs_input)
        dirs_to_add = [file_dir, os.path.dirname(file_dir)]
    # Also add any configured include_roots.
    for root in CFT_CONFIG.include_roots:
        dirs_to_add.append(os.path.abspath(root))
    # Prepend unique -I flags (skip blanks, skip dirs already in base_args).
    existing = set()
    for i, arg in enumerate(base_args):
        if arg == "-I" and i + 1 < len(base_args):
            existing.add(os.path.abspath(base_args[i + 1]))
        elif arg.startswith("-I"):
            existing.add(os.path.abspath(arg[2:]))
    extra = []
    seen = set()
    for d in dirs_to_add:
        if d and d not in existing and d not in seen:
            extra += ["-I", d]
            seen.add(d)
    return extra + base_args


def main():
    print("C -> IDEKA Translation Utility\n\n"
          "\tConvert C source files individually or in batch mode.\n\n"
          "\t*.c & *.h pairs will convert to a singular .idk file.\n")

    cfg_path = _find_config()
    if cfg_path:
        print(f"cit: using config: {cfg_path}", file=sys.stderr)
    else:
        print("cit: no cit.cfg found -- using built-in defaults", file=sys.stderr)

    if CFT_CONFIG.cstdlib_root:
        print(f"cit: cstdlib output root: {CFT_CONFIG.cstdlib_root}", file=sys.stderr)
    else:
        print("cit: include walking disabled (cstdlib.output_root not configured)",
              file=sys.stderr)

    if len(sys.argv) < 2:
        print("Usage:", file=sys.stderr)
        print("  cit.py <input.c|h> [output.idk]", file=sys.stderr)
        print("  cit.py <directory> [output_directory]", file=sys.stderr)
        sys.exit(1)

    input_path = sys.argv[1]

    if os.path.isdir(input_path):
        out_dir = sys.argv[2] if len(sys.argv) >= 3 else None
        clang_args = _clang_args_with_include(input_path)
        translate_directory(input_path, out_dir=out_dir, clang_args=clang_args)
        return

    if not os.path.isfile(input_path):
        print(f"cit: file not found: {input_path}", file=sys.stderr)
        sys.exit(1)

    already_translated = set()
    clang_args = _clang_args_with_include(input_path)
    # Headers beside the input are local includes: they translate into the
    # same folder as the output file (or beside the input when printing).
    local_root = os.path.dirname(os.path.abspath(input_path))
    local_out = (os.path.dirname(os.path.abspath(sys.argv[2]))
                 if len(sys.argv) >= 3 else local_root)
    result = translate_file(input_path, clang_args=clang_args,
                            already_translated=already_translated,
                            local_root=local_root, local_out=local_out)
    CTranslator.flush_part2(clang_args=clang_args)

    if len(sys.argv) >= 3:
        out_path = sys.argv[2]
        with open(out_path, "w", encoding="utf-8") as f:
            f.write(result)
        print(f"cit: wrote {out_path}", file=sys.stderr)
    else:
        sys.stdout.buffer.write(result.encode('utf-8'))
        sys.stdout.buffer.write(b'\n')


if __name__ == "__main__":
    main()