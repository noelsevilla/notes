#!/bin/sh

sudo apt install curl software-properties-common apt-transport-https -y

# import brave repo keys
sudo curl https://brave-browser-apt-release.s3.brave.com/brave-core.asc| gpg --dearmor > "$HOME/brave-core.gpg" && \
  sudo install -o root -g root -m 644 "$HOME/brave-core.gpg" /etc/apt/trusted.gpg.d/

# Add brave to repo
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt clean && \
    sudo apt autoclean && \
    sudo apt update && \
    sudo apt install brave-browser -y

if ! grep -F "alias brave" "$HOME/.bashrc"; then
  echo "alias brave='brave-browser'" >> "$HOME/.bashrc"
fi

# chrome
sudo apt install curl unzip xvfb libxi6 -y && \
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P "$HOME" && \
  sudo apt install -y "$HOME/google-chrome-stable_current_amd64.deb"
