<#
.SYNOPSIS
    This PowerShell script ensures that Run as different user is removed from context menus.

.NOTES
    Author          : Jill C
    LinkedIn        : 
    GitHub          : 
    Date Created    : 2025-04-19
    Last Modified   : 2025-04-19
    Version         : 1.0
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

#batfile
# Define the registry path and value details  
$regPath = "HKLM:\SOFTWARE\Classes\batfile\shell\runasuser"  
$valueName = "SuppressionPolicy"  
$valueType = "DWORD"
$sizeValue = 4096
  

# Ensure the registry path exists; create it if not  
if (-not (Test-Path $regPath)) {  
    New-Item -Path $regPath -Force | Out-Null  
}  

# Get current Value if exists  
$currentSize = (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue).$valueName  

# Check if current size is less than required and set it if needed  
if (-not $currentSize -or $currentSize -ne $sizeValue ) {  
    Set-ItemProperty -Path $regPath -Name $valueName -Value $sizeValue -Type $valueType  
    Write-Output "Set $valueName to $sizeValue."  
} else {  
    Write-Output "valueName is already set to $sizeValue." 
	}


#cmdfile
# Define the registry path and value details  
$regPath = "HKLM:\SOFTWARE\Classes\cmdfile\shell\runasuser"  
$valueName = "SuppressionPolicy"  
$valueType = "DWORD"
$sizeValue = 4096
  

# Ensure the registry path exists; create it if not  
if (-not (Test-Path $regPath)) {  
    New-Item -Path $regPath -Force | Out-Null  
}  

# Get current Value if exists  
$currentSize = (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue).$valueName  

# Check if current size is less than required and set it if needed  
if (-not $currentSize -or $currentSize -ne $sizeValue ) {  
    Set-ItemProperty -Path $regPath -Name $valueName -Value $sizeValue -Type $valueType  
    Write-Output "Set $valueName to $sizeValue."  
} else {  
    Write-Output "valueName is already set to $sizeValue." 
	}



#exefile
# Define the registry path and value details  
$regPath = "HKLM:\SOFTWARE\Classes\exefile\shell\runasuser"  
$valueName = "SuppressionPolicy"  
$valueType = "DWORD"
$sizeValue = 4096
  
# Ensure the registry path exists; create it if not  
if (-not (Test-Path $regPath)) {  
    New-Item -Path $regPath -Force | Out-Null  
}  

# Get current Value if exists  
$currentSize = (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue).$valueName  

# Check if current size is less than required and set it if needed  
if (-not $currentSize -or $currentSize -ne $sizeValue ) {  
    Set-ItemProperty -Path $regPath -Name $valueName -Value $sizeValue -Type $valueType  
    Write-Output "Set $valueName to $sizeValue."  
} else {  
    Write-Output "valueName is already set to $sizeValue." 
	}

#mscfile
# Define the registry path and value details  
$regPath = "HKLM:\SOFTWARE\Classes\mscfile\shell\runasuser"  
$valueName = "SuppressionPolicy"  
$valueType = "DWORD"
$sizeValue = 4096
  
# Ensure the registry path exists; create it if not  
if (-not (Test-Path $regPath)) {  
    New-Item -Path $regPath -Force | Out-Null  
}  

# Get current Value if exists  
$currentSize = (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue).$valueName  

# Check if current size is less than required and set it if needed  
if (-not $currentSize -or $currentSize -ne $sizeValue ) {  
    Set-ItemProperty -Path $regPath -Name $valueName -Value $sizeValue -Type $valueType  
    Write-Output "Set $valueName to $sizeValue."  
} else {  
    Write-Output "valueName is already set to $sizeValue." 
	}
