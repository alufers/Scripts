#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

wget -O /tmp/skype.deb https://go.skype.com/skypeforlinux-64.deb
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
dpkg -i /tmp/skype.deb
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
apt --fix-broken install
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
echo "====Done===="
