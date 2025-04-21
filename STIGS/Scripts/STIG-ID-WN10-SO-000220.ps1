<#
.SYNOPSIS
    This PowerShell script ensures that system is configured to meet the minimum session security requirement for NTLM SSP based servers by setting the registry value name, NTLMMinServerSec, to   the value 537395200.

.NOTES
    Author          : Jill C
    LinkedIn        : 
    GitHub          : 
    Date Created    : 2025-04-20
    Last Modified   : 2025-04-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000220

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000220.ps1 
#>

function Set-STIGWN10-SO-000220 {
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
	if (-not $currentSize -or $currentSize -ne $sizeValue ) {  
		Set-ItemProperty -Path $regPath -Name $valueName -Value $sizeValue -Type $valueType  
		Write-Output "Set $valueName in $regPath to $sizeValue."  
	} else {  
		Write-Output "$valueName in $regPath is already set to $sizeValue." 
	}
}


Set-STIGWN10-SO-000220 -regPath "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -valueName "NTLMMinServerSec" -valueType "DWORD" -sizeValue 537395200