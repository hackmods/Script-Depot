-- Windows 10 has a package manager built in called OneGet. You can use chocolatey to improve the sources.

Get-PackageProvider                     --Shows package providers installed kind of like sources.list in apt
Get-Package                             --Shows installed packages
Get-PackageProvider -name chocolatey    --Installs chocolatey package repo.
Install-Package -name skype             --Installs Skype
