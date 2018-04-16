#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "====Adding Insomnia's apt repository to checked===="
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list

echo "====Adding Insomnia's public GPG key to trusted===="
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -

sudo apt-get update
echo "====Downloading Insomnia===="
sudo apt-get install insomnia