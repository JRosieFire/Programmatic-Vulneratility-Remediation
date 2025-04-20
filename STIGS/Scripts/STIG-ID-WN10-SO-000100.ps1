<#
.SYNOPSIS
    This PowerShell script ensures that the Windows SMB client must be configured to always perform SMB packet signing.

.NOTES
    Author          : Jill C
    LinkedIn        : 
    GitHub          : 
    Date Created    : 2025-04-19
    Last Modified   : 2025-04-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000100

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# Create a function to implement STIG WN10-SO-000100
function Set-WN10-SO-000100 {
	param (
        $regPath, $valueName, $valueType, $sizeValue
    )
	
	# Ensure the registry path exists; create it if not  
	if (-not (Test-Path $regPath)) {  
		New-Item -Path $regPath -Force | Out-Null  
	}  

	# Get current Value if exists  
	$currentSize = (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue).$valueName  

	# Check if current size is less than required and set it if needed  
	if (-not $currentSize -or $currentSize -ne $sizeValue ) {  
		Set-ItemProperty -Path $regPath -Name $valueName -Value $sizeValue -Type $valueType  
		Write-Output "Set $valueName in $regPath to $sizeValue."  
	} else {  
		Write-Output "$valueName in $regPath is already set to $sizeValue." 
	}
}


Set-WN10-SO-000100 -regPath "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" -valueName "RequireSecuritySignature" -valueType "DWORD" -sizeValue 1
