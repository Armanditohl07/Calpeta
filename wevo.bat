echo off

setlocal

title Menu de opciones
::Limpiar la pantalla
cls

:: mostrar el menu
echo --------------------
echo   MENo DE OPCIONES
echo --------------------
echo 1. opcion 1: Saludo Chorra
echo 2. opcion 2: DIR
echo 3. opcion 3: Mostrar fecha y hora
echo 4. salir
echo --------------------

::solicitar al usuario que seleccione una opci½n
set /p "opcion=Selecciona una opci½n (1-4): "

::evaluar la opci½n seleccionada
if "%opcion%"=="1" (
   :: Opci¢n 1: Saludo Chorra
   echo Hola, pringaos !!
   endlocal
   exit /B 0
)
if "%opcion%"=="2" (
   :: Opci¢n 2: DIR
   dir
   endlocal
   exit /B 0
)
if "%opcion%"=="3" (
   :: Opci¢n 3: Mostrar fecha y hora
   echo La fecha y hora actual es: date /t && time /t
   endlocal
   exit /B 0
)
if "%opcion%"=="4" (
   :: Opci¢n 4: Salir
   echo Saliendo del programa...
   endlocal
   exit /B 0
)

endlocal
exit /B 0