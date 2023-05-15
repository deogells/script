 $pc =  Read-Host "Digite o IP do pc"
 $pw = convertto-securestring -AsPlainText -Force -String 'M1r4nt3$2023'
 $cred = new-object -typename System.Management.Automation.PSCredential -argumentlist "administrador",$pw
 $session= new-pssession -computername $pc -credential $cred

 Invoke-Command -ScriptBlock { set-executionPolicy bypass -scope currentuser } -Session $session

 Copy-Item –Path "C:\office\" –Destination "C:\office" –ToSession $session
 Copy-Item –Path "C:\office\*" –Destination "C:\office" –ToSession $session

 Invoke-Command -filepath "c:\office\instala.ps1" -Session $session

 Remove-PSSession -Session $session