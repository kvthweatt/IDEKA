# AGENTS.md — working on Flux / IDEKA

Flux is this repository's name; **IDEKA** is the language and toolchain in this checkout. Do not assume C, Rust, Python or another release's syntax or semantics. Verify the actual implementation, report the target tested, and label untested claims.

## Start here

1. Run `git status --short` and preserve existing changes. Read [MASTER.md](.agents/MASTER.md), [TASKS.md](.agents/TASKS.md), [CONTEXT.md](.agents/CONTEXT.md), and [ERRORS.md](.agents/ERRORS.md). For an open-ended maintenance session, resume an in-progress task before taking the next TODO. Explicit user requests take precedence. Don't repeat completed work unless changes require revalidation.
2. Pick the owner: `idkc.idk` plus `src/compiler/*.idk` is the native compiler; root `idkc` is the bundled executable. `idkc.py` is separate. The `src/compiler/v1.6.0/` snapshot is not the default edit target. Use the relevant row in the [source map](.agents/SOURCE_MAP.md) or [triage table](.agents/triage.md), not the whole repository or task history.
3. Establish an expected result and reproduce one focused case with the affected executable, backend and flags. Use the [developer workflow](docs/developer_workflow.md), including `bash scripts/smoke_native.sh` for a native Linux x86-64 baseline. Rebuild a changed native compiler/VM before claiming a fix. Don't fix unrelated [known failures](.agents/ERRORS.md) to make a task look green.

## Required task lifecycle

1. Mark the task **IN PROGRESS** in [TASKS.md](.agents/TASKS.md) with a UTC start timestamp.
2. Work and test. Record the command or fixture, expected/actual results and status in [TESTS.md](.agents/TESTS.md); if nothing ran, explain why. Log failures and specification divergences in [ERRORS.md](.agents/ERRORS.md). A compiler stage, a full compile and a runtime test are distinct.
3. Promote only tested, source-linked facts to [CONTEXT.md](.agents/CONTEXT.md) and [DOCS.md](.agents/DOCS.md). Update the public docs or source map when their paths, commands or guidance change. Put untested claims in the queue; don't turn implementation gaps into language rules.
4. Set the task to **DONE** only if its scope is complete, otherwise record the blocker, and add a UTC end/status timestamp. Update [MASTER.md](.agents/MASTER.md) and the marker below. Review `git status --short`, local links where applicable, and `git diff --check`.
5. Append to [CHANGELOG.md](.agents/CHANGELOG.md) **last**. Include the date, task ID, agent, change and verification. Keep large logs and artifacts out of Git.

**Last task recorded:** 2026-11-19 — TASK-018, branch verification and pull request handoff.
