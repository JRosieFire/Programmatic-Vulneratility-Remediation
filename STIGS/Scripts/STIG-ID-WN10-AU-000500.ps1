<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Jill
    LinkedIn        : 
    GitHub          : 
    Date Created    : 2025-04-18
    Last Modified   : 2025-04-18
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

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

# Define registry path and parameters  
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"  
$valueName = "MaxSize"  
$valueData = 32768  
$valueType = "DWORD"  

# Check if the key exists, if not, create it  
if (-not (Test-Path $registryPath)) {  
    New-Item -Path $registryPath -Force | Out-Null  
}  

# Set the MaxSize value  
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type $valueType  

Write-Output "Registry value $valueName set to $valueData at $registryPath"  
