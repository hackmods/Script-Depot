$SecureString = ConvertTo-SecureString "660627-142296-201091-658438-515416-104951-203148-161018" -AsPlainText -Force

Unlock-BitLocker -MountPoint "M:" -Password $SecureString