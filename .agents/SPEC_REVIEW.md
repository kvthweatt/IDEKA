# IDEKA specification review

Reviewed against the [specification](../docs/Specs/language_specification.md) in this checkout. This is an index of implementation owners by section family, not a claim that every clause was run. Reproduce the nearest case and follow the actual import or call graph before editing.

| Spec sections | Where to investigate | Evidence or gap |
| --- | --- | --- |
| Functions, variadics, error returns, chaining, overloads and calling conventions | Parser, symbol/type resolver, codegen and backend ABI | Basic `main` and one libc call tested. Variadic/aggregate ABI, error unions and chaining are not covered by those tests. |
| Imports, preprocessor, packages, namespaces, modules/build tags | Preprocessor, module resolver, package manager, DCE | Standard library import and the compiler/VM module build exercised; no broad package or build-lock coverage. |
| Structs, recast, objects, cleanup, inheritance, traits, interfaces and visibility | Parser, semantic checks, codegen and runtime | Reading example exercises a struct through a pointer. Protocol permissions and lifecycle clauses remain untested here. |
| Strings and interpolation; stringification/codification | Lexer/parser, codegen, runtime, comptime VM | Reading example interpolates fields; `emitideka` probe uses a codified value. Other string forms and splicing untested. |
| Pointers, casts, `data`, endianness, layout, bitfields/slices/indexing, built-ins, arrays | Type system, coercions and target lowering | Basic operations passed; explicit/default byte order diverged. See [ERR-006](ERRORS.md). Do not infer aggregate layout, unusual widths, or `sizeof` behavior. |
| Control flow, recursion, exceptions, enums, unions, dictionaries, assertions, allocations | Parser, codegen and runtime helpers | Simple loops, conditionals and checked array access in the example only (index bounds controlled by the example, not demonstrated language-enforced bounds). |
| Ditto, custom/variadic operators, contracts, macros, type functions and templates | Parser, semantic/type checks and codegen | Two binary custom forms and one undeclared-word rejection tested. Other forms, constraints and precedence are not validated by those cases. |
| Function pointers, callbacks, raw bytecode, ownership and borrow analysis | Type/ABI layer, codegen, VM and borrow checker | Single tie, reuse rejection and scoped alias probe tested. Callback ABI and detailed escape/lifetime rules untested. |
| `comptime`, code generation, async, effects, keyword/operator appendices | VM and VM lowering, async/effect analysis, lexer/parser | Compile-time loop and one emitted function tested; concurrency, effect policies and comprehensive operator precedence not covered. |

Use the [source map](SOURCE_MAP.md) for file paths and [verified docs](DOCS.md) for what was actually checked. [Test records](TESTS.md) preserve expected versus observed results. The broken `Variadic Operators` table-of-contents link was corrected to the existing `variadic-operators` anchor; neither the byte-order rule nor compiler behavior was silently changed.
