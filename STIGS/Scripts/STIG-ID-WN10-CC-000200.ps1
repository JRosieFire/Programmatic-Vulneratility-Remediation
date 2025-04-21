<#
.SYNOPSIS
    This PowerShell script ensures that the Administrator accounts are not be enumerated during elevation.

.NOTES
    Author          : Jill C
    LinkedIn        : 
    GitHub          : 
    Date Created    : 2025-04-21
    Last Modified   : 2025-04-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000200

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000200.ps1 
#>

function Set-STIGWN10-CC-000200 {
	param (
        $regPath, $valueName, $valueType, $sizeValue
    )
	
	# Ensure the registry path exists; create it if not  
	if (-not (Test-Path $regPath)) {  
		New-Item -Path $regPath -Force | Out-Null  
	}  

	# Get current Value if exists  
	$currentSize = (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue).$valueName  

	# Check if current size does not exist (equal to null) or current size doesn't equal 0  
	if ($currentSize -eq $null -or $currentSize -ne $sizeValue) { 
		Set-ItemProperty -Path $regPath -Name $valueName -Value $sizeValue -Type $valueType  
		Write-Output "Set $valueName in $regPath to $sizeValue."  
	} else {  
		Write-Output "$valueName in $regPath is already set to $sizeValue." 
	}
}


Set-STIGWN10-CC-000200 -regPath "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" -valueName "EnumerateAdministrators" -valueType "DWORD" -sizeValue 0