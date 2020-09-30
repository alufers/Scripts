#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Updating packages"
apt-get update

echo "Installing packages to use repo over https"
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

echo "Adding official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Checking for the fingerprint"
apt-key fingerprint 0EBFCD88

echo "Updating packages"
apt-get update

echo "Installing Docker"
apt-get install docker-ce docker-ce-cli containerd.io

echo "Verifying install"
docker run hello-world