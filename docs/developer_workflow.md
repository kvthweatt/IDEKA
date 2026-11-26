# Working on IDEKA in this checkout

Flux is the repository name; IDEKA is the programming language. Read the [language specification](Specs/language_specification.md), [operator reference](operator_reference.md) and [style guide](style_guide.md) alongside real `.idk` programs. Start with [Hello World](../examples/helloworld.idk) and the [self-checking language example](../tests/language_smoke.idk), which exercises address assignment, dereferencing, a not-null test, a bitwise operation on a custom-width type, and zero coalescing.

## Run the native smoke tests

From the repository root on **Linux x86-64**:

```bash
bash scripts/smoke_native.sh
```

The script stages an executable copy of the bundled `idkc` under ignored `build/`, sets `IDEKA_SRCDIR` to the repository root, and uses the default x64 backend. On Linux, that backend assembles and links inside `idkc`; the standalone `iasm` and `ilink` binaries are not required. It compiles and runs both programs, checking their exit status and stdout. A successful run prints two `PASS` lines. A failure preserves the work directory and compile logs. You need Bash, standard Linux utilities and a host that can run the bundled Linux binaries; you do not need Python, Clang or LLVM for this path.

## Rebuild and test the native compiler

The smoke command above tests the checked-in tools. To test changes to the native `.idk` compiler sources, bootstrap with the bundled compiler, then run the smoke programs with the newly built compiler:

```bash
(
    set -eu
    repo=$PWD
    mkdir -p build
    work=$(mktemp -d "$repo/build/native-rebuild.XXXXXXXX")
    install -m 755 "$repo/idkc" "$work/idkc"
    export IDEKA_SRCDIR="$repo"
    cd "$work"
    ./idkc "$repo/idkc.idk"
    bash "$repo/scripts/smoke_native.sh" "$work/build/idkc/Linux/Release/idkc"
)
```

The native build also creates `build/idkvm/Linux/Release/idkvm` inside the work directory. Ordinary single-program builds such as Hello World write `build/<stem>/<stem>` there; the module build for `idkc.idk` uses the longer paths shown above. If you change shared assembler or linker code, rebuild `idkc` to exercise its embedded implementation. If the change also affects a standalone CLI, rebuild and test that CLI separately.

For a focused test with the [native runner](../scripts/run_tests.idk), run this from the repository root:

```bash
(
    set -eu
    repo=$PWD
    mkdir -p build
    run=$(mktemp -d "$repo/build/native-runner.XXXXXXXX")
    install -m 755 "$repo/idkc" "$run/idkc"
    export IDEKA_SRCDIR="$repo"
    export PATH="$run:$PATH"
    cd "$run"
    mkdir tests
    cp "$repo/tests/language_smoke.idk" tests/
    idkc "$repo/scripts/run_tests.idk"
    ./build/run_tests/run_tests --filter language_smoke --verbose
)
```

To test a rebuilt compiler, stage it as `"$run/idkc"` instead of the bundled `idkc`. Check that the runner found one case and reports both `Compile: PASS` and `Run: PASS`. Add only the fixtures and data relevant to your task. Do not run an unreviewed sweep of `tests/` or `examples/`; those directories also contain negative cases, interactive programs and platform-specific demos.

For a compiler failure, use `-E` for preprocessed text, `--lex` for tokens, `--parse` or `--dump` for syntax, and `--check` for the semantic stage. These are diagnostics tools; passing a stage is not proof that the generated executable works.

## Run focused feature checks

```bash
bash scripts/check_native_features.sh
```

This Linux x86-64 suite checks primitive expressions, compile-time emission, custom operators, tied values, borrow-check flags, libc calls and the [reading summary example](../examples/reading_summary.idk). It accepts an optional `idkc` path, like the smoke script. It distinguishes asserted rejections from unexpected failures. `XFAIL byte_order` means the probe reproduced a known [specification discrepancy](../.agents/ERRORS.md), not that the layout was verified as specified. See the [verified feature index](../.agents/DOCS.md) for exact scope and test evidence.

## Python and other targets

`idkc.py` and `src/compiler/*.py` are a separate Python compiler implementation. The [Python VM harness](../idkvm_test.py) is run directly with `python idkvm_test.py`; it does not test the native VM. `scripts/run_tests.py` invokes the Python compiler, unlike the native runner above. See the [verification notes](../.agents/TESTS.md) for observed failures and prerequisites before interpreting either runner. The Linux x86-64 commands above do not validate the alternate LLVM backend, AArch64, macOS or Windows. The [C translation and editor probes](../.agents/TESTS.md) are separate from the native suite.

## Working with an AI coding agent

Start at [AGENTS.md](../AGENTS.md), then use the [agent index](../.agents/MASTER.md) to find the [task queue](../.agents/TASKS.md), [verified context](../.agents/CONTEXT.md), [test records](../.agents/TESTS.md), and [known issues](../.agents/ERRORS.md). The [issue triage guide](../.agents/triage.md) helps narrow a reproducer without mixing native and Python toolchains.

After each task, record the outcome and evidence, update affected guidance, and append to the [agent changelog](../.agents/CHANGELOG.md) last. Only demonstrated behavior belongs in the [verified documentation index](../.agents/DOCS.md); log conflicts with the language specification instead of silently choosing one version.
