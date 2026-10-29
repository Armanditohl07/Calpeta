@echo off
setlocal

title Copiar archivo

set /p "archivo=Escribe el archivo que quieres copiar: "
set /p "ruta=Escribe la ruta de destino: "

copy "%archivo%" "%ruta%"

echo.
echo Archivo copiado correctamente.

endlocal
pause
exit /B 0