Add-PrinterPort -Name "TCPPort2:" -PrinterHostAddress "192.168.88.6" -ErrorAction SilentlyContinue

Add-PrinterDriver -Name "HP Color LaserJet Pro M479 PCL-6 (V4)" -Verbose

$PrinterDP = @{
    DriverName = "HP Color LaserJet Pro M479 PCL-6 (V4)"
    Name       = "HP Color Laserjet Pro M478f-9f - DP" 
    PortName   = (Get-PrinterPort -Name TCPPort2:*).Name
    Verbose    = $true
}

Add-Printer @PrinterDP
Rename-Printer -Name "Kyocera ECOSYS M3540idn KX" -NewName "Kyocera M3540idn - RECEPCAO"

 
powershell $Env:TEMP\printer\printerFIN.ps1 -wait
powershell $Env:TEMP\printer\PrinterCMP.ps1  -wait

Remove-Item  "$Env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Startup\instala.bat"