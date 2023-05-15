powershell Set-ExecutionPolicy bypass
powershell Start-Process powershell -Verb RunAs -ArgumentList "%temp%\pwsh.ps1", "-Wait" 
wt pwsh Start-Process powershell -Verb RunAs -ArgumentList "%temp%\initial.ps1"
exit
