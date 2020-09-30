#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Installing GPG key"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

echo "Ensuring apt is set to work with https sources"
apt-get install apt-transport-https

echo "Downloading source"
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.lists

echo "Updating packages"
apt-get update

echo "Installing Sublime Text"
apt-get install sublime-text