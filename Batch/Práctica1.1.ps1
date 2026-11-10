Clear-Host

Write-Host "=============================="
Write-Host "     GESTION DE USUARIOS"
Write-Host "=============================="
Write-Host ""
Write-Host "1. Mostrar todos los usuarios"
Write-Host "2. Mostrar usuario actual"
Write-Host "3. Crear usuario"
Write-Host "4. Eliminar usuario"
Write-Host "5. Activar o desactivar usuario"
Write-Host "6. Salir"
Write-Host ""

$opcion = Read-Host "Elige una opcion"

switch ($opcion) {

    "1" {
        Get-LocalUser
    }

    "2" {
        Write-Host "Usuario actual:"
        Write-Host $env:USERNAME
    }

    "3" {
        $usuario = Read-Host "Introduce el nombre del usuario"
        $clave = Read-Host "Introduce la contraseña" -AsSecureString

        New-LocalUser -Name $usuario -Password $clave

        Write-Host "Usuario creado correctamente."
    }

    "4" {
        $usuario = Read-Host "Introduce el usuario que quieres eliminar"

        Remove-LocalUser -Name $usuario

        Write-Host "Usuario eliminado."
    }

    "5" {
        $usuario = Read-Host "Introduce el nombre del usuario"

        Write-Host "1. Activar usuario"
        Write-Host "2. Desactivar usuario"

        $estado = Read-Host "Elige una opcion"

        if ($estado -eq "1") {
            Enable-LocalUser -Name $usuario
            Write-Host "Usuario activado."
        }

        if ($estado -eq "2") {
            Disable-LocalUser -Name $usuario
            Write-Host "Usuario desactivado."
        }
    }

    "6" {
        exit
    }

    default {
        Write-Host "Opcion no valida."
    }
}