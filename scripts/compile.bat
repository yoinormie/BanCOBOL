@echo off
echo Compilando proyecto COBOL...

set COB_CONFIG_PATH=C:\msys64\mingw64\share\gnucobol\config
set SRC=src\main.cob
set OUT=bin\main.exe

if not exist bin (
    mkdir bin
)

cobc -x -conf=%COB_CONFIG_PATH%\default.conf -o %OUT% %SRC%

echo Compilación finalizada
pause
