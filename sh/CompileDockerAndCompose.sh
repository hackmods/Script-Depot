#build docker app
docker build planerift
cd planerift
#start docker-compose
docker-compose stop
docker-compose up