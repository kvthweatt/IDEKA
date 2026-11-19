# IDEKA LSP exits with `NameError: name 'Program' is not defined` before initialization

## Environment

- Reproduced from a clean export of [`Hemansh2633B/Flux` `main` at `31fbaf4`](https://github.com/Hemansh2633B/Flux/tree/31fbaf47464a6c6a26b45cc8743df5b10e9595dd).
- Linux x86-64; reproduced with Python 3.11.2 and 3.12.12.
- `pygls==1.3.1`, `lsprotocol==2023.0.1`.

## Steps to reproduce

From the root of a clean checkout at the revision above:

```bash
python3 -m venv .venv
.venv/bin/python -m pip install 'pygls==1.3.1' 'lsprotocol==2023.0.1'
IDEKA_SRCDIR="$PWD" .venv/bin/python -B scripts/flsp.py </dev/null
```

This reproduces the startup crash without needing an editor. With an editor or an open stdin pipe, the crash prevents the server from answering `initialize`.

## Expected behavior

The server loads its compiler dependencies and starts the stdio transport, ready to handle `initialize` when connected to a client. If compiler dependencies cannot be loaded, startup should identify the missing import rather than crash on an unrelated annotation.

## Actual behavior

The process exits with code `1` during module loading:

```text
Traceback (most recent call last):
  File "scripts/flsp.py", line 139, in <module>
    _parse_cache: Dict[str, Program] = {}  # uri -> last successful Program
                            ^^^^^^^
NameError: name 'Program' is not defined
```

## Evidence and likely cause

[`scripts/flsp.py`](https://github.com/Hemansh2633B/Flux/blob/31fbaf47464a6c6a26b45cc8743df5b10e9595dd/scripts/flsp.py#L92-L110) attempts to import `fparser`, `fmacros`, `fast` (including `Program`), and `ftypesys` in one `try` block. Those module names are absent from the tracked tree; the Python compiler has `iparser.py`, `imacros.py`, `iast.py`, and `itypesys.py` under `src/compiler/`. The exception is caught, but `Program` is still referenced by the module-level annotation at line 139 before the error can be reported to a client. Import names and APIs both need checking; a rename alone has not been tested as a fix.

This affects the Python LSP entry point, not the native compiler build. The separately maintained upstream repository was not tested.
