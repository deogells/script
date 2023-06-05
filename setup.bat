@CHCP 65001 >NUL
@echo off

 echo "Normalizando usuários"
 net user administrador /active:yes
 net user administrador "M1r4nt3$2023"
 net localgroup "administradores" %USERNAME% /del
 net localgroup "usuários" %USERNAME% /add

"%systemdrive%\temp\printer\mfp4103.exe"
"%systemdrive%\temp\printer\m478f.exe"
"%systemdrive%\temp\initial.exe"