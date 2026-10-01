@echo off 

SETLOCAL 

title Mi primer script en batch
set /p nombre=Escribe tu nombre:
set /p oracion=Escribe una oraci¢n:
> oracion.txt echo %oracion%

echo %nombre%, has guardado la oraci¢n en el archivo oracion.txt. El texto que escribiste es: %oracion%







ENDLOCAL

exit /B 0