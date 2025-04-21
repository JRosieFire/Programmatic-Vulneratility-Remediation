<#
.SYNOPSIS
    This PowerShell script ensures that Run as different user is removed from context menus.

.NOTES
    Author          : Jill C
    LinkedIn        : 
    GitHub          : 
    Date Created    : 2025-04-19
    Last Modified   : 2025-04-19
    Version         : 2.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000039

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

function Set-RegValue {
	param (
        $regPath, $valueName, $valueType, $sizeValue
    )
	
	# Ensure the registry path exists; create it if not  
	if (-not (Test-Path $regPath)) {  
		New-Item -Path $regPath -Force | Out-Null  
	}  

	# Get current Value if exists  
	$currentSize = (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue).$valueName  

	# Check if current size exists t or if it is not set to the size value
	if (-not $currentSize -or $currentSize -ne $sizeValue ) {  
		Set-ItemProperty -Path $regPath -Name $valueName -Value $sizeValue -Type $valueType  
		Write-Output "Set $valueName in $regPath to $sizeValue."  
	} else {  
		Write-Output "$valueName in $regPath is already set to $sizeValue." 
	}
}


Set-RegValue -regPath "HKLM:\SOFTWARE\Classes\batfile\shell\runasuser" -valueName "SuppressionPolicy" -valueType "DWORD" -sizeValue 4096
Set-RegValue -regPath "HKLM:\SOFTWARE\Classes\cmdfile\shell\runasuser" -valueName "SuppressionPolicy" -valueType "DWORD" -sizeValue 4096
Set-RegValue -regPath "HKLM:\SOFTWARE\Classes\exefile\shell\runasuser" -valueName "SuppressionPolicy" -valueType "DWORD" -sizeValue 4096
Set-RegValue -regPath "HKLM:\SOFTWARE\Classes\mscfile\shell\runasuser" -valueName "SuppressionPolicy" -valueType "DWORD" -sizeValue 4096
