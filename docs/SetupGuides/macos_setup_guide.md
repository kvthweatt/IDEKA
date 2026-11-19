# IDEKA on macOS - Setup Guide

> Historical setup notes; not validated for this checkout. In particular, the referenced `src/compiler/v1.5.4/` snapshot is not present. See the [checkout-specific workflow](../developer_workflow.md) for the verified Linux x86-64 path.

IDEKA on macOS needs Python, LLVM from Homebrew (it supplies `llc`), and the Xcode command line tools (Apple's `clang` is used as the linker). The steps are the same on Apple Silicon and Intel.

## Toolchain

1. **Xcode command line tools** - linker (`clang`) and the macOS SDK
2. **Homebrew** - package manager
3. **Python 3.10+** (3.12+ recommended)
4. **llvmlite 0.43+**
5. **LLVM** (Homebrew `llvm`) - provides `llc` and `opt`
6. **Git**
7. **uv** (optional) - manages the Python environment

## Quick Start

```bash
# Command line tools (skip if already installed)
xcode-select --install

# Homebrew (skip if already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install python llvm git

# Homebrew's LLVM must come first on PATH so `llc` is found
echo 'export PATH="$(brew --prefix llvm)/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

git clone https://github.com/kvthweatt/IDEKA
cd IDEKA

python3 -m venv .venv && source .venv/bin/activate
pip install "llvmlite>=0.43.0"

# Install the Python compiler (v1.5.4), which v2.0.8 does not ship
cp src/compiler/v1.5.4/core/* src/compiler/
cp src/compiler/v1.5.4/entrypoint/* .

# Bootstrap the compiler
python idkc.py idkc.idk

# From here on, use the native compiler
export IDEKA_SRCDIR="$PWD"
./build/idkc/idkc examples/helloworld.idk
./build/helloworld/helloworld
```

## Detailed Installation

### Homebrew

The installer prints any PATH lines you need to add. Homebrew lives in `/opt/homebrew` on Apple Silicon and `/usr/local` on Intel.

### LLVM

Homebrew's `llvm` is keg-only, so it is not linked into the default PATH. The `export PATH=...` line above fixes that. The IDEKA compiler looks up `llc` on the PATH and uses Apple's `clang` to link, so you do not need Homebrew's `clang` to win over Apple's.

### Python dependency

With a virtual environment (shown above) or with `uv`, which uses the repo's `pyproject.toml` and `uv.lock`:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
cd IDEKA
uv sync
uv run python idkc.py examples/helloworld.idk
```

Homebrew's Python is externally managed, so avoid a bare `pip install`.

## Bootstrap the Compiler

IDEKA compiles itself. Version 2.0.8 does not ship the Python compiler, so copy it in from the bundled v1.5.4 sources first:

```bash
cp src/compiler/v1.5.4/core/* src/compiler/
cp src/compiler/v1.5.4/entrypoint/* .
```

Then bootstrap. The Python compiler builds the IDEKA-written compiler (`idkc.idk`) into a native binary:

```bash
python idkc.py idkc.idk
```

This takes a few minutes and produces `build/idkc/idkc`. The same command works on every platform.

**Use the native compiler from now on.** It is much faster than the Python compiler. It finds the standard library through `IDEKA_SRCDIR`, so set that to the repo root:

```bash
export IDEKA_SRCDIR=~/IDEKA          # add to ~/.zshrc to keep it
./build/idkc/idkc examples/helloworld.idk
./build/helloworld/helloworld
```

To check the result, recompile the compiler with itself:

```bash
./build/idkc/idkc idkc.idk -o idkc2
```

If you only want the native compiler, the Python files you copied in can be deleted afterwards, and only those files: the ones from `core/` and `entrypoint/`. Other Python files in the repo are still needed. Rebuild stage 1 with `python idkc.py idkc.idk` whenever the compiler sources need newer compiler features than your native binary has.

## Verification Steps

```bash
xcode-select -p                                 # prints a path when the tools are installed
python3 --version                               # 3.10+
python3 -c "import llvmlite; print(llvmlite.__version__)"
which llc && llc --version                      # should be under $(brew --prefix llvm)/bin
clang --version                                 # Apple clang is fine, it is the linker
git --version
python idkc.py tests/test.idk --log-level 3       # should produce build/test/test
```

## Editor Support

Syntax definitions live in `editor-support/` (`sublime/`, `vscode/`, `notepad++/`). For Sublime Text, copy the syntax into `~/Library/Application Support/Sublime Text/Packages/User/` and restart.

## Common Issues

**`llc: command not found`** - Homebrew's LLVM is not on your PATH. Re-run the `export PATH=...` line, then `source ~/.zshrc`, and check `which llc`.

**`ModuleNotFoundError: llvmlite`** - the `python` running `idkc.py` is not the one pip installed into. Activate the virtual environment, or use `uv run`.

**`xcrun: error` or missing SDK** - run `xcode-select --install`. If it already is installed and the error persists, `sudo xcode-select --reset`.

**Linker errors about the platform or architecture** - make sure Homebrew's LLVM matches your machine (`/opt/homebrew` on Apple Silicon). Do not mix an Intel Homebrew under Rosetta with a native Python.

**Permission errors in `build/`** - `sudo chown -R $USER ~/IDEKA`.

## Build Output

Everything for a program `name` goes in `build/name/`: the IR (`.ll`), the object file (`.o`) and the executable `name` (no extension).

```bash
python idkc.py program.idk --log-level 4 --log-timestamp
```

## Compilation Process

1. **Preprocess** - macros and includes
2. **Lex and parse** - tokens, then the AST
3. **Generate** - LLVM IR through llvmlite
4. **Assemble** - `llc` produces an object file
5. **Link** - Apple `clang` links it (entry point `_FRTStartup`)

## Next Steps

- `docs/learn_IDEKA_intro.md`, then `docs/learn_IDEKA_adept.md`
- `docs/Specs/language_specification.md`
- Examples in `examples/`, tests in `tests/`, standard library in `src/stdlib/`
- [Discord](https://discord.gg/wVAm2E6ymf), [GitHub](https://github.com/kvthweatt/IDEKA)