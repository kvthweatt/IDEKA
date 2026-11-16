# Editor Support for IDEKALang

This directory contains editor support files for IDEKALang (.idk files).

## Sublime Text

Files in `sublime/` directory:

- Copy files to your Sublime Text `Packages/User/` directory
- Provides syntax highlighting for `.idk` files
- Includes proper indentation settings

## VSCode

The extension in `vscode/IDEKA.IDEKA.lang-1.0.0/` provides `.idk` syntax
highlighting, editor configuration, and snippets. It also starts the IDEKA
language server for import-aware completions, hover, navigation, rename, code
actions, inlay hints, and semantic highlighting.
The 72 snippets cover imports and preprocessor directives, generic functions and
FFI, types and interfaces, control flow, arrays and dictionaries, pointers and
memory, errors, strings, macros and constraints, compile-time code generation,
assembly, async, and modules.

### Setup

1. Install Python 3 and the language-server dependencies:
   `python -m pip install "pygls<2" lsprotocol llvmlite`.
2. Run `npm install` in the VS Code extension folder.
3. For development, open the extension folder in VS Code and press **F5**.
   This launches an Extension Development Host.
4. In the new window, open the IDEKA repository. The extension searches the
   workspace and its parent folders for `scripts/flsp.py` and
   `src/compiler/iparser.py`.
5. If the repository is elsewhere, set `ideka.sourcePath` to its root. Set
   `ideka.serverPath` if the language-server script is at a different path, or
   `ideka.pythonPath` if Python is not available as `python3`.

The extension is a regular VS Code extension folder. The **F5** workflow is for
testing changes; installing the extension in a regular VS Code instance
requires packaging and installing it as a VS Code extension.