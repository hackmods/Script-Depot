# Enable remote signed scripts before installing chocolatey
Set-ExecutionPolicy RemoteSigned
# Install chocolatey
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

# Install nvidia drivers
geforce-game-ready-driver

# Install usual applications
choco install appname -y

# Update applications
choco update all -y
