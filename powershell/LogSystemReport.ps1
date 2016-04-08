<#
.SYNOPSIS
This script outputs a collection of logs for 3 catgeories from the past week.
.DESCRIPTION
This script outputs the 5 largest collection of logs for Summarys Errors and Warings categories from the past week.
#>

#Doc setup
clear
$flower = "*******************************"
$time = Get-Date -UFormat "%Y-%m-%d"
$oldTime = $(Get-Date).AddDays(-7);
echo "Report by: $env:USERNAME for date starting ($time)"
echo ''

# Summary logs
echo $flower
echo "Top 5 System Log Summary Report"
echo $flower
echo ''
Get-EventLog system -EntryType Information -After $oldTime  | Group-Object Source | Sort-Object count -Descending | Select-Object count,name -First 5| ft -AutoSize

#ERROR logs
echo ''
echo $flower
echo "Top 5 System Log ERROR Report"
echo $flower
echo ''
Get-EventLog System -EntryType Error -After $oldTime  | Group-Object Source | Sort-Object count -Descending | Select-Object count,name -First 5| ft -AutoSize

#WARNING logs
echo ''
echo $flower
echo "Top 5 System Log WARNING Report"
echo $flower
echo ''
Get-EventLog system -EntryType Warning -After $oldTime | Group-Object Source | Sort-Object count -Descending | Select-Object  count,name -First 5| ft -AutoSize