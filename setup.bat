%temp%\wallpaper.exe
powershell set-itemproperty -path "HKLM:SYSTEM\CurrentControlSet\Control\Nls\CodePage" -name OEMCP -value "65001"

powershell set-executionpolicy bypass
powershell  "%temp%\initial.ps1"

