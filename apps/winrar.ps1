$Url = "http://rarlab.com/rar/winrar-x64-601pt.exe"
$Output = "C:\Temp\WinRAR.exe"
Invoke-WebRequest -Uri $Url -OutFile $Output
Start-Process -FilePath $Output -ArgumentList "/S" -Wait