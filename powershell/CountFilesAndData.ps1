<#
.SYNOPSIS
This script outputs a data relivant to classes.

.DESCRIPTION
This script uses a function to test which class functions are avalible and other properties.

.NOTES
R. Morris
2015-12-01
COMP1268
#>

param
(
    $path = 'c:\',
    $ext = 'txt'
)

cls

$path = Read-Host 'Enter a path'
$ext = Read-Host 'Enter a Ext'
$extU = $ext.ToUpper()

#progress commands
#Get-ChildItem $path -filter *.$ext
#Get-ChildItem $path -filter *.$ext| measure-object -property length -Sum

$data = Get-ChildItem $path -filter *.$ext| measure-object -property length -Sum
$count = $data.count
$sum = $data.Sum

$fsum = 0
$unit = "Bytes"

if($sum -gt 1TB)
{
$fsum = $sum / 1TB
$unit = "TB"
}
elseif($sum -gt 1GB)
{
$fsum = $sum / 1GB
$unit = "GB"
}
elseif($sum -gt 1MB)
{
$fsum = $sum / 1MB
$unit = "MB"
}
elseif($sum -gt 1024)
{
$fsum = $sum / 1KB
$unit = "KB"
}

$fsum =  [System.Math]::Round($fsum, 2)

echo ""
echo "$extU   Files found in:   $path"
echo "Total #  $extU  files:  $count"
echo "Total of  $extU  file lengths:  $fsum $unit"
