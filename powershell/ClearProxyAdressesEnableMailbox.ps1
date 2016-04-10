<#
.SYNOPSIS
This script clears ProxyAddresses and enables users mailboxes.

.DESCRIPTION
This script clears SMTP ProxyAddresses stored in a users AD account,then enables a users mailbox in Exchange. This program must me ran from within the Exchange Server Managerment console, which acts as a powershell interpritor with extra commands targeting Exchange Server 2013.

#>
Import-module activedirectory

$users = Get-ADUser -LDAPfilter '(name=*)' -searchBase {OU=Sales,DC=breezeyobmDC=com} 
foreach($user in $users)
{
   Set-ADUser -Identity $user.SamAccountName -Clear ProxyAddresses
   Enable-Mailbox -Identity $user.SamAccountName
}
