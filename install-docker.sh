#!/bin/bash
sudo apt-get update
sudo apt-get install curl -y
#install docker
echo 'installing docker'
sudo curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
#install docker machine
echo 'installing docker-machine'
curl -L https://github.com/docker/machine/releases/download/v0.12.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
#install docker compose
echo 'installing docker-compose'
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
#add vagrant user to docker group
echo 'making ubuntu user in docker group'
sudo usermod -aG docker ubuntu