@echo off
chcp 65001 >nul
title Gestión de usuarios
color 0A

:menu
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
set /p opcion=Elige una opcion: 

if "%opcion%"=="1" goto mostrarusuarios
if "%opcion%"=="2" goto usuarioactual
if "%opcion%"=="3" goto crearusuario
if "%opcion%"=="4" goto borrarusuario
if "%opcion%"=="5" goto activarusuario
if "%opcion%"=="6" exit

goto menu


:mostrarusuarios
cls
echo === USUARIOS DEL SISTEMA ===
net user
echo.
pause
goto menu


:usuarioactual
cls
echo === USUARIO ACTUAL ===
echo %USERNAME%
echo.
pause
goto menu


:crearusuario
cls
set /p usuario=Introduce el nombre del nuevo usuario: 
set /p clave=Introduce una contrasena: 
net user "%usuario%" "%clave%" /add
echo.
pause
goto menu


:borrarusuario
cls
set /p usuario=Introduce el nombre del usuario que quieres borrar: 
net user "%usuario%" /delete
echo.
pause
goto menu


:activarusuario
cls
set /p usuario=Introduce el nombre del usuario: 
echo.
echo 1. Activar
echo 2. Desactivar
set /p estado=Elige una opcion: 

if "%estado%"=="1" net user "%usuario%" /active:yes
if "%estado%"=="2" net user "%usuario%" /active:no

echo.
pause
goto menu