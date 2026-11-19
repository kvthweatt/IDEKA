# IDEKA issue triage

Use this when an issue is ambiguous or a check fails. Read only the row and source links relevant to the task. [Language context](SOURCE_MAP.md) maps the implementation files; [verification notes](TESTS.md#observed-baseline) record known failures, not a repair backlog.

## First establish what failed

Record the exact command, binary path (use `command -v idkc` for a PATH invocation), compiler banner when available, OS/architecture, backend and relevant flags. Record the first meaningful diagnostic and exit status, or the expected versus actual output. If the report omits a target, use the documented Linux x86-64 native path when available and label that assumption. An editor diagnostic, a Python traceback, a native compiler failure and an incorrect program result are different reports.

| Signal | Cheapest useful check | Do not jump to |
| --- | --- | --- |
| `idkc` not found, permission denied, wrong compiler or missing stdlib | Check which binary ran, whether it is executable and whether `IDEKA_SRCDIR` points to this checkout. Run the [native smoke](../docs/developer_workflow.md#run-the-native-smoke-tests) to isolate local setup. | `chmod` on tracked blobs, old bootstrap instructions, or a grammar patch. |
| Missing import, macro or platform branch | `idkc input.idk -E`; inspect the resolved text and flags with the same source path and include tree. | Editing the parser to accept code the preprocessor never emitted. |
| Wrong token, syntax or AST | `idkc input.idk --lex -v`, then `--parse` or `--dump` only if needed. Compare a valid example with the failing input. | Changing codegen for a malformed AST or treating an IDE/editor underline as native compiler evidence. |
| Type, constraint, effect or borrow diagnostic | `idkc input.idk --check` for declaration/type diagnostics; read diagnostics and reported counts as well as exit status. Test effect/borrow rules with the relevant blocking flag and a reachable call path. Read any module settings. | Assuming `--check`, warn-only flags and a full build validate the same things. |
| No binary or wrong runtime behavior despite a valid AST | Run the full compile and read where it stops: codegen, assembler, linker, or execution. Inspect just the relevant generated `.s`/`.ll` and test with the same target, ABI and backend. | Installing LLVM for a default x64 failure, editing generated output, or changing the spec to match a backend quirk. |
| Failure only in the runner | Run the same compiler and program directly with the fixture's required inputs. Check cwd, PATH, expected exit code and match count. | Running every fixture, fixing unrelated known failures, or calling an empty run green. |

## Keep the patch on the right side of the boundary

- **Checked-in binary vs source.** Run a native reproducer on the bundled compiler for orientation, but rebuild from the current sources before concluding an issue is still present, fixed, or introduced by your patch. The default Linux x64 compiler embeds the assembler and linker routines. Editing `iasm*.idk` or `ilink*.idk` requires rebuilding `idkc` to test the integrated path; replacing standalone `iasm`/`ilink` on PATH will not change it. Test the standalone entry points separately if the report concerns those CLIs.
- **Same case before and after.** After finding the owning layer, freeze the fixture, flags, cwd and expected output. Run it before and after on the affected implementation. Keep the bug reachable after dead-code elimination. If the scenario depends on imported files, module settings, or target details, keep those parts in the minimal reproducer.
- **When evidence disagrees.** The spec describes intended behavior; current source and a named build tell you what this checkout implements; old tutorials and bundled snapshots are historical clues. If intended behavior is unclear and changes an API or language rule, report the conflict and ask rather than inventing a rule or patching both implementations by default.
- **Scope stop.** If the reproducer passes on current sources, do not invent a patch. If a result matches an unrelated baseline failure, record it and continue with a relevant check. If a required check is blocked, name the blocker and what remains unverified. Do not repair unrelated tests, toolchains, docs or generated outputs just to make the task appear green.
