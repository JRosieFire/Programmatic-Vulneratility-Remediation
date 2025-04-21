<#
.SYNOPSIS
    This PowerShell script ensures that the Application Compatibility Program Inventory is prevented from collecting data and sending the information to Microsoft.

.NOTES
    Author          : Jill C
    LinkedIn        : 
    GitHub          : 
    Date Created    : 2025-04-21
    Last Modified   : 2025-04-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000175

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000175.ps1 
#>

function Set-STIGWN10-CC-000175 {
	param (
        $regPath, $valueName, $valueType, $sizeValue
    )
	
	# Ensure the registry path exists; create it if not  
	if (-not (Test-Path $regPath)) {  
		New-Item -Path $regPath -Force | Out-Null  
	}  

	# Get current Value if exists  
	$currentSize = (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue).$valueName  

	# Check if current size exists or if it is not set to the size value   
	if (-not $currentSize -or $currentSize -ne $sizeValue) {  
		Set-ItemProperty -Path $regPath -Name $valueName -Value $sizeValue -Type $valueType  
		Write-Output "Set $valueName in $regPath to $sizeValue."  
	} else {  
		Write-Output "$valueName in $regPath is already set to $sizeValue." 
	}
}


Set-STIGWN10-CC-000175 -regPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" -valueName "DisableInventory" -valueType "DWORD" -sizeValue 1