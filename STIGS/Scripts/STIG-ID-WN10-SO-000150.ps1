<#
.SYNOPSIS
    This PowerShell script ensures that anonymous enumeration of shares is restricted.

.NOTES
    Author          : Jill C
    LinkedIn        : 
    GitHub          : 
    Date Created    : 2025-04-19
    Last Modified   : 2025-04-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000150

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

# Define the registry path and value details  
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"  
$valueName = "RestrictAnonymous"  
$valueType = "DWORD"
$sizeValue = 1
  
# Ensure the registry path exists; create it if not  
if (-not (Test-Path $regPath)) {  
    New-Item -Path $regPath -Force | Out-Null  
}  

# Get current Value if exists  
$currentSize = (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue).$valueName  

# Check if current size exists t or if it is not set to the size value  
if (-not $currentSize -or $currentSize -ne $sizeValue ) {  
    Set-ItemProperty -Path $regPath -Name $valueName -Value $sizeValue -Type $valueType  
    Write-Output "Set $valueName to $sizeValue."  
} else {  
    Write-Output "valueName is already set to $sizeValue." 
	}
