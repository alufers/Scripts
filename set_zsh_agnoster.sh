#!/bin/bash

sudo apt-get install fonts-powerline
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi

export TARGET_KEY=ZSH_THEME 
export CONFIG_FILE=~/.zshrc
export REPLACEMENT_VALUE=agnoster 

sed -i "s/\($TARGET_KEY *= *\).*/\1$REPLACEMENT_VALUE/" $CONFIG_FILE

echo "Please restart your terminal"
