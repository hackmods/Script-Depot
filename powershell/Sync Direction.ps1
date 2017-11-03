#Start DNS / IP Check
 write-host 'Starting DNS resolve process .....'
$DNS1 = Resolve-DnsName –Name prod.behind7proxies.com
$DNS1IP = $DNS1.IpAddress
$DNS2 = Resolve-DnsName -Name fb.behind7proxies.com
$DNS2IP = $DNS2.IpAddress
$DNSLive = Resolve-DnsName -Name behind7proxies.com
$LogFile = "MSDeployLog.txt"

function LogDetail
{
    write-host ''
    write-host 'Production:'
    write-host $DNS1.Name
    write-host $DNS1.IpAddress
    write-host ''
    write-host 'Fallback:'
	write-host $DNS2.Name
    write-host $DNS2.IpAddress
    write-host ''
    write-host 'Live behind7proxies.com'
    write-host $DNSLive.IPAddress
    write-host ''
}

function wdHead
{
    Get-Date -Format g | Out-file $LogFile -Append
  #  Write-host ' ' | Out-file $LogFile -Append
  #  $DNSLive | Out-file $LogFile -Append
    write-host '' | Out-file $LogFile -Append
    write-host 'Production:' | Out-file $LogFile -Append
    write-host $DNS1.Name | Out-file $LogFile -Append
    write-host $DNS1.IpAddress | Out-file $LogFile -Append
    write-host '' | Out-file $LogFile -Append
    write-host 'Fallback:' | Out-file $LogFile -Append
	write-host $DNS2.Name | Out-file $LogFile -Append
    write-host $DNS2.IpAddress | Out-file $LogFile -Append
    write-host '' | Out-file $LogFile -Append
    write-host 'Live behind7proxies.com' | Out-file $LogFile -Append
    write-host $DNSLive.IPAddress | Out-file $LogFile -Append
    write-host '' | Out-file $LogFile -Append
}


function wdTail
{
    Write-host ' ' | Out-file $LogFile -Append
    Get-Date -Format g | Out-file $LogFile -Append
    Write-host ' ' | Out-file $LogFile -Append
    Write-host ' ' | Out-file $LogFile -Append
}

#Log connection details
# LogDetail

#Write out start of log
wdHead

#Start direction sync based off primary domain

#If Primary server is online, pull files
if($DNSLive.IPAddress -eq $DNS1.IPAddress) {
msdeploy -verb:sync -source:webServer,computername='68.71.48.59' -dest:webServer,computerName='45.78.169.123' -verbose
}

#add logic to do a pull after reboot (check start time - 10 minute)
<#

if($DNSLive.IPAddress -eq $DNS1.IPAddress) {
    #msdeploy -verb:sync -source:webServer,computername='$DNS1.name' -dest:webServer,computerName='DNS2' -verbose
    #msdeploy -verb:sync -source:webServer,computername="$DNS1IP" -dest:webServer,computerName="$DNS2IP" -verbose -whatif |Out-file $LogFile -Append
    msdeploy -verb:sync -source:webServer,computername='68.71.48.59' -dest:webServer,computerName='45.78.169.123' -verbose -whatif | Out-file $LogFile -Append
}

elseif($DNSLive.IPAddress -eq $DNS2.IPAddress){
    #msdeploy -verb:sync -source:webServer,computername='DNS2'-dest:webServer,computerName='DNS1' -verbose
    #msdeploy -verb:sync -source:webServer,computername='$DNS2IP' -dest:webServer,computerName='DNS1IP' -verbose -whatif |Out-file $LogFile -Append
    msdeploy -verb:sync -source:webServer,computername='45.78.169.123' -dest:webServer,computerName='68.71.48.59' -whatif | Out-file $LogFile -Append
}

elseif($DNSLive.IPAddress -ne $DNS1.IPAddress -OR $DNS2.IPAddress){
    write-host 'The IP for behind7proxies does not match prod or fb subdomains.' | Out-file $LogFile -Append
	write-host 'The IP for behind7proxies does not match prod or fb subdomains.'
}
else {
    write-host 'A critial logic bug has occured.' | Out-file $LogFile -Append
    write-host 'A critial logic bug has occured.'
}

#>

#Write out end of log
wdTail

