#!/bin/bash

sudo apt install git curl -y
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi


