@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion
title Gestion de permisos - CMD

cls
echo =====================================
echo       GESTION DE PERMISOS - CMD
echo =====================================
echo.
echo 1. Mostrar permisos de un archivo
echo 2. Mostrar permisos de un usuario
echo 3. Cambiar permisos de un usuario
echo 4. Borrar/restablecer permisos
echo 5. Mostrar propietario
echo 6. Cambiar propietario
echo 7. Mostrar estado de la herencia
echo 8. Activar o desactivar herencia
echo 9. Salir
echo.

set /p "opcion=Elige una opcion: "

if "%opcion%"=="1" (
    cls
    set /p "archivo=Ruta del archivo: "
    echo.
    icacls "!archivo!"
    echo.
    echo R  = Lectura
    echo W  = Escritura
    echo M  = Modificacion
    echo RX = Lectura y ejecucion
    echo F  = Control total
    pause
    exit /b
)

if "%opcion%"=="2" (
    cls
    set /p "archivo=Ruta del archivo: "
    set /p "usuario=Usuario: "
    echo.
    icacls "!archivo!" | findstr /I /C:"!usuario!"
    echo.
    pause
    exit /b
)

if "%opcion%"=="3" (
    cls
    set /p "archivo=Ruta del archivo: "
    set /p "usuario=Usuario: "

    echo.
    echo 1. Lectura
    echo 2. Escritura
    echo 3. Modificacion
    echo 4. Ejecucion
    echo.
    set /p "permiso=Elige un permiso: "

    if "!permiso!"=="1" (
        icacls "!archivo!" /grant:r "!usuario!:R"
    )

    if "!permiso!"=="2" (
        icacls "!archivo!" /grant:r "!usuario!:W"
    )

    if "!permiso!"=="3" (
        icacls "!archivo!" /grant:r "!usuario!:M"
    )

    if "!permiso!"=="4" (
        icacls "!archivo!" /grant:r "!usuario!:(X)"
    )

    echo.
    pause
    exit /b
)

if "%opcion%"=="4" (
    cls
    set /p "archivo=Ruta del archivo: "
    echo.
    icacls "!archivo!" /reset
    echo.
    pause
    exit /b
)

if "%opcion%"=="5" (
    cls
    set /p "archivo=Ruta del archivo: "
    echo.
    dir /q "!archivo!"
    echo.
    pause
    exit /b
)

if "%opcion%"=="6" (
    cls
    set /p "archivo=Ruta del archivo: "
    set /p "usuario=Nuevo propietario: "
    echo.
    icacls "!archivo!" /setowner "!usuario!"
    echo.
    pause
    exit /b
)

if "%opcion%"=="7" (
    cls
    set /p "archivo=Ruta del archivo o carpeta: "
    echo.

    icacls "!archivo!" | findstr /C:"(I)" >nul

    if !errorlevel! equ 0 (
        echo Herencia ACTIVADA.
    ) else (
        echo No se han detectado permisos heredados.
    )

    echo.
    pause
    exit /b
)

if "%opcion%"=="8" (
    cls
    set /p "archivo=Ruta del archivo o carpeta: "

    echo.
    echo 1. Activar herencia
    echo 2. Desactivar herencia
    echo.
    set /p "herencia=Elige una opcion: "

    if "!herencia!"=="1" (
        icacls "!archivo!" /inheritancelevel:e
    )

    if "!herencia!"=="2" (
        icacls "!archivo!" /inheritancelevel:d
    )

    echo.
    pause
    exit /b
)

if "%opcion%"=="9" (
    exit /b
)

echo Opcion no valida.
pause
exit /b