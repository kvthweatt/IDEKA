@echo off
echo [1/5] Bootstrapping ... Stage 1 - Compiler
idkc idkc.idk
copy build\idkc\Windows\Release\idkc.exe idkc.exe /Y
echo [2/5] Bootstrapping ... Stage 1 - Compiler
idkc idkc.idk
copy build\idkc\Windows\Release\idkc.exe idkc.exe /Y
echo [3/5] Bootstrapping ... Stage 1 - Compiler
idkc idkc.idk

echo Copying IDEKA compiler executable to compiler root ...
copy build\idkc\Windows\Release\idkc.exe /Y

echo Copying IDEKA virtual machine executable to compiler root ...
copy build\idkvm\Windows\Release\idkvm.exe /Y

echo [4/5] Bootstrapping ... Stage 2 - Assembler
idkc iasm_main.idk
echo Copying IDEKA assembler executable to compiler root ...
copy build\iasm\Windows\Release\iasm.exe /Y

echo [5/5] Bootstrapping ... Stage 3 - Linker
idkc ilink_main.idk
echo Copying IDEKA linker executable to compiler root ...
copy build\ilink\Windows\Release\ilink.exe /Y

echo Bootstrap complete!
echo Compile programs with `idkc program.idk`
echo Run IVM ASM with `idkvm program.ivm`
echo
echo The IDEKA compiler binary is standalone, containing the IDKVM, assembler, and linker.
echo