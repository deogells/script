$pcname = Read-Host "Digite o nome do PC"
Rename-Computer -NewName $pcname

Write-Host "Habilitando o powershell remote e execução de scripts"
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name PSWindowsUpdate -Force
Enable-PSRemoting -SkipNetworkProfileCheck -Force
Set-ExecutionPolicy bypass

Write-Host "Alterando o perfil de rede"
Set-NetConnectionProfile -name "Instituto_Mirante" -NetworkCategory private

Write-Host "Normalizando usuários"
net user administrador /active:yes
net user administrador "M1r4nt3$2023"
net localgroup "administradores" $env:USERNAME /del
net localgroup "usuários" $env:USERNAME /add


Write-Host "Instalando o Anydesk"  

choco install anydesk.install -y 

Write-Host "Instalando o Google Chrome"  
choco install googlechrome -y

Write-Host "Instalando o Google Drive Desktop"  
Invoke-WebRequest https://dl.google.com/drive-file-stream/GoogleDriveFileStream.exe -OutFile $env:TEMP\GoogleDriveFileStream.exe 
Start-Process $env:TEMP\GoogleDriveFileStream.exe "/quiet"

Write-Host "Instalando o Microsoft Office"  
choco install office365bussiness -y

Write-Host "Instalando o Adobe Reader"  
choco install adobereader -y 

Write-Host "Instalando o Kaspersky Free"  
Start-Process chrome.exe "https://www.kaspersky.com.br/free-antivirus"   


Write-Host "Instalando impressoras"  

Add-PrinterPort -Name "TCPPort1:" -PrinterHostAddress "192.168.88.5" -ErrorAction SilentlyContinue
Add-PrinterPort -Name "TCPPort2:" -PrinterHostAddress "192.168.88.6" -ErrorAction SilentlyContinue

Add-printerDriver -name "Microsoft XPS Class Driver"

$PrinterRecepcao = @{
    DriverName = "Microsoft XPS Class Driver"
    Name       = "Kyocera M3540idn - RECEPÇÃO" 
    PortName   = (Get-PrinterPort -Name TCPPort1:*).Name
    Verbose    = $true
}
$PrinterDP = @{
    DriverName = "Microsoft XPS Class Driver"
    Name       = "HP Color Laserjet - DP" 
    PortName   = (Get-PrinterPort -Name TCPPort2:*).Name
    Verbose    = $true
}

Add-Printer @PrinterDP

Add-Printer @PrinterRecepcao


 Unblock-File -Path $Env:TEMP\printer\printerFIN.ps1  
.\printer\printerFIN.ps1  
Unblock-File -Path $Env:TEMP\printer\printerPROT.ps1  
.\printer\printerPROT.ps1  



