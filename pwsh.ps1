$Url = "https://github.com/PowerShell/PowerShell/releases/download/v7.3.4/PowerShell-7.3.4-win-x64.msi"
$Output = "$Env:TEMP\PowerShell-7.3.4-win-x64.msi"
Invoke-WebRequest -Uri $Url -OutFile $Output
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i", $Output, "/quiet", "/norestart" -Wait

Write-Host "Instalando o Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
