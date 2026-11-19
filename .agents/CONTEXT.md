# IDEKA — verified context

Scope: this checkout, Linux x86-64, native default x64 backend, compiler banner **Crimson Cobra v2.2.1**. Do not generalize to another release, backend or implementation. See [SOURCE_MAP.md](SOURCE_MAP.md) for source and spec references that are not test claims.

## Verified facts

| Observation | Evidence |
| --- | --- |
| The native compiler built the current `idkc.idk` into native `idkc` and `idkvm`. The new compiler compiled and ran both smoke programs. | [TEST-003](TESTS.md#test-003-native-bootstrap-and-focused-runner), [version.idk](../version.idk) |
| A program using `#import <standard.idk>;`, `using standard::io::console;`, and `def main() -> int` printed `Hello World!` and exited zero. | [TEST-002](TESTS.md#test-002-native-hello-world-and-language-smoke), [fixture](../examples/helloworld.idk) |
| The smoke fixture assigned a local's address with `@=`, updated it through `*`, tested the pointer with `!?`, evaluated the bitwise AND of `0x106` and `0x103` as `0x102` on the declared `unsigned data{16::0}` alias, and used the fallback of `??` for a zero left operand. It printed the success marker and exited zero. This is not a proof of general layout, coercion or precedence rules. | [TEST-002](TESTS.md#test-002-native-hello-world-and-language-smoke), [fixture](../tests/language_smoke.idk) |
| The default Linux x64 path assembled and linked the smoke fixture without standalone `iasm` or `ilink` on `PATH`. | [prior restricted-PATH check](CHANGELOG.md#2026-11-19--focused-agent-intake-and-issue-triage), [idkc.idk](../idkc.idk) |
| A compile-time loop emitted a native function returning 21 via `emitideka` and `~$f"..."`. The same fragment with `emitflux` was rejected. | [TEST-007](TESTS.md#test-007-compiler-integrated-vm-and-emission) |
| Declared binary `+++` and declared word `AGENT_SUM` both evaluated to 10 for operands 5 and 3 in the paired fixture. Removing the word declaration caused a syntax diagnostic. | [TEST-008](TESTS.md#test-008-custom-operators) |
| A tied value passed once; reuse was rejected. The alias fixture ran by default, failed under `--borrowcheck`, and warned but ran under `--borrowcheck-warn`. | [TEST-009](TESTS.md#test-009-tie-reuse-and-borrow-flags) |
| Native Linux x86-64 `extern def !!` called libc `abs` and `puts` for the tested signatures. | [TEST-010](TESTS.md#test-010-linux-x64-c-abi-call) |

## Unverified / needs testing

See the [spec review](SPEC_REVIEW.md) for untested type, operator, VM, ownership, ABI and tooling cases. The supplied prompt is not evidence: do not import its release name/date, compiler speed, blanket interop claims, or the `emitflux` spelling as current facts. The [spec documents `emitideka`](../docs/Specs/language_specification.md#emitideka); the tested native fragment is not a guarantee for other implementations or forms. See [ERRORS.md](ERRORS.md) for known inconsistencies and test blockers.
