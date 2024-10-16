#!/bin/sh

# jetbrains
sudo apt install libfuse2 libxi6 libxrender1 libxtst6 mesa-utils libfontconfig libgtk-3-bin -y

wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.25.12627.tar.gz -P "$HOME" && \
  sudo tar -xzf "$HOME/jetbrains-toolbox-1.25.12627.tar.gz" -C /opt && \
  sudo ln -s /opt/jetbrains-toolbox-1.25.12627/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox && \
  sudo chmod -R +rwx /usr/local/bin/jetbrains-toolbox

# vs code
sudo apt install wget gpg software-properties-common apt-transport-https -y

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg && \
  echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null && \
  rm -f packages.microsoft.gpg

sudo apt clean && \
    sudo apt autoclean && \
    sudo apt update && \
    sudo apt install code -y # or code-insiders
