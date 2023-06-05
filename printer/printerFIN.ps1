Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Instalar Impressora KYOCERA FINANCEIRO'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'SIM'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'NAO'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Deseja instalar a impressora do Financeiro?'
$form.Controls.Add($label)

$form.Topmost = $true

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    Add-PrinterDriver -Name "HP LaserJet Pro MFP 4101 4102 4103 4104 PCL-6 (v4)"
    Add-PrinterPort -Name "TCPPort4:" -PrinterHostAddress "192.168.88.8" -ErrorAction SilentlyContinue

    $PrinterFIN = @{
        DriverName = "HP LaserJet Pro MFP 4101 4102 4103 4104 PCL-6 (v4)"
        Name       = "HP LaserJet Pro MFP 4103 - FINANCEIRO" 
        PortName   = (Get-PrinterPort -Name TCPPort4:*).Name
        Verbose    = $true
    }
Add-Printer @PrinterFIN
}    