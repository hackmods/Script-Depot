VPN Configuration
=================

Your new Chunk, Hackmods has been created!

IP Address: 66.172.11.77
Username: root
Password: 2h6ujppfpsgg

https://chunkhost.com/help/ssh

Steps

Add User
adduser [username]

Make User Sudo
sudo adduser <username> sudo

Disable Sudo


Text client: nano, gedit (visual)

restart ssh service
sudo /etc/init.d/ssh restart



FIX REMOTE DESKTOP (PER USER)
https://answers.launchpad.net/ubuntu/+question/246757

I solved the issue, here is what I did after the initial install Ubuntu 14 server install:

sudo apt-get install xubuntu-desktop
sudo apt-get xfce4
sudo apt-get install xrdp
sudo mv /etc/xrdp/startwm.sh /etc/xrdp/startwm.sh.orig
sudo ln –s /etc/X11/Xsession /etc/xrdp/startwm.sh

echo xfce4-session > ~/.xsession (this is needed for each user)
         or (for all users)
sudo vi /etc/X11/Xsession - Set USERXSESSION to a global file rather than an individual one
sudo echo xfce4-session > {global file from the last command}

Hope this helps anyone else with the same issue.

Squid Proxy
https://help.ubuntu.com/12.10/serverguide/squid.html
restart: sudo service squid3 restart
additional shutdown: cd /etc/squid3 then sudo squid3 -k shutdown

Webserver setup
http://www.patrickjwaters.com/blog/2011-07-13/my-favorite-web-server-setup-ubuntu-server-lamp-webmin-and-virtualmin/3524

Chunk DNS domain resolve shiznit
http://amorphid.blogspot.ca/2011/05/configuring-domain-name-on-chunkhost.html

proxy user/pass gen
http://www.htpasswdgenerator.net/#results


WEB FILE SERVER THING

user: zadmin
Pass: 6m9s76h54suc

50.63.202.58