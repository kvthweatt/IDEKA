# IDEKA checkout source map

Start at the owning entry point and follow imports. Paths are from this checkout; [CONTEXT.md](CONTEXT.md) separates tested behavior from open questions.

## Find the owning code

| Area | Where to start |
| --- | --- |
| CLI, flags, module builds | [idkc.idk](../idkc.idk), [version.idk](../version.idk), [imodules.idk](../src/compiler/imodules.idk) |
| Imports, tokens, syntax and source locations | [ipreprocess.idk](../src/compiler/ipreprocess.idk), [ilexer.idk](../src/compiler/ilexer.idk), [iparser.idk](../src/compiler/iparser.idk), [iast.idk](../src/compiler/iast.idk), [ierrors.idk](../src/compiler/ierrors.idk) |
| Declarations, type checking and expression typing | [itypesys.idk](../src/compiler/itypesys.idk), [icheck.idk](../src/compiler/icheck.idk), [ityper.idk](../src/compiler/ityper.idk) |
| Analysis | [idce.idk](../src/compiler/idce.idk), [iborrow.idk](../src/compiler/iborrow.idk), [ieffects.idk](../src/compiler/ieffects.idk); the Python borrow checker has its own [idkbc.py](../idkbc.py) |
| Code generation and target lowering | [icodegen.idk](../src/compiler/icodegen.idk), [ibackend.idk](../src/compiler/ibackend.idk), [ix64.idk](../src/compiler/ix64.idk), [iarm64.idk](../src/compiler/iarm64.idk), [i_llvmir.idk](../src/compiler/i_llvmir.idk) |
| Assembler and linker | [iasm_main.idk](../iasm_main.idk), [ilink_main.idk](../ilink_main.idk), and the `iasm*.idk` / `ilink*.idk` helpers under `src/compiler/`. Native x64 `idkc` uses embedded helpers, not the standalone CLIs. |
| Compile-time VM and bytecode | [ivmcodegen.idk](../src/compiler/ivmcodegen.idk), [idkvm.idk](../src/compiler/idkvm.idk), [ivm_main.idk](../ivm_main.idk); separate Python [idkvm.py](../idkvm.py) / [idkvm_test.py](../idkvm_test.py) |
| Runtime, packages, editor tooling | [src/stdlib](../src/stdlib/), [ipm.py](../ipm.py), [FPM docs](../docs/fpm.md), [scripts/flsp.py](../scripts/flsp.py), [editor-support](../editor-support/) |

For syntax changes, trace the token, parser production, AST, semantic pass and backend. For a stdlib fix, read the exact function plus its callers and platform guards. For Python work, start at [idkc.py](../idkc.py) and [src/compiler/ic.py](../src/compiler/ic.py); do not assume similarly named native files are wired to that entry point.

## Repository layout

| Area | Contents and cautions |
| --- | --- |
| Root | Native `.idk` entry points, bundled Linux/Windows executables, and separate Python CLI tools. [version.idk](../version.idk) is native version metadata; [version.txt](../version.txt) is separate. |
| `src/compiler/` | Native and Python implementations live side by side. `src/compiler/v1.6.0/` contains its own `core/` and `entrypoint/` snapshots and is not the default edit target. |
| `src/stdlib/`, `.fpm/` | Standard library, runtime, platform pieces and package code; `.fpm/` contains tracked package data and sources. Do not modify it as a side effect of testing. |
| `tests/`, `examples/` | Programs, data and demos, including deliberate failures and tracked legacy artifacts in `tests/build/`. Select fixtures rather than sweeping every file. |
| `docs/`, `site/` | Markdown docs and a checked-in HTML site. Prefer [the language specification](../docs/Specs/language_specification.md) and current source over historical setup instructions. |
| `scripts/`, `editor-support/`, `config/`, `resources/` | Test runners, editor tooling, doc/build/setup scripts, configuration and supporting assets. [cit.py](../scripts/cit.py) is the C translator. [flsp.py](../scripts/flsp.py) is a Python LSP script; its presence does not attest that its parser imports work. |

Source/spec starting points for later tasks: [operator reference](../docs/operator_reference.md), [import rules](../docs/Specs/language_specification.md#importing-with-import), [compile-time emission](../docs/Specs/language_specification.md#emitideka), [interface permissions](../docs/Specs/language_specification.md#interfaces) and [fixture](../tests/interface_test.idk), [effects](../docs/effect_system.md), [type algebra](../docs/algebraic_types.md), [compile-time reflection](../docs/comptime_reflection.md), and [style guide](../docs/style_guide.md).
