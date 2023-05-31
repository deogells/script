
powershell Set-ExecutionPolicy bypass -Scope CurrentUser

runas /noprofile /user:administrador "powershell.exe -command %temp%\printer\add-printer.ps1"


