# IDEKA — verified documentation index

Last tested: 2026-11-19. This is an index of demonstrated behavior, not a replacement for the [language specification](../docs/Specs/language_specification.md). The verified sections were [cross-checked against the specification](SPEC_REVIEW.md) on 2026-11-19. This is not exhaustive language conformance. Record any mismatch in [ERRORS.md](ERRORS.md). Untested features belong in the queue or source map, not in verified examples.

## Native Hello World

- **Status:** Verified — Linux x86-64 native default backend. **Source:** [TEST-002](TESTS.md#test-002-native-hello-world-and-language-smoke), [function specification](../docs/Specs/language_specification.md#functions).
- **Description and syntax:** [examples/helloworld.idk](../examples/helloworld.idk) imports the standard library, brings the console namespace into scope, calls `println` and returns `0` from `main`.
- **Verified behavior:** The executable printed `Hello World!` and returned zero with both bundled and rebuilt compilers. **Gotcha:** Run the executable; parsing the example alone is not equivalent.

## Native self-build and language smoke

- **Status:** Verified — Linux x86-64 native default backend. **Source:** [TEST-002](TESTS.md#test-002-native-hello-world-and-language-smoke), [TEST-003](TESTS.md#test-003-native-bootstrap-and-focused-runner), [operator reference](../docs/operator_reference.md).
- **Description and syntax:** The [developer workflow](../docs/developer_workflow.md#rebuild-and-test-the-native-compiler) builds `idkc.idk` and runs [language_smoke.idk](../tests/language_smoke.idk) with the rebuilt compiler. The fixture is the minimal working example for the cases listed in [CONTEXT.md](CONTEXT.md#verified-facts).
- **Verified behavior:** Both native tools were produced; the rebuilt compiler's smoke executable returned zero and printed `IDEKA language smoke passed`. The focused native runner found, compiled and ran one case. **Gotchas:** The native runner is not `scripts/run_tests.py`. Neither test attests to the LLVM backend, other targets, or the entire language.

## Primitive expressions and byte order

- **Status:** Verified for tested primitive expressions; **divergence** for byte order. **Source:** [primitive types](../docs/Specs/language_specification.md#primitive-types), [endianness](../docs/Specs/language_specification.md#endianness-handling), [TEST-006](TESTS.md#test-006-primitive-expressions-and-byte-order-discrepancy).
- **Syntax and verified behavior:** [types.idk](../tests/agent_checks/types.idk) checks bool, byte, char, signed and unsigned integer, and float/double expressions, including backtick bitwise AND/OR. This is not a layout or full numeric-conversion reference.
- **Gotcha:** [byte_order.idk](../tests/agent_checks/byte_order.idk) reads actual bytes of three 16-bit values; [ERR-006](ERRORS.md) records the mismatch. Do not use the observed result as a portable language rule.

## Compile-time execution and generated functions

- **Status:** Verified on native Linux x86-64. **Source:** [spec: `emitideka`](../docs/Specs/language_specification.md#emitideka), [TEST-007](TESTS.md#test-007-compiler-integrated-vm-and-emission).
- **Syntax and verified behavior:** [comptime.idk](../tests/agent_checks/comptime.idk) uses a compile-time loop to sum 1–6 and `emitideka` with `~$f"{total}"` to inject that value into a function. `main` calls the result, checks 21 and prints it.
- **Gotcha:** Replacing the keyword with `emitflux` was rejected in this fragment; do not copy the old spelling from onboarding prose.

## Custom binary operators

- **Status:** Verified for two binary forms. **Source:** [spec](../docs/Specs/language_specification.md#custom-operators-and-overloading), [TEST-008](TESTS.md#test-008-custom-operators).
- **Syntax and verified behavior:** [operators.idk](../tests/agent_checks/operators.idk) declares `operator (int left, int right) [+++] -> int`. Both `+++` and a same-body `AGENT_SUM` generated variant produce 10 at runtime with operands 5 and 3.
- **Gotcha:** Undeclared word forms and punctuation are not interchangeable. Punctuation can be parsed as existing operators when no custom declaration matches.

## Tied values and borrow-checking modes

- **Status:** Verified for one tied-value flow and one live alias case. **Source:** [tie operator](../docs/Specs/language_specification.md#ownership-with-the-tie-operator), [TEST-009](TESTS.md#test-009-tie-reuse-and-borrow-flags).
- **Syntax and verified behavior:** In [tie_reuse.idk](../tests/agent_checks/tie_reuse.idk), one `take(~value)` succeeds in the single-use variant and the second use is rejected. [borrow_alias.idk](../tests/agent_checks/borrow_alias.idk) is rejected only with the blocking borrow flag in this test; warn mode emits a diagnostic and still runs.
- **Gotcha:** `~` handling and opt-in alias analysis are distinct. None of this implies global memory safety.

## C interop and translation

- **Status:** Verified for tested Linux x64 C calls and for a manually adapted translation. **Source:** [FFI spec](../docs/Specs/language_specification.md#external-functions-ffi), [TEST-010](TESTS.md#test-010-linux-x64-c-abi-call), [TEST-012](TESTS.md#test-012-c-translation).
- **Syntax and verified behavior:** [ffi.idk](../tests/agent_checks/ffi.idk) uses `extern def !!` to call libc `abs` and `puts`. The [C fixture](../tests/agent_checks/translate.c) translates with `scripts/cit.py`; after the documented entry-point adaptation its result matches the original executable.
- **Gotcha:** Raw translated output did not link as an executable. The result says nothing about aggregate ABI, callbacks, headers or other platforms.

## Reading summary example

- **Status:** Verified on native Linux x86-64. **Source:** [structs](../docs/Specs/language_specification.md#structs), [loops](../docs/Specs/language_specification.md#loops), [TEST-013](TESTS.md#test-013-reading-summary-example).
- **Syntax and verified behavior:** [reading_summary.idk](../examples/reading_summary.idk) loops over five fixed readings, writes a `Summary` via a pointer, and checks the empty-input path. The nonempty run prints `min 18, max 25, total 105, above limit 3`.
- **Gotcha:** The caller supplies a valid array and count; the example does not establish general bounds or overflow safety.
