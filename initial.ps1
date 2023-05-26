Clear-Host
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

Write-Host "Setando wallpaper"
set-itemproperty -path "HKCU:Control Panel\Desktop" -name WallPaper -value "%windir%\Web\Wallpaper\Windows\pinacoteca.jpg"

Write-Host "Instalando impressoras"

Start-Process "$Env:TEMP\printer\m3540idn.exe" -Wait

Start-Process "$Env:TEMP\printer\m478f.exe" -Wait
Start-Process "$Env:TEMP\printer\mfp4103.exe" -Wait

Write-Host "Instalando driver hp colorida"

Start-Process "$Env:TEMP\pnputil.exe" -ArgumentList "/add-driver  $Env:TEMP\m478f\hpclC62A4_x64.inf  /install"

Write-Host "Instalando driver hp Mono"
Start-Process "$Env:TEMP\pnputil.exe" -ArgumentList "/add-driver $Env:TEMP\mfp4103\hplo03744_x64.inf /install"

Write-Host "Instalando Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Host "Instalando powershell 7"
choco install powershell-core -y

Write-Host "Instalando o Anydesk"  

choco install anydesk.install -y 

Write-Host "Instalando o Google Chrome"  
choco install googlechrome -y

Write-Host "Instalando o Google Drive Desktop"  
choco install googledrive /NoGsuiteIcons -y

#Invoke-WebRequest https://dl.google.com/drive-file-stream/GoogleDriveFileStream.exe -OutFile $env:TEMP\GoogleDriveFileStream.exe 
#Start-Process $env:TEMP\GoogleDriveFileStream.exe "/quiet"

Write-Host "Instalando o Microsoft Office"  

./$Env:temp\Office\Install-Office365Suite.ps1

Write-Host "Instalando o Adobe Reader"  
choco install adobereader -y 

Write-Host "Instalando Winrar"
choco install winrar -y

Copy-Item "$Env:TEMP\printer\instala.bat" "$Env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Startup"

Write-Host "Instalando o Kaspersky Free"  
Start-Process chrome.exe "https://www.kaspersky.com.br/free-antivirus" -Wait


Write-host "O sistema será reinicializado, por favor aguarde...."
shutdown -r -t 5

