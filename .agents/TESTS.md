# Agent verification notes

Use the commands in [the developer workflow](../docs/developer_workflow.md). Keep large logs and executables out of Git. The shell smoke harness runs two selected programs; it is not the whole IDEKA suite.

## Choosing checks

| Change | Required evidence |
| --- | --- |
| Syntax or a diagnostic | Minimal valid and invalid `.idk` programs; isolate with `--lex`, `--parse`, `--dump` or `--check` as appropriate, then compile/run the valid case. |
| Native language, runtime or stdlib | Bundled-compiler baseline and a targeted test; rebuild the compiler when changing it. Check stdout and exit codes. Exercise each affected backend/target you have, and name any you could not test. |
| Native VM | Rebuild `idkvm` along with `idkc` via `idkc.idk`; use focused `.ivm` or `.idkb` input and check results. Python VM results don't validate the native VM. |
| Python compiler, tooling or VM | Run the specific entry point and focused tests with a compatible Python. Use `python idkvm_test.py` for the Python VM's own harness. |
| Docs | Run any new commands or examples, check local link targets, and verify the diff. |

The native runner (`scripts/run_tests.idk`) looks up `idkc` on `PATH`, scans `tests/` or `examples/` in its working directory, and uses `.run_tests_*.tmp` filenames; some are tracked at repo root. Run it in an ignored workspace with selected fixtures and their needed inputs. These directories contain standalone inputs, demos and negative cases, not a curated all-green suite. Some programs expect input, a display, network or platform-specific libraries. Read fixtures before running them and check the summary has the intended match count.

## Observed baseline

Recorded 2026-11-19; check the exact command and environment before comparing a new result.

- Linux x86-64, bundled native compiler banner `Crimson Cobra v2.2.1`: native x64 smoke cases pass. The same cases pass using the compiler rebuilt from this checkout's `idkc.idk`.
- Python 3.11.2 with llvmlite 0.50.0: `python idkvm_test.py` reports **139/143 passed** and exits 1. Failures: `EMITIDEKA plain substitution`, `compiler.import.stdlib`, `compiler.import.local`, and `compiler.fpm.package`.
- `python idkc.py --help` fails to import `src/compiler/iast.py` on Python 3.11 due to an f-string expression containing a backslash. `python scripts/run_tests.py --help` also fails to parse on 3.11 (nested quotes in an f-string). Do not treat `pyproject.toml`'s `>=3.10` as verified compatibility. At this baseline Python 3.12+ had not been exercised; see TEST-005 for follow-up.
- Broad `python -m pytest --collect-only -q` hits an import-file mismatch because both the root and the bundled v1.6.0 snapshot contain `idkvm_test.py`. It does not run the `.idk` fixtures.
- LLVM (`llc`), AArch64, macOS and Windows were not tested. Native x64 success does not establish those paths work.

## Recorded tests

For each new run include an ID, date, task, description, category, code (or a link to the exact checked-in fixture and the command), expected result, actual result, status (`PASS`, `FAIL`, `ERROR`, `SKIP`) and notes. Put generated logs under ignored `build/` and record enough output here to reproduce the outcome.

### TEST-001: Tracked tree inventory

- **TEST-ID:** TEST-001 · **DATE:** 2026-11-19 · **TASK-REF:** TASK-001
- **DESCRIPTION:** Establish the actual compiler, runner, specification and tool paths in the cloned checkout. **CATEGORY:** misc
- **CODE:**
  ```bash
  for path in idkc idkc.idk idkc.py ivm_main.idk src/compiler/v1.6.0/core/ilexer.py src/stdlib/standard.idk docs/Specs/language_specification.md scripts/run_tests.idk scripts/run_tests.py scripts/flsp.py; do
      git ls-files --error-unmatch "$path" >/dev/null || exit 1
  done
  if git ls-files --error-unmatch cft.py >/dev/null 2>&1; then exit 1; fi
  ```
- **EXPECTED:** All sentinel paths tracked; historical `cft.py` absent from the tracked tree.
- **ACTUAL:** All ten sentinel paths matched. `cft.py` did not match.
- **STATUS:** PASS. **NOTES:** File presence does not prove LSP usability; absence of that filename does not prove no other translator exists.

### TEST-002: Native Hello World and language smoke

- **TEST-ID:** TEST-002 · **DATE:** 2026-11-19 · **TASK-REF:** TASK-001
- **DESCRIPTION:** Compile, execute and check both IDEKA programs. **CATEGORY:** types, operators
- **CODE:** [Hello World](../examples/helloworld.idk) and [language smoke](../tests/language_smoke.idk); execute `bash scripts/smoke_native.sh`. The [bootstrap block](../docs/developer_workflow.md#rebuild-and-test-the-native-compiler) invokes the same harness with the rebuilt compiler path.
- **EXPECTED:** Exit zero from each executable, with `Hello World!` and `IDEKA language smoke passed`, respectively.
- **ACTUAL:** Both executable status and stdout checks passed with both compilers. The harness reported two `PASS` lines for each run.
- **STATUS:** PASS. **NOTES:** Native v2.2.1 default backend on Linux x86-64 only.

### TEST-003: Native bootstrap and focused runner

- **TEST-ID:** TEST-003 · **DATE:** 2026-11-19 · **TASK-REF:** TASK-001
- **DESCRIPTION:** Build the native compiler and VM and exercise the documented runner. **CATEGORY:** misc
- **CODE:** [idkc.idk](../idkc.idk), [run_tests.idk](../scripts/run_tests.idk) and [language smoke](../tests/language_smoke.idk). Executed all three shell blocks in the [developer workflow](../docs/developer_workflow.md), including `./idkc "$repo/idkc.idk"` and `./build/run_tests/run_tests --filter language_smoke --verbose` in their staged workspaces.
- **EXPECTED:** Bootstrap produces runnable `idkc` and the native `idkvm` binary; focused runner compiles and runs one fixture.
- **ACTUAL:** The bundled banner reported `Crimson Cobra v2.2.1`; build output reported `build/idkc/Linux/Release/idkc` and `build/idkvm/Linux/Release/idkvm`; the rebuilt compiler passed TEST-002. Runner reported `Total Tests: 1`, `Compile: PASS`, and `Run: PASS`.
- **STATUS:** PASS. **NOTES:** This run verified the native VM build output, not a new VM execution test. The previous standalone VM probe is in [CHANGELOG.md](CHANGELOG.md).

## Batch verification — TASK-002 through TASK-016

Unless otherwise noted: 2026-11-19; bundled and rebuilt native `Crimson Cobra v2.2.1`, Linux x86-64, default backend. `bash scripts/check_native_features.sh [path-to-idkc]` reproduces TEST-006 through TEST-010 and TEST-013 (the script shows the exact generated negative inputs and compiler flags). Brackets denote an optional path; do not type them literally.

### TEST-004: Specification contents and documented coverage

- **Date / task / category:** 2026-11-19 · TASK-002, TASK-013, TASK-014, TASK-016 · misc.
- **Code:** Extract the `](#...)` targets between the contents heading and the `functions` anchor in [the spec](../docs/Specs/language_specification.md); compare each target with its explicit `<a id>` or rendered heading slug. Reconcile each verified section in [DOCS.md](DOCS.md) against its cited spec and fixture. [Section/source index](SPEC_REVIEW.md).
- **Expected / actual:** All 101 targets resolve. The singular `#variadic-operator` target was wrong; after correction all 101 resolve. Byte order remains a documented spec/implementation conflict, not a TOC fix.
- **Status:** PASS for TOC/navigation and scoped review; no all-clauses execution claim.

### TEST-005: Setup and implementation matrix

- **Date / task / category:** 2026-11-19 · TASK-003 · misc.
- **Code:** [Hello World](../examples/helloworld.idk), `.venv/bin/python idkvm_test.py`, Python 3.12.12 `idkc.py` (no arguments), `idkc.py --help`, `scripts/run_tests.py --help`, `idkc.py examples/helloworld.idk`, `idkvm_test.py`, and rebuilt native `idkc examples/helloworld.idk --backend llvm`. Python invocations used `PYTHONDONTWRITEBYTECODE=1` on rechecks to avoid tracked cache files. Python 3.12.12 was built from CPython source with `./configure --without-ensurepip && make -j 8`; the environment used llvmlite 0.50.0.
- **Expected / actual:** A runnable program per compiler/backend; Python VM suite completes. On 3.12 the Python compiler reaches its usage text (exit 1 with no arguments); `--help` is treated as a filename, and the separate runner's `--help` exits 0. Python compilation and native `--backend llvm` both exit 1 at missing `llc`. The 3.12 VM cannot import `_ctypes` in this local interpreter build. The 3.11.2 VM still reports 139/143, exit 1; see the historical baseline above.
- **Status:** ERROR for those unavailable or failing paths. Native default backend passes separately. macOS, Windows and AArch64 were not run.

### TEST-006: Primitive expressions and byte-order discrepancy

- **Date / task / category:** 2026-11-19 · TASK-005, TASK-014 · types.
- **Code:** [types.idk](../tests/agent_checks/types.idk), [byte_order.idk](../tests/agent_checks/byte_order.idk).
- **Expected / actual:** Primitive fixture exits 0 and prints `primitive and bitwise checks passed`, observed with both native compilers. For `0x1234`, the [spec](../docs/Specs/language_specification.md#endianness-handling) describes `data{16::0}` as little-endian (`34 12` in hex) and default `data{16}` as big-endian (`12 34`). Actual ascending-address bytes were `12 34` for explicit zero, `34 12` for explicit one, and `34 12` for omitted endianness on both compilers.
- **Status:** PASS for primitive expressions; FAIL for spec byte order (suite reports the known result as `XFAIL`). Explicit one is reported independently of the two examples in the cited spec. No ABI layout or full type matrix asserted.

### TEST-007: Compiler-integrated VM and emission

- **Date / task / category:** 2026-11-19 · TASK-006, TASK-010 · comptime, FVM.
- **Code:** [comptime.idk](../tests/agent_checks/comptime.idk); the negative input substitutes `emitflux` for `emitideka` in that exact file.
- **Expected / actual:** VM sums 1–6, codifies the result into a function, executable prints `comptime: 21` and exits 0. Observed on both. The spelling substitution exits 1 with a member-assign-block parse diagnostic on both; it did not behave as an alias in this tested native context.
- **Status:** PASS. No assertion about other spellings, splicing, or Python VM behavior.

### TEST-008: Custom operators

- **Date / task / category:** 2026-11-19 · TASK-007 · operators.
- **Code:** [operators.idk](../tests/agent_checks/operators.idk); substitute `AGENT_SUM` for `+++`, then remove the declaration for the negative word case (exact commands in the suite).
- **Expected / actual:** Declared punctuation and word forms exit 0 and print `custom operator: 10`; missing word declaration exits 1 with `Unexpected 'AGENT_SUM' in expression`. All observed. In an exploratory punctuation-only variant, removing the declaration still compiled (`+` and `++` can form another expression), but the result assertion exited 1.
- **Status:** PASS for the scoped cases. Do not treat all punctuation as undeclared grammar that must be rejected.

### TEST-009: Tie reuse and borrow flags

- **Date / task / category:** 2026-11-19 · TASK-008 · ownership.
- **Code:** [tie_reuse.idk](../tests/agent_checks/tie_reuse.idk), its generated single-use variant, and [borrow_alias.idk](../tests/agent_checks/borrow_alias.idk) with default flags, `--borrowcheck` and `--borrowcheck-warn`.
- **Expected / actual:** Single use runs with exit 0; reuse fails compilation with `use after untie`. Alias input runs by default, is rejected with `[FBC error] mutable_alias` under blocking mode, and emits `[FBC warning] mutable_alias` but runs under warn mode. Confirmed all outcomes on both compilers.
- **Status:** PASS for these cases; no general lifetime or thread-safety proof.

### TEST-010: Linux x64 C ABI call

- **Date / task / category:** 2026-11-19 · TASK-009 · C-interop.
- **Code:** [ffi.idk](../tests/agent_checks/ffi.idk), native Linux x64 default SysV ABI.
- **Expected / actual:** `extern def !!abs` returns 37 for −37, `extern def !!puts` prints `C ABI: 37`, and program exits 0. Both compilers pass.
- **Status:** PASS for two libc calls, not a cross-platform or aggregate ABI test.

### TEST-011: LSP stdio initialization

- **Date / task / category:** 2026-11-19 · TASK-011 · misc.
- **Code:** [lsp_probe.py](../tests/agent_checks/lsp_probe.py). `python tests/agent_checks/lsp_probe.py` with pygls 1.3.1 / lsprotocol 2023.0.1 under Python 3.11.2 and 3.12.12. The probe sends `initialize` then opens the valid Hello World source only if initialization succeeds.
- **Expected / actual:** Initialization response then no diagnostics on valid source. Server exits before response: `NameError: name 'Program' is not defined` at `scripts/flsp.py:139` on both interpreters. The server imports legacy `fparser`, `fmacros`, `fast`, `ftypesys` names. No didOpen coverage reached.
- **Status:** ERROR. Do not infer that editor diagnostics or semantic tokens work. The probe itself passed Python syntax compilation.

### TEST-012: C translation

- **Date / task / category:** 2026-11-19 · TASK-012 · C-interop.
- **Code:** [translate.c](../tests/agent_checks/translate.c). In a fresh ignored workspace with no `config/cit.cfg`, run the following (`repo`, `python` and `idkc` must be absolute paths; interpreter used Python 3.11.2 with `libclang==18.1.1`, `idkc` was the rebuilt native compiler):
  ```bash
  export IDEKA_SRCDIR="$repo"
  cc -std=c11 -Wall -Wextra -Werror "$repo/tests/agent_checks/translate.c" -o original
  ./original
  "$python" "$repo/scripts/cit.py" "$repo/tests/agent_checks/translate.c" translated.idk
  # Raw output independently tested: idkc translated.idk fails to link.
  { printf '#import <standard.idk>;\n'; sed 's/^cdecl main()/def main()/' translated.idk; } > translated_with_entry.idk
  "$idkc" translated_with_entry.idk
  ./build/translated_with_entry/translated_with_entry
  ```
- **Expected / actual:** Original C exits 0. The translator produces IDEKA source, but raw output lacks the runtime import and emits `cdecl main`; raw build fails at link (`entry point symbol is not defined`). Prepending the import alone still fails (`ilink: main__0__ret_intE1`). With both entry adjustments the translated program exits 0, matching C.
- **Status:** PASS for translation with the recorded manual adaptation; FAIL for direct executable output. No system-header conversion tested.

### TEST-013: Reading summary example

- **Date / task / category:** 2026-11-19 · TASK-015 · misc.
- **Code:** [reading_summary.idk](../examples/reading_summary.idk).
- **Expected / actual:** Reject empty input at the function boundary; process five fixed readings; output `min 18, max 25, total 105, above limit 3`; exit 0. Both compilers passed all assertions and stdout check.
- **Status:** PASS. This is a small in-memory example; the caller must supply a valid buffer/count, and the program does not demonstrate arbitrary-size overflow protection.

### TEST-014: LSP startup on clean remote main

- **Date / task / category:** 2026-11-19 · TASK-017 · misc.
- **Code:** Resolve `git ls-remote origin refs/heads/main`, then `git archive "$revision" | tar -xf - -C "$work"` into a new ignored directory. From that export run `IDEKA_SRCDIR="$PWD" "$python" -B scripts/flsp.py </dev/null` with Python 3.11.2 and 3.12.12, pygls 1.3.1 and lsprotocol 2023.0.1. [Copy-ready report](reports/lsp-startup.md).
- **Expected / actual:** Startup should load the dependencies and reach the stdio transport. Remote `main` resolved to `31fbaf47464a6c6a26b45cc8743df5b10e9595dd`. Both runs exited 1 at `scripts/flsp.py:139` with `NameError: name 'Program' is not defined`. `find_spec` found `iparser` but not `fparser` with `scripts` and `src/compiler` searched.
- **Status:** ERROR for LSP startup; PASS for confirming that it reproduces on clean fork `main`. Independent upstream was not tested.

### TEST-015: Pull request verification

- **Date / task / category:** 2026-11-19 · TASK-018 · misc.
- **Code:** `bash -n` on both native shell scripts; execute all four Bash blocks in the [developer workflow](../docs/developer_workflow.md); then `bash scripts/check_native_features.sh "$work/build/idkc/Linux/Release/idkc"` using the fresh rebuild workspace.
- **Expected / actual:** Both shell checks passed; native Linux x86-64 compiler and VM rebuilt; both smoke programs passed on bundled and rebuilt compilers; the focused runner passed 1/1; both feature runs produced 13 passes and the known byte-order XFAIL.
- **Status:** PASS for the scoped verification. The byte-order divergence remains open; no new LSP, Python, or alternate-target run.
