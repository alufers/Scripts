#!/bin/bash

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
source ~/.zshrc
nvm install node
source ~/.zshrc
echo "Node version:"
node -v
echo "====Done===="
