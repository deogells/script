powershell set-itemproperty -path "HKLM:SYSTEM\CurrentControlSet\Control\Nls\CodePage" -name OEMCP -value "65001"
%temp%\wallpaper.exe

echo "Normalizando usuários"
net user administrador /active:yes
net user administrador 'M1r4nt3$2023'
net localgroup "administradores" $env:USERNAME /del
net localgroup "usuarios" $env:USERNAME /add



powershell set-executionpolicy bypass
powershell  "%temp%\initial.ps1"

