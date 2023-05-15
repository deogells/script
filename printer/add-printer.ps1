Add-PrinterPort -Name "TCPPort1:" -PrinterHostAddress "192.168.88.5" -ErrorAction SilentlyContinue
Add-PrinterPort -Name "TCPPort2:" -PrinterHostAddress "192.168.88.6" -ErrorAction SilentlyContinue

Add-printerDriver -name "Microsoft XPS Class Driver"

$PrinterRecepcao = @{
    DriverName = "Microsoft XPS Class Driver"
    Name       = "Kyocera M3540idn - RECEPÇÃO" 
    PortName   = (Get-PrinterPort -Name TCPPort1:*).Name
    Verbose    = $true
}
$PrinterDP = @{
    DriverName = "Microsoft XPS Class Driver"
    Name       = "HP Color Laserjet - DP" 
    PortName   = (Get-PrinterPort -Name TCPPort2:*).Name
    Verbose    = $true
}

Add-Printer @PrinterDP

Add-Printer @PrinterRecepcao

.\printerFIN.ps1
.\printerPROT.ps1