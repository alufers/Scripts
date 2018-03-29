#!/bin/bash



EMAIL=$(whiptail --inputbox "Please enter your EMAIL" 8 78 --title "Set git identity" 3>&1 1>&2 2>&3)
NAME=$(whiptail --inputbox "Please enter your NAME" 8 78 --title "Set git identity" 3>&1 1>&2 2>&3)

git config --global user.email $EMAIL
git config --global user.name $NAME

echo "Setting cred cache"
git config --global credential.helper cache
echo "Setting timeout to 1 hour"
git config --global credential.helper 'cache --timeout=3600'

echo "====DONE===="