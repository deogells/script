powershell set-itemproperty -path "HKLM:SYSTEM\CurrentControlSet\Control\Nls\CodePage" -name OEMCP -value "65001"
%systemdrive%\temp\wallpaper.exe

echo "Normalizando usuários"
net user administrador /active:yes
net user administrador 'M1r4nt3$2023'
net localgroup "administradores" %USERNAME% /del
net localgroup "usuários" %USERNAME% /add



powershell set-executionpolicy bypass
powershell  "%systemdrive%\temp\initial.ps1"

