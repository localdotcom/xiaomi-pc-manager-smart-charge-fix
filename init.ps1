$scriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$regPath = "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run"
$regKey = "SmartCharge"
$regValue = "$scriptPath\smartCharge.vbs"

try {  
    Get-ItemProperty -Path $regPath -Name $regKey -ErrorAction Stop  
}  
catch [System.Management.Automation.ItemNotFoundException] {  
    New-Item -Path $regPath -Force  
    New-ItemProperty -Path $regPath -Name $regKey -Value $ValueData -Force  
}  
catch {  
    New-ItemProperty -Path $regPath -Name $regKey -Value "`"$regValue`"" -Type String -Force  
}
