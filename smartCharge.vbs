command = "powershell.exe  -ExecutionPolicy Bypass <script_path>\smartCharge.ps1"
set shell = CreateObject("WScript.Shell")
shell.Run command,0
