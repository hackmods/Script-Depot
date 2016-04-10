#INSERT GUEST ADDITIONS DISC IGNORE ERROR
mount /dev/cdrom /mnt              # or any other mountpoint
cd /mnt
./VBoxLinuxAdditions.run
reboot
