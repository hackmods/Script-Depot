#add linux user to virtualbox shared folder
sudo usermod -a -G vboxsf ryan
#create shortlink from share to user account
sundo ln -s /media/sf_VMshare/ $HOME/Share