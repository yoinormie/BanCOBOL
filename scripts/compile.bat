@echo off
echo Compilando programas COBOL...

REM Ruta al config de GnuCOBOL
set COB_CONFIG_PATH=C:\msys64\mingw64\share\gnucobol\config

REM Carpetas
set SRC_DIR=src
set BIN_DIR=bin
set COPY_DIR=copybooks

REM Crear carpeta bin si no existe
if not exist %BIN_DIR% (
    mkdir %BIN_DIR%
)

REM Bucle por cada archivo .cob en src
for %%F in (%SRC_DIR%\*.cob) do (
    echo Compilando %%~nxF ...
    cobc -x ^
        -conf=%COB_CONFIG_PATH%\default.conf ^
        -o %BIN_DIR%\%%~nF.exe ^
        %%F ^
        -I %COPY_DIR%
)

echo.
echo Compilación finalizada
pause
