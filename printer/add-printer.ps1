﻿
Add-PrinterPort -Name "TCPPort2:" -PrinterHostAddress "192.168.88.6" -ErrorAction SilentlyContinue

Add-PrinterDriver -Name "HP Color LaserJet Pro M479 PCL-6 (V4)" -Verbose

$PrinterDP = @{
    DriverName = "HP Color LaserJet Pro M479 PCL-6 (V4)"
    Name       = "HP Color Laserjet Pro M478f-9f - DP" 
    PortName   = (Get-PrinterPort -Name TCPPort2:*).Name
    Verbose    = $true
}

Add-Printer @PrinterDP
Rename-Printer -Name "Kyocera ECOSYS M3540idn KX" -NewName "Kyocera ECOSYS M3540idn - RECEPCAO"

Start-Process $Env:Systemdrive\temp\printer\printerFIN.exe -wait
Start-Process $Env:Systemdrive\temp\printer\printerCMP.exe -Wait

Remove-Item  -Recurse -Confirm:$false -Force "$Env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Startup\instala.bat"
Remove-Item  -Recurse -Confirm:$false -Force "$Env:SystemDrive\temp" 
