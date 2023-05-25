
powershell Set-ExecutionPolicy bypass

powershell %temp%\printer\add-printer.ps1 -wait
 
powershell %temp%\printer\printerFIN.ps1 -wait
powershell %temp%\printer\PrinterCMP.ps1  -wait

