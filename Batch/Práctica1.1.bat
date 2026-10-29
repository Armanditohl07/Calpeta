@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion
title Gestion de usuarios

cls
echo ==============================
echo      GESTION DE USUARIOS
echo ==============================
echo.
echo 1. Mostrar usuarios del sistema
echo 2. Mostrar usuario actual
echo 3. Crear usuario
echo 4. Borrar usuario
echo 5. Activar o desactivar usuario
echo 6. Salir
echo.

set /p "opcion=Elige una opcion: "

if "%opcion%"=="1" (
    cls
    echo === USUARIOS DEL SISTEMA ===
    net user
    echo.
    pause
    exit /b
)

if "%opcion%"=="2" (
    cls
    echo === USUARIO ACTUAL ===
    echo %USERNAME%
    echo.
    pause
    exit /b
)

if "%opcion%"=="3" (
    cls
    set /p "usuario=Introduce el nombre del nuevo usuario: "
    set /p "clave=Introduce una contrasena: "
    net user "!usuario!" "!clave!" /add
    echo.
    pause
    exit /b
)

if "%opcion%"=="4" (
    cls
    set /p "usuario=Introduce el nombre del usuario que quieres borrar: "
    net user "!usuario!" /delete
    echo.
    pause
    exit /b
)

if "%opcion%"=="5" (
    cls
    set /p "usuario=Introduce el nombre del usuario: "
    echo.
    echo 1. Activar
    echo 2. Desactivar
    set /p "estado=Elige una opcion: "

    if "!estado!"=="1" (
        net user "!usuario!" /active:yes
    )

    if "!estado!"=="2" (
        net user "!usuario!" /active:no
    )

    echo.
    pause
    exit /b.
)

if "%opcion%"=="6" (
    exit /b
)

echo Opcion no valida.
pause
exit /b                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       