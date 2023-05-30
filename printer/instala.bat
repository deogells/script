
powershell Set-ExecutionPolicy bypass

powershell Start-process powershell -Verb runAS %temp%\printer\add-printer.ps1 -wait


