#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
dpkg -i /tmp/discord.deb
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
apt --fix-broken install
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
echo "====Done===="
