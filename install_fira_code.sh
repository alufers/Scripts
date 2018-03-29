#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

add-apt-repository universe
apt install fonts-firacode -y
