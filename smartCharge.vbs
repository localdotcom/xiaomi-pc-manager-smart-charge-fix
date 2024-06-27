scriptPath = "" 'the directory containing scripts
command = "powershell.exe  -ExecutionPolicy Bypass " + scriptPath + "\smartCharge.ps1"
set shell = CreateObject("WScript.Shell")
shell.Run command,0
