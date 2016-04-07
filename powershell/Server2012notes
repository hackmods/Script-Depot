VBOX GUEST ADDITIONS MUST BE INSTALLED TO COPY AND PASTE
Server-Core
INSERT VBOXGUESTADDITIONS
D:\
.\VBoxWinddowsAdditions.exe
------------------------------------------------------------------------
-- SERVICES COMMANDS
Get-Service		--Get information about a service
Start-Service	--Start a service
Stop-Service	--Stop a service
Restart-Service --Restart a service
Suspend-Service --Pause a service
Resume-Service	--Resume suspended service
Set-Service		--Changes properties of a service
New-Service		--Create a service
------------------------------------------------------------------------
-- SHOW INSTALLED, REMOVED, AVAILABLE
Get-WindowsFeature | where InstallState -eq Installed	--Show things that are installed
Get-WindowsFeature | where InstallState -eq Removed		--Show things not installed
Get-WindowsFeature | where InstallState -eq Available	--Show possible things to install

------------------------------------------------------------------------
-- BASIC COMMANDS
Get-Something
Set-Something
------------------------------------------------------------------------
Get-Help							-- Downloads powershell help for switches on whatever commands
Get-Help WindowsFeature -examples   -- Literally shows examples of the command
Get-Help WindowsFeature -detailed	-- Detailed description condensed
Get-Help WindowsFeature -Full		-- Full description
Get-Help WindowsFeature -Online		-- Microsoft website description

Add-WindowsFeature					-- Add windows features 
Uninstall-WindowsFeature			-- Remove windows features

sconfig								-- Configure server powershell page
------------------------------------------------------------------------
-- Turn on Powershell for servercore remoting
Enable-PSRemoting -Force
------------------------------------------------------------------------
--Turn on windows remote management (WINRM) to install firewall options
Configure-SMRemoting.exe -Enable

-- Enable these rules for firewall management on server core with powershell.

Enable-NetFirewallRule -DisplayGroup "Remote Volume Management"
Enable-NetFirewallRule -DisplayGroup "Windows Firewall Remote Management"
Enable-NetFirewallRule -DisplayGroup "Remote Scheduled Tasks Management"
Enable-NetFirewallRule -DisplayGroup "Remote Service Management"
Enable-NetFirewallRule -DisplayGroup "Remote Event Log Management"
Enable-NetFirewallRule -DisplayGroup "Windows Remote Management"
Get-NetFirewallRule -Name *FPS-ICMP?-ERQ* | Enable-NetFirewallRule
New-NetFirewallRule –DisplayName "Allow Ping" –Direction Inbound –Action Allow –Protocol icmpv4 –Enabled True
------------------------------------------------------------------------

--Control Services

Get-Service				-- Display services use "-DisplayName Hy" to search services
Start-Service			-- Start a service name, use a comma to seperate more than one.
Stop-Service			-- Stop service
Restart-Service			-- Restart service
Suspend-Service			-- Pause service
Resume-Service			-- Resume paused service
Set-Service				-- Change properties of a service
New-Service				-- Creats a new service

------------------------------------------------------------------------
-- NICTEAM CONTROL

Get-NetLbfoTeam			-- Shows a list of NIC teams on the server
New-NetLbfoTeam			-- Createse a NIC team and adds network adapters to it. You can optionally set the teams properties
Remove-NetLbfoTeam		-- Delete a team
rename-NetLbfoTeaem		-- Rename a team
Set-NetLbfoTeaem		-- Sets the properties

------------------------------------------------------------------------
-- CREATE SAMBA SHARES

New-SmbShare			-- Create Share
Get-SmbShare			-- Lists shares on the computer
Remove-SmbShare			-- Delete SmbShare
Set-SmbShare			-- Changse a share's properties
Get-SmbShareAccess		-- Displays permission for a share
Grant-SmbShareAccess	-- Adds a permission to a share

------------------------------------------------------------------------
-- CREATE DNS ZONES
Add-DnsServerPrimaryZone csmtech.local -ReplicationScope Domain						--AD Domain wide forward lookup zoneFLZ
Add-DnsServerPrimaryZone csmtech.local -ZoneFile csmtech.local.dns					--Creates standard FLZ
Add-DnsServerPrimaryZone -NetworkID 10.10.0.0/16 -ReplicationScope Forest			--AD Reverse Lookup ZoneRLZ
Add-DnsServerPrimaryZone -NetworkID 10.10.0.0/16 -ZoneFile 10.10.in-addr.arpa.dns	--Standard RLZ
Add-DnsServerSecondaryZone															--Create secondary dns server Aut
Add-DnsServerStbZone																--Create stub zone dns server
Add-DnsServerForwarder -IPAddress 10.10.1.2											--Adds forwarders to DNS server forward list
Set-DnsServerForwarder -IPAddress 10.10.1.3											--Changes forwarder address
Add-DnsServerRootHint root.mydomain.local -IPAddress 10.10.1.50						--Adds root hint to DNS server
Import-DnsServerRootHint 410server.testdom1.local									--Imports root hints from another dns server
Set-DnsServerRecursion -Enable $true												--Sets recursion settings
Set-DnsServerDiagnostics -All $true													--Turns on debugging and logging parameters
------------------------------------------------------------------------
-- INSTALL A.D IN SERVER CORE YOU POOR BASTARD (NO GUI TOOLS).

-- INSTALL
Add-WindowsFeature AD-Domain-Services
-- PROMOTION
Install-ADDSDomainController -DomainName "410server2012.local"		-- Install DC to existing domain
Install-ADDSDomain -DomainName "410Server2012.local"				-- New domain to existing forest or new whatever.com address
Install-ADDSForest -DomainName "410Server2012.local"				- New DC in a NEW forest

------------------------------------------------------------------------
-- HYPER-V


------------------------------------------------------------------------
-- ERRORS 
-- KERBEROS SECURITY ERROR
Get-item WSMan:\localhost\Client\TrustedHosts
Set-Item wsman:\localhost\Client\TrustedHosts 410Server2012 -Concatenate -Force
OR
Set-Item wsman:\localhost\Client\TrustedHosts * 
https://technet.microsoft.com/en-ca/library/hh831453.aspx
------------------------------------------------------------------------
-- Things I forget about Active Directory
1. RODC read only domain controller, no account credentials stored on server
2. Child domain is a mirror domain controller of the parent
3. Tree domain controller is if you want to use a different name resolution address 410server1.local, 410server2.local
------------------------------------------------------------------------
-- Things I forget often about FILE SYSTEMS
1. Advanced samba shares allow for the use of quota
2. Shadow copies is in the drive properties
------------------------------------------------------------------------
-- Things I forget about Printers
1. Print pooling sets two printers to work in tandem to deliver jobs
2. Printer Priority lets small jobs go ahead of big jobs
3. Hold mismatched documents won't jam the entire printer if one job has the wrong paper
------------------------------------------------------------------------
-- Networking
1. Can you ping the shit
2. Can you resolve DNS, are you lying to yourself?
3. Is the subnet fucked because you didn't want to do the math?
------------------------------------------------------------------------
-- Server Manager
