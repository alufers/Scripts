#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Updating packages"
apt-get update
echo "Downloading KeePassXC"
apt-get install keepassxc
