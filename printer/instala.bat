
powershell Set-ExecutionPolicy bypass -Scope CurrentUser

powershell Start-Process powershell.exe -Verb runAs -ArgumentList "$Env:TEMP\printer\add-printer.ps1"


 	