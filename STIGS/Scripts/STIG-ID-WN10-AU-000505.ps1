<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Security event log is at least 1024000 KB (1024 MB).

.NOTES
    Author          : Jill C
    LinkedIn        : 
    GitHub          : 
    Date Created    : 2025-04-19
    Last Modified   : 2025-04-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000505

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
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"  
$valueName = "MaxSize"  
$minSizeKB = 1024000  

# Ensure the registry path exists; create it if not  
if (-not (Test-Path $regPath)) {  
    New-Item -Path $regPath -Force | Out-Null  
}  

# Get current MaxSize value if exists  
$currentSize = (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue).$valueName  

# Check if current size is less than required and set it if needed  
if (-not $currentSize -or $currentSize -lt $minSizeKB) {  
    Set-ItemProperty -Path $regPath -Name $valueName -Value $minSizeKB -Type DWord  
    Write-Output "Set Security event log MaxSize to $minSizeKB KB."  
} else {  
    Write-Output "Security event log MaxSize is already configured to $currentSize KB or greater."  
    }
 
