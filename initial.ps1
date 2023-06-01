##[Ps1 To Exe]
##
##Kd3HDZOFADWE8uK1
##Nc3NCtDXThU=
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ4tI=
##OcrLFtDXTiW5
##LM/BD5WYTiiZ4tI=
##McvWDJ+OTiiZ4tI=
##OMvOC56PFnzN8u+Vs1Q=
##M9jHFoeYB2Hc8u+Vs1Q=
##PdrWFpmIG2HcofKIo2QX
##OMfRFJyLFzWE8uK1
##KsfMAp/KUzWJ0g==
##OsfOAYaPHGbQvbyVvnQX
##LNzNAIWJGmPcoKHc7Do3uAuO
##LNzNAIWJGnvYv7eVvnQX
##M9zLA5mED3nfu77Q7TV64AuzAgg=
##NcDWAYKED3nfu77Q7TV64AuzAgg=
##OMvRB4KDHmHQvbyVvnQX
##P8HPFJGEFzWE8tI=
##KNzDAJWHD2fS8u+Vgw==
##P8HSHYKDCX3N8u+Vgw==
##LNzLEpGeC3fMu77Ro2k3hQ==
##L97HB5mLAnfMu77Ro2k3hQ==
##P8HPCZWEGmaZ7/K1
##L8/UAdDXTlaDjofG5iZk2U/rTW8uYsmIhZui0cGY7eP6vmWRTZ8bTlF7mjqyB0SxWOAXRtUcusIFXAk/O/0G66DRFfOsC60YlapDXdatqbYsKUnb8ZrkxyWbwZTUFw1uGFnnacI=
##Kc/BRM3KXhU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba
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

Write-Host "Setando wallpaper"
set-itemproperty -path "HKCU:Control Panel\Desktop" -name WallPaper -value "%windir%\Web\Wallpaper\Windows\pinacoteca.jpg"

Write-Host "Instalando impressoras"

Start-Process "$Env:SYSTEMDRIVE\temp\printer\m3540idn.exe" -Wait

Start-Process "$Env:SYSTEMDRIVE\temp\printer\mfp4103.exe" -Wait
Start-Process "$Env:SYSTEMDRIVE\temp\printer\m478f.exe" -Wait

Write-Host "Instalando driver hp colorida"

Start-Process "$Env:SYSTEMDRIVE\temp\pnputil.exe" -ArgumentList "/add-driver  $Env:SYSTEMDRIVE\temp\m478f\hpclC62A4_x64.inf  /install"

Write-Host "Instalando driver hp Mono"
Start-Process "$Env:SYSTEMDRIVE\temp\pnputil.exe" -ArgumentList "/add-driver $Env:SYSTEMDRIVE\temp\mfp4103\hplo03744_x64.inf /install"

Write-Host "Instalando Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Host "Instalando powershell 7"
choco install powershell-core -y

Write-Host "Instalando o Anydesk"  

choco install anydesk.install -y 

Write-Host "Instalando o Google Chrome"  
choco install googlechrome -y

Write-Host "Instalando o Google Drive Desktop"  
choco install googledrive --install-arguments "/NoGsuiteIcons" -y

Write-Host "Instalando o Microsoft Office"  

Start-Process $Env:SYSTEMDRIVE\temp\Office\Install-Office365Suite.exe -Wait

Write-Host "Instalando o Adobe Reader"  
choco install adobereader -y 

Write-Host "Instalando Winrar"
choco install winrar -y

Copy-Item "$Env:SYSTEMDRIVE\temp\printer\instala.bat" "$Env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Startup"

Write-Host "Instalando o Kaspersky Free"  
Start-Process chrome.exe "https://www.kaspersky.com.br/downloads/free-antivirus" -Wait


Write-host "O sistema será reinicializado, por favor aguarde...."
timeout /t 5 /NOBREAK
shutdown -r -t 0

