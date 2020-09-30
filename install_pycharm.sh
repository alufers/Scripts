#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Downloading package"
wget https://download.jetbrains.com/python/pycharm-community-2020.2.2.tar.gz

echo "Unpacking PyCharm"
tar -xzf pycharm-community-2020.2.2.tar.gz

echo "Moving to PyCharm subfolder"
cd pycharm-community-2020.2.2

echo "Entering bin"
cd bin

echo "Installing PyCharm"
sh pycharm.sh