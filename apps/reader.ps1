$Url = "https://get.adobe.com/br/reader/download/?installer=Reader_DC_2022.001.20169_Portuguese_for_Windows&os=Windows%2010&browser_type=KHTML&browser_dist=Chrome&dualoffer=false&mdualoffer=true&stype=7732&d=McAfee_Security_Scan_Plus&a=McAfee_Security_Scan_Plus&dualoffer=false&mdualoffer=true"
$Output = "$Env:TEMP\AdobeReader.exe"
Invoke-WebRequest -Uri $Url -OutFile $Output
Start-Process -FilePath $Output -ArgumentList "/sAll /rs /rps /msi /norestart /quiet EULA_ACCEPT=YES" -Wait