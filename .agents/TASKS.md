# IDEKA task queue

An explicit user task takes precedence over the research queue. Reuse existing evidence; rerun a completed check if affected by new changes, not merely because a new session started. Timestamps are UTC.

## In progress

None.

## Todo

No unstarted task remains in this batch. The [spec review](SPEC_REVIEW.md) lists untested clauses, and [ERRORS.md](ERRORS.md) tracks follow-up defects.

## Blocked

- **TASK-011** — LSP function verification: startup was tested on Python 3.11 and 3.12, but the server exits before initialization, so diagnostics cannot be verified. Started: 2026-11-19T15:48:38Z. Blocked: 2026-11-19T15:54:12Z. See TEST-011 and ERR-007.

## Done

- **TASK-001** — Inventoried the existing clone, mapped entry points, bootstrapped agent records, and ran TEST-001 through TEST-003. Started: 2026-11-19T15:45:42Z. Completed: 2026-11-19T15:47:19Z.
- **TASK-004** — Hello World coverage satisfied by the TASK-001 smoke run; no separate execution needed. Evidence recorded: 2026-11-19T15:47:19Z; see [TEST-002](TESTS.md#test-002-native-hello-world-and-language-smoke).

Batch started: 2026-11-19T15:48:38Z. Batch closeout: 2026-11-19T15:54:12Z.

- **TASK-002** — Mapped specification families to implementation owners and validated all 101 TOC links after correcting one anchor. See [spec review](SPEC_REVIEW.md), TEST-004.
- **TASK-003** — Recorded native, Python 3.11/3.12 and LLVM setup coverage and blockers; no unsupported platform claim. TEST-005.
- **TASK-005** — Ran primitive and bitwise fixtures on both compilers; recorded an explicit/default byte-order discrepancy, not a layout pass. TEST-006.
- **TASK-006** — Verified one `emitideka` case and rejected the corresponding `emitflux` substitution. TEST-007.
- **TASK-007** — Verified punctuation and word operator cases plus missing word declaration rejection. TEST-008.
- **TASK-008** — Verified a single tie, reuse rejection and all three tested borrow-check modes. TEST-009.
- **TASK-009** — Verified Linux x64 default SysV calls to libc `abs` and `puts`. TEST-010.
- **TASK-010** — Ran a compiler-integrated VM loop whose generated function was used at runtime. TEST-007.
- **TASK-012** — Located `scripts/cit.py`, translated C and ran equivalent output with the documented entry-point adaptation. Raw output did not link. TEST-012.
- **TASK-013** — Published scoped [verified feature documentation](DOCS.md) and linked the runnable suite from the developer workflow. TEST-004.
- **TASK-014** — Cross-checked the verified documentation against spec sections and logged observed byte-order divergence without changing the rule. TEST-004/006.
- **TASK-015** — Built and ran a self-checking reading summary example on both native compilers. TEST-013.
- **TASK-016** — Reviewed all agent records, evidence links, scope limits and task statuses. TEST-004 and changelog.
- **TASK-017** — Reproduced LSP startup on clean fork `main` and prepared a [report](reports/lsp-startup.md); TASK-011 remains blocked. Started: 2026-11-19T15:57:20Z. Completed: 2026-11-19T15:57:48Z.
- **TASK-018** — Revalidated the branch and prepared the pull request handoff. Started: 2026-11-19T16:05:55Z. Completed: 2026-11-19T16:06:27Z. See TEST-015.
