# SSH to your FreeNAS

# note the Plex jail 
jls
# replace with Plex #
jexec 2 csh

#grab Plex updater
fetch -o PMS_Updater.sh https://raw.githubusercontent.com/mstinaff/PMS_Updater/master/PMS_Updater.sh
#give run access
chmod 755 PMS_Updater.sh

#Run update script
./PMS_Updater.sh -u PlexPass_User -p PlexPass_password -a
