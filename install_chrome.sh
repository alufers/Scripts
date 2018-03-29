#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

wget -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
dpkg -i /tmp/chrome.deb
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
apt --fix-broken install
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
echo "====Done===="
