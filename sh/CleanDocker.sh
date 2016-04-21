#!/bin/bash
# Stop then delete all containers and images
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker rmi $(docker images -q)