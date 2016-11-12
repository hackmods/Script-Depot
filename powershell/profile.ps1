<#

.SYNOPSIS
This is a profile powershell script of functions to be loaded with the shell environment.

.DESCRIPTION
The script will run various functions outlined every time the user opens the shell.

.EXAMPLE
Get-DriveSizes

.NOTES
To create a profile run
New-Item -ItemType File -Path $profile -Force
notepad $profile

.LINK
http://www.bradgillap.com

#>

$functionNames = "`nGet-OsInfo","`nGet-BIOSInfo","`nGet-DriveSizes"


Write-Host -ForegroundColor yellow "Welcome, the following commands may also be used"
Write-Host -ForegroundColor green "$functionNames"

function Get-OSInfo {
param (
    $computerName = 'localhost'
)
get-wmiobject -class win32_operatingsystem -Computer $computername | Select-Object BuildNumber,Caption,ServicePackMajorVersion

}

function Get-BIOSInfo {
param (
    $computerName = 'localhost'
)
get-wmiobject -class win32_bios -computer $computername

}

function Get-DriveSize {

Get-WMIObject -class Win32_LogicalDisk -computer $env:COMPUTERNAME | 
Select-Object DeviceID, @{Name="Size (GB)";Expression={"{0:N2}" -f ($_.Size / 1GB) }},@{Name="FreeSpace (GB)";Expression={"{0:N2}" -f ($_.freespace / 1GB) }}

}
