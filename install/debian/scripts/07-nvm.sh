#!/bin/sh

# https://github.com/nvm-sh/nvm

curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh" | bash

. "$HOME/.nvm/nvm.sh"
nvm install --lts
npm install -g yarn
if ! grep -F 'export NODE_OPTIONS' "$HOME/.bashrc"; then
  echo 'export NODE_OPTIONS="--max-old-space-size=4096"' >> "$HOME/.bashrc"
fi
