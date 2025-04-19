# Define the registry path and value details  
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System"  
$valueName = "MaxSize"  
$minSizeKB = 32768  

# Ensure the registry path exists; create it if not  
if (-not (Test-Path $regPath)) {  
    New-Item -Path $regPath -Force | Out-Null  
}  

# Get current MaxSize value if exists  
$currentSize = (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue).$valueName  

# Check if current size is less than required and set it if needed  
if (-not $currentSize -or $currentSize -lt $minSizeKB) {  
    Set-ItemProperty -Path $regPath -Name $valueName -Value $minSizeKB -Type DWord  
    Write-Output "Set System event log MaxSize to $minSizeKB KB."  
} else {  
    Write-Output "System event log MaxSize is already configured to $currentSize KB or greater." 
	}
