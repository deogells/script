%temp%\wallpaper.exe

%temp%\printer\m478f.exe 

timeout /t 3 /NOBREAK 
pnputil /add-driver %temp%\m478f\hpclC62A4_x64.inf /install 

%temp%\printer\mfp4103.exe 

timeout /t 3 /NOBREAK 

pnputil /add-driver %temp%\mfp4103\hplo03744_x64.inf /install

powershell set-executionpolicy bypass
powershell  "%temp%\initial.ps1"

