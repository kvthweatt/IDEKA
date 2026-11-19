> Historical tree. For the inventory of this checkout and current entry points, use the [source map](.agents/SOURCE_MAP.md).

```
root dir  
|  
|-- build\              // all programs build here:  build\program\program.ll IR output  
|-- build\tmp.idk        // Preprocessor temporary output for builds  
|-- config\             // All configuration  
|-- config\IDEKA_configuration.cfg // Compiler configuration  
|-- docs\               // All docoumentation  
|-- examples\           // Battle-tested production ready working examples  
|-- scripts\            // Scripts like run_tests.py, compiles all test files in tests\  
|-- tests\              // All IDEKA source file (.idk) testing (weird_test.idk, 64bit_test.idk)  
|-- src\                // Compiler & Standard Library source  
|-- src\stdlib\         // Standard Library source  
|-- src\compiler\       // Compiler source
|   `--> imacros.py     // Compiler macros  
|   `--> ierrors.py     // Compiler errors  
|   `--> iast.py        // AST  
|   `--> ipreprocess.py // Preprocessor  
|   `--> ilexer.py      // Lexer  
|   `--> iparser.py     // Parser  
|   `--> idce.py        // Dead code elimination module
|	`--> itypesys.py    // Type System  
|   `--> icodegen.py    // Code Generation
|   `--> ivmcodegen.py  // FVM Code Generation
|	`--> futilities.py  // Utility functions  
|	`--> ilogger.py     // Logging  
|	`--> iconfig.py     // Config helper  
|   `--> ic.py          // Compiler front-end  
|  
`--> idkc.py             // Compiler front-end entrypoint, root, calls to ic.py in src\compiler\
`--> idkbc.py             // Borrow Checker
`--> ibc_alias.py       // Alias map and violation detection
`--> ibc_report.py      // Violation reporting
`--> ipm.py             // IDEKA Package Manager
`--> idkvm.py             // IDEKA Virtual Machine for comptime execution of IDEKA code & REPL
`--> idkvm_test.py        // Tests the FVM
`--> frepl.py           // REPL for IDEKA, uses the FVM
`--> tg.py              // Type geometry visualizer
`--> scripts/cit.py     // C->IDEKA translation utility
```