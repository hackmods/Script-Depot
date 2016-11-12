function Get-DriveSize {

Get-WMIObject -class Win32_LogicalDisk -computer $env:COMPUTERNAME | 
Select-Object DeviceID, @{Name="Size (GB)";Expression={"{0:N2}" -f ($_.Size / 1GB) }},@{Name="FreeSpace (GB)";Expression={"{0:N2}" -f ($_.freespace / 1GB) }}

}

Get-DriveSize
