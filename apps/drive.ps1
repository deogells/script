$Url = "https://dl.google.com/drive-file-stream/GoogleDriveFileStream.exe"
$Output = "$Env:TEMP\GoogleDriveFileStream.exe"
Invoke-WebRequest -Uri $Url -OutFile $Output
Start-Process -FilePath $Output -ArgumentList "/silent", "/install" -Wait