# IDEKA agent changelog

Append one entry per task, after the other agent files are updated. Format: date | task ID | agent | what changed | verification. Keep the older notes below as historical evidence; new reproducible test records live in [TESTS.md](TESTS.md).

## 2026-11-19 — IDEKA context and verified native workflow

- Added the root agent instructions, language/source map and verification notes, a public developer workflow, and a native smoke harness with a self-checking language fixture. Linked the workflow from the repository and documentation indexes and marked historical setup/architecture guidance.
- Linux x86-64, bundled `Crimson Cobra v2.2.1`: `bash -n scripts/smoke_native.sh` passed. Executed all three Bash examples in `docs/developer_workflow.md`: `bash scripts/smoke_native.sh` passed both programs; bundled `./idkc "$repo/idkc.idk"` produced native `idkc` and `idkvm`; the smoke harness passed both programs with `"$work/build/idkc/Linux/Release/idkc"`; `./build/run_tests/run_tests --filter language_smoke --verbose` reported 1/1 compiled and run successfully.
- The rebuilt `idkc "$repo/tests/language_smoke.idk" --check` reported 0 errors and 0 warnings. The rebuilt `idkvm --compile agent_probe.ivm agent_probe.idkb` encoded an eight-instruction `40 + 2 == 42` assertion. `idkvm agent_probe.ivm` and `idkvm agent_probe.idkb` both exited 0; `idkvm agent_probe_negative.ivm` (expected value changed to 43) exited 1 with the expected assertion diagnostic. The native `ASSERT` consumes a condition and a message; a one-operand probe underflowed.
- `bash scripts/smoke_native.sh /bin/false` exited 1 and preserved `helloworld.compile.log`, as expected for a failing compiler. Checked local Markdown link targets and `git diff --check`.
- Python 3.11.2 / llvmlite 0.50.0: `.venv/bin/python idkvm_test.py` returned 139/143; `.venv/bin/python idkc.py --help` and `.venv/bin/python scripts/run_tests.py --help` failed on f-string syntax; `.venv/bin/python -m pytest --collect-only -q` failed on duplicate VM test module names. See [verification notes](TESTS.md) for details. These Python paths were not changed. No full fixture sweep or LLVM, AArch64, macOS, Windows, or newer Python verification was performed.

## 2026-11-19 — Focused agent intake and issue triage

- Made `AGENTS.md` the short entry point. Added [issue triage](triage.md) to route failures to the right layer, use the smallest useful reproduction, and stop rather than patch another implementation or an unrelated baseline failure. Linked it from the developer workflow.
- Corrected the default Linux x64 toolchain description: `idkc.idk` calls embedded assembler/linker routines. Both bundled and rebuilt `idkc "$repo/tests/language_smoke.idk"` compiled and ran the fixture with only `mkdir` on the compiler's PATH. Removed unnecessary standalone tool staging from the smoke harness and documented commands. A completely empty PATH failed at output-directory creation, not assembly or linking.
- Executed all three Bash blocks in `docs/developer_workflow.md` again: the two smoke cases passed with bundled and rebuilt compilers, `idkc.idk` rebuilt the native compiler and VM, and the focused native runner passed 1/1. `bash -n scripts/smoke_native.sh` passed; `bash scripts/smoke_native.sh /bin/false` exited 1 and kept `helloworld.compile.log`.
- Staged compiler: `./idkc ok.idk -E`, `--lex`, `--parse`, `--dump` and `--check` exited 0 for a minimal `main`; the same stages on a separate `#stop` input exited 1 with the marker diagnostic. `--lex -v` printed detailed tokens. This exercised stage selection and an early failure, not a comprehensive diagnostic suite. Verified local guide links and `git diff --check`; no full suite, Python or other platform retest in this task.

## 2026-11-19 — TASK-001

2026-11-19 | TASK-001 | Arena coding agent | Bootstrapped the seven-file agent system, inventoried the existing clone and separated checkout evidence from the supplied prompt's claims. Updated onboarding docs and preserved previous verification history. | TEST-001 through TEST-003 passed: inventory sentinels, shell syntax, all three documented workflows, two programs on both native compilers, native compiler/VM build, and focused runner 1/1. Verified canonical files, unique task IDs, local links and `git diff --check`. Hello World evidence also satisfies TASK-004. No new Python, LSP, alternative target, or broader specification verification was performed.

## 2026-11-19 — remaining queue batch

2026-11-19 | TASK-002–TASK-016 (excluding previously completed TASK-004) | Arena coding agent | Added scoped native probes, a reading summary example, spec/source review, C translator and LSP evidence, and updated all agent summaries and developer docs. | Both bundled and rebuilt Linux x64 compilers passed 13 focused assertions per run; byte order is a recorded XFAIL. All four developer workflow blocks ran; native runner 1/1. C source and manually adapted translation exited zero, raw translation did not link. Python 3.12.12 was built from source: compiler reached the LLVM step but `llc` was missing, the local VM interpreter lacked `_ctypes`, and the 3.11 VM baseline remained 139/143. LSP blocked on both tested Python versions before initialize. Checked all 101 spec contents targets, 202 local documentation links/anchors, 16 unique queue entries, 13 test records, Bash and probe syntax, and `git diff --check`. No exhaustive spec, ABI, or alternate-platform conformance claim.

## 2026-11-19 — TASK-017

2026-11-19 | TASK-017 | Arena coding agent | Wrote a copy-ready LSP startup report for the user to file; no LSP implementation changes. | TEST-014 confirmed current fork `main` (`31fbaf4`) crashes at line 139 on both Python 3.11.2 and 3.12.12 with pinned dependencies from a clean export. Validated local Markdown links and `git diff --check`. TASK-011 remains blocked; independent upstream not tested.

## 2026-11-19 — TASK-018

2026-11-19 | TASK-018 | Arena coding agent | Prepared the branch for pull request handoff. | TEST-015 revalidated all four documented commands, both native compilers, both smoke programs, the 1/1 focused runner, and 13 feature checks per compiler. Byte order remained a documented XFAIL. No compiler or LSP fixes in this patch.
