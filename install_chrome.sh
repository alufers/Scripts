#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "====Adding Google Chrome's apt repository to checked===="
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/google.list

echo "====Adding Google's public GPG key to trusted===="
wget --quiet -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

apt-get update
echo "====Downloading Google Chrome stable===="
apt-get install google-chrome-stable

echo "====Done===="
