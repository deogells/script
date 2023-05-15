$Url = "https://github.com/PowerShell/PowerShell/releases/download/v7.2.0/PowerShell-7.2.0-win-x64.msi"
$Output = "$Env:TEMP\PowerShell-7.2.0-win-x64.msi"
Invoke-WebRequest -Uri $Url -OutFile $Output
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i", $Output, "/quiet", "/norestart" -Wait

