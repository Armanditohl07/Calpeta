Clear-Host

Write-Host "========================================"
Write-Host "     GESTION DE PERMISOS - POWERSHELL"
Write-Host "========================================"
Write-Host ""
Write-Host "1. Mostrar permisos de un archivo"
Write-Host "2. Mostrar permisos de un usuario"
Write-Host "3. Cambiar permisos de un usuario"
Write-Host "4. Borrar permisos"
Write-Host "5. Mostrar propietario"
Write-Host "6. Cambiar propietario"
Write-Host "7. Mostrar estado de la herencia"
Write-Host "8. Activar o desactivar herencia"
Write-Host "9. Salir"
Write-Host ""

$opcion = Read-Host "Elige una opcion"

if ($opcion -eq "1") {

    $archivo = Read-Host "Ruta del archivo"

    $acl = Get-Acl -LiteralPath $archivo

    $acl.Access |
        Format-Table IdentityReference,
                     FileSystemRights,
                     AccessControlType,
                     IsInherited -AutoSize

    Pause
    exit
}

if ($opcion -eq "2") {

    $archivo = Read-Host "Ruta del archivo"
    $usuario = Read-Host "Usuario"

    $acl = Get-Acl -LiteralPath $archivo

    $acl.Access |
        Where-Object {
            $_.IdentityReference.ToString() -like "*$usuario*"
        } |
        Format-Table IdentityReference,
                     FileSystemRights,
                     AccessControlType,
                     IsInherited -AutoSize

    Pause
    exit
}

if ($opcion -eq "3") {

    $archivo = Read-Host "Ruta del archivo"
    $usuario = Read-Host "Usuario"

    Write-Host ""
    Write-Host "1. Lectura"
    Write-Host "2. Escritura"
    Write-Host "3. Modificacion"
    Write-Host "4. Ejecucion"

    $permiso = Read-Host "Elige un permiso"

    if ($permiso -eq "1") {
        $derecho = [System.Security.AccessControl.FileSystemRights]::Read
    }

    if ($permiso -eq "2") {
        $derecho = [System.Security.AccessControl.FileSystemRights]::Write
    }

    if ($permiso -eq "3") {
        $derecho = [System.Security.AccessControl.FileSystemRights]::Modify
    }

    if ($permiso -eq "4") {
        $derecho = [System.Security.AccessControl.FileSystemRights]::ExecuteFile
    }

    $acl = Get-Acl -LiteralPath $archivo

    $regla = New-Object System.Security.AccessControl.FileSystemAccessRule(
        $usuario,
        $derecho,
        "Allow"
    )

    $acl.SetAccessRule($regla)

    Set-Acl -LiteralPath $archivo -AclObject $acl

    Write-Host ""
    Write-Host "Permiso modificado."

    Pause
    exit
}

if ($opcion -eq "4") {

    $archivo = Read-Host "Ruta del archivo"

    $acl = Get-Acl -LiteralPath $archivo

    # Activa la herencia
    $acl.SetAccessRuleProtection($false, $true)

    # Borra los permisos explicitos
    $reglas = @($acl.Access | Where-Object {
        -not $_.IsInherited
    })

    foreach ($regla in $reglas) {
        $acl.RemoveAccessRuleSpecific($regla)
    }

    Set-Acl -LiteralPath $archivo -AclObject $acl

    Write-Host ""
    Write-Host "Permisos explicitos eliminados."

    Pause
    exit
}

if ($opcion -eq "5") {

    $archivo = Read-Host "Ruta del archivo"

    $acl = Get-Acl -LiteralPath $archivo

    Write-Host ""
    Write-Host "Propietario:"
    Write-Host $acl.Owner

    Pause
    exit
}

if ($opcion -eq "6") {

    $archivo = Read-Host "Ruta del archivo"
    $usuario = Read-Host "Nuevo propietario"

    $acl = Get-Acl -LiteralPath $archivo

    $propietario =
        New-Object System.Security.Principal.NTAccount($usuario)

    $acl.SetOwner($propietario)

    Set-Acl -LiteralPath $archivo -AclObject $acl

    Write-Host ""
    Write-Host "Propietario cambiado."

    Pause
    exit
}

if ($opcion -eq "7") {

    $archivo = Read-Host "Ruta del archivo o carpeta"

    $acl = Get-Acl -LiteralPath $archivo

    if ($acl.AreAccessRulesProtected) {
        Write-Host ""
        Write-Host "Herencia DESACTIVADA."
    }
    else {
        Write-Host ""
        Write-Host "Herencia ACTIVADA."
    }

    Pause
    exit
}

if ($opcion -eq "8") {

    $archivo = Read-Host "Ruta del archivo o carpeta"

    Write-Host ""
    Write-Host "1. Activar herencia"
    Write-Host "2. Desactivar herencia"

    $herencia = Read-Host "Elige una opcion"

    $acl = Get-Acl -LiteralPath $archivo

    if ($herencia -eq "1") {

        $acl.SetAccessRuleProtection(
            $false,
            $true
        )

        Set-Acl -LiteralPath $archivo -AclObject $acl

        Write-Host ""
        Write-Host "Herencia ACTIVADA."
    }

    if ($herencia -eq "2") {

        $acl.SetAccessRuleProtection(
            $true,
            $true
        )

        Set-Acl -LiteralPath $archivo -AclObject $acl

        Write-Host ""
        Write-Host "Herencia DESACTIVADA."
    }

    Pause
    exit
}

if ($opcion -eq "9") {
    exit
}

Write-Host "Opcion no valida."
Pause