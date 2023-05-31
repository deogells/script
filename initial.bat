%temp%\printer\m478f.exe 

timeout /t 3 /NOBREAK 
pnputil.exe /add-driver %temp%\m478f\hpclC62A4_x64.inf /install 

%temp%\printer\mfp4103.exe 

timeout /t 3 /NOBREAK 

pnputil.exe /add-driver %temp%\mfp4103\hplo03744_x64.inf /install

powershell Set-ExecutionPolicy bypass 
powershell set-itemproperty -path "HKLM:SYSTEM\CurrentControlSet\Control\Nls\CodePage" -name OEMCP -value "65001"

powershell "%temp%\initial.ps1"
