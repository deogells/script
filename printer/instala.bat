
powershell Set-ExecutionPolicy bypass -Scope CurrentUser

powershell Start-Process "$Env:SystemDrive\temp\printer\add-printer.exe" -Verb runAs


 	