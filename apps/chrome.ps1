$Url = "https://dl.google.com/chrome/install/standalone/enterprise/GoogleChromeEnterpriseBundle64.msi"
$Output = "$Env:TEMP\GoogleChrome.msi"
Invoke-WebRequest -Uri $Url -OutFile $Output
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $Output /quiet /norestart" -Wait