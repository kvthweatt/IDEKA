# Editor Support for IDEKALang

This directory contains editor support files for IDEKALang (.idk files).

## Sublime Text

Files in `sublime/` directory:

- Copy files to your Sublime Text `Packages/User/` directory
- Provides syntax highlighting for `.idk` files
- Includes proper indentation settings

## VSCode

The extension in `vscode/IDEKA.IDEKA.lang-1.0.0/` provides `.idk` syntax
highlighting, editor configuration, and snippets. This is editor-only support:
it does not start `flsp.py` or provide language-server features or compiler
diagnostics.

The 72 snippets cover imports and preprocessor directives, generic functions
and FFI, types and interfaces, control flow, arrays and dictionaries, pointers
and memory, errors, strings, macros and constraints, compile-time code
generation, assembly, async, and modules.

### Setup

Open the extension folder in VS Code to develop it, or package and install it
as a VS Code extension for regular use. No Python, compiler, or language-server
dependencies are required for its current syntax, editor configuration, and
snippet features.

The extension does not currently provide completions, hover, navigation,
diagnostics, or other LSP features.