# Download Docker
#[curl is required]

#grab docker
curl -O http://example.com/download/myfile.zip
https://apt.dockerproject.org/repo/pool/main/d/docker-engine/docker-engine_1.10.0-0~trusty_amd64.deb

# Install dependencies
sudo apt-get -yy install libapparmor1 aufs-tools ca-certificates
# Install Doocker	[From downloaded file above]
sudo dpkg -i docker-engine_1.10.0-0~trusty_amd64.deb
#Add user to docker group
sudo usermod -aG docker $USER

#test results
docker --version 

#grab compose addon 
curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-comp
ose-Linux-x86_64 > /dckrtmp/docker-compose
#//permission things
chmod +x /dckrtmp/docker-compose
#set up user command app
sudo mv /dckrtmp/docker-compose /usr/local/bin
#test results
docker-compose --version