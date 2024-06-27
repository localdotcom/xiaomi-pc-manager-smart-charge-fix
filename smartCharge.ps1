$procPath = "C:\Program Files\MI\XiaomiPCManager\Launch.exe"
$procArg = "--AutoRun=1"
$regPath = "Registry::HKEY_USERS\<user_folder>\Software\MI\SvrCModule\PerformanceMode\POWER"
$regKey = "ChargingProtect"
$file = "<script_path>\.plugged"
$interval = 300

while ($true) {
	# get power status
	$plugged = (Get-WmiObject -Class BatteryStatus -Namespace root\wmi -ComputerName "localhost").PowerOnLine

	if ($plugged -match "True" -and -not (Test-path $file)) {
		# get the process details
	    $processes = Get-Process XiaomiPcManager
		$procID = $processes[$in-1].Id

		# kill process
		$processes[$in-1].Kill()
		$processes[$in-1].WaitForExit()

		# change registry key 'ChargingProtect' to '0'
		Set-ItemProperty -Path $regPath -Name $regKey -Value 0

		# start process
		Start-Process  $procPath -ArgumentList $procArg

		# wait 10 sec
		Start-Sleep -s 10

	    # get the process details
	    $processes = Get-Process XiaomiPcManager
		$procID = $processes[$in-1].Id

		# kill process
		$processes[$in-1].Kill()
		$processes[$in-1].WaitForExit()

		# change registry key 'ChargingProtect' to '1'
		Set-ItemProperty -Path $regPath -Name $regKey -Value 1

		# start process
		Start-Process  $procPath -ArgumentList $procArg

		# create a file
		New-Item $file | Out-Null

		# echo "Smart charge activated"
	}
	elseif ($plugged -match "False" -and (Test-path $file)) {
		# remove file
		Remove-Item $file
		
		# echo "Smart charge deactivated"
	}

	Start-Sleep -s $interval # run script every 5 minutes (default value)
}
