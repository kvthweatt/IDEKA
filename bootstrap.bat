@echo off
echo
idkc idkc.idk
copy build\idkc\windows\release\idkc.exe idkc.exe /Y
idkc idkc.idk
copy build\idkc\windows\release\idkc.exe idkc.exe /Y
idkc idkc.idk

echo Copying IDEKA compiler executable to compiler root ...
copy build\idkc\windows\release\idkc.exe idkc.exe /Y

echo Copying IDEKA virtual machine executable to compiler root ...
copy build\idkvm\windows\release\idkvm.exe idkvm.exe /Y

echo Bootstrap complete!
echo Compile programs with `idkc program.idk`
echo Run IVM ASM with `idkvm program.ivm`