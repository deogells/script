
powershell Set-ExecutionPolicy bypass -Scope CurrentUser

powershell Start-Process powershell.exe -Verb runAs -ArgumentList "$Env:SystemDrive\printer\add-printer.ps1"


 	