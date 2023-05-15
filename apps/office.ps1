$Url = "https://go.microsoft.com/fwlink/?linkid=871783"
$Output = "$Env:TEMP\Office365.exe"
Invoke-WebRequest -Uri $Url -OutFile $Output
Start-Process -FilePath $Output -ArgumentList "/configure Configuration.xml" -Wait