<#
.SYNOPSIS
    This PowerShell script ensures that Kerberos encryption types are configured to prevent the use of DES and RC4 encryption suites. This is necessary because DES and RC4 are not considered secure.

.NOTES
    Author          : Jill C
    LinkedIn        : 
    GitHub          : 
    Date Created    : 2025-04-20
    Last Modified   : 2025-04-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000190

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000190.ps1 
#>

function Set-STIGWN10-SO-000190 {
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


Set-STIGWN10-SO-000190 -regPath "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters" -valueName "SupportedEncryptionTypes" -valueType "DWORD" -sizeValue 2147483640

