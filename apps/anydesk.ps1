$Url = "https://download.anydesk.com/AnyDesk.exe"
$Output = "$env:TEMP\AnyDesk.exe"
Invoke-WebRequest -Uri $Url -OutFile $Output
Start-Process -FilePath $Output -ArgumentList '--install  “C:\Program Files (x86)\AnyDesk” --silent	 ' -Wait