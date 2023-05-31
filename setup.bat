@CHCP 65001 >NUL
@echo off
%systemdrive%\temp\wallpaper.exe

 echo "Normalizando usuários"
 net user administrador /active:yes
 net user administrador "M1r4nt3$2023"
 net localgroup "administradores" %USERNAME% /del
 net localgroup "usuários" %USERNAME% /add

powershell set-executionpolicy bypass
powershell  "%systemdrive%\temp\initial.ps1"

