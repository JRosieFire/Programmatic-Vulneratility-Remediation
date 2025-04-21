<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 is configured to require a minimum pin length of six characters in order to increase the available combinations an attacker would have to attempt a brute force attack.

.NOTES
    Author          : Jill C
    LinkedIn        : 
    GitHub          : 
    Date Created    : 2025-04-20
    Last Modified   : 2025-04-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000260

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000260.ps1 
#>

function Set-STIGWN10-CC-000260 {
	param (
        $regPath, $valueName, $valueType, $minSizeValue
    )
	
	# Ensure the registry path exists; create it if not  
	if (-not (Test-Path $regPath)) {  
		New-Item -Path $regPath -Force | Out-Null  
	}  

	# Get current Value if exists  
	$currentSize = (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue).$valueName  

	# Check if current size exists or if it is not set to the size value   
	if (-not $currentSize -or $currentSize -lt $minSizeValue) {  
		Set-ItemProperty -Path $regPath -Name $valueName -Value $minSizeValue -Type $valueType  
		Write-Output "Set $valueName in $regPath to $minSizeValue."  
	} else {  
		Write-Output "$valueName in $regPath is already set to $minSizeValue." 
	}
}


Set-STIGWN10-CC-000260 -regPath "HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity" -valueName "MinimumPINLength" -valueType "DWORD" -minSizeValue 6