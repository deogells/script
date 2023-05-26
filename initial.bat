%temp%\printer\m478f.exe 

timeout /t /NOBREAK 3
pnputil.exe /add-driver %temp%\m478f\hpclC62A4_x64.inf /install 

%temp%\printer\mfp4103.exe 

timeout /t /NOBREAK 3

pnputil.exe /add-driver %temp%\mfp4103\hplo03744_x64.inf /install

powershell Set-ExecutionPolicy bypass 

powershell "%temp%\initial.ps1"
