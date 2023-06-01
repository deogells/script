##[Ps1 To Exe]
##
##Kd3HDZOFADWE8uK1
##Nc3NCtDXThU=
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ4tI=
##OcrLFtDXTiW5
##LM/BD5WYTiiZ4tI=
##McvWDJ+OTiiZ4tI=
##OMvOC56PFnzN8u+Vs1Q=
##M9jHFoeYB2Hc8u+Vs1Q=
##PdrWFpmIG2HcofKIo2QX
##OMfRFJyLFzWE8uK1
##KsfMAp/KUzWJ0g==
##OsfOAYaPHGbQvbyVvnQX
##LNzNAIWJGmPcoKHc7Do3uAuO
##LNzNAIWJGnvYv7eVvnQX
##M9zLA5mED3nfu77Q7TV64AuzAgg=
##NcDWAYKED3nfu77Q7TV64AuzAgg=
##OMvRB4KDHmHQvbyVvnQX
##P8HPFJGEFzWE8tI=
##KNzDAJWHD2fS8u+Vgw==
##P8HSHYKDCX3N8u+Vgw==
##LNzLEpGeC3fMu77Ro2k3hQ==
##L97HB5mLAnfMu77Ro2k3hQ==
##P8HPCZWEGmaZ7/K1
##L8/UAdDXTlaDjofG5iZk2U/rTW8uYsmIhZui0cGY7eP6vmWRTZ8bTlF7mjqyB0SxWOAXRtUcusIFXAk/O/0G66DRFfOsC60YlapDXdatqbYsKUnb8ZrkxyWC3ZTOCglwal37aO9PByLV0GTPBWiCjOQ=
##Kc/BRM3KXhU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba
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
