#!/bin/sh

# jetbrains
sudo apt install libfuse2 libxi6 libxrender1 libxtst6 mesa-utils libfontconfig libgtk-3-bin -y

wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.25.12627.tar.gz -P "$HOME" && \
  sudo tar -xzf "$HOME/jetbrains-toolbox-1.25.12627.tar.gz" -C /opt && \
  sudo ln -s /opt/jetbrains-toolbox-1.25.12627/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox && \
  sudo chmod -R +rwx /usr/local/bin/jetbrains-toolbox

# vs code
sudo snap install --classic code
