#!/bin/sh

# fd-find https://github.com/sharkdp/fd
# bat https://github.com/sharkdp/bat
sudo apt install fd-find bat neovim -y

# fzf fuzzy finder https://github.com/junegunn/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf" && \
  "$HOME/.fzf/install" --all

if ! grep -F "export FZF_DEFAULT_OPTS" "$HOME/.bashrc"; then
  echo "export FZF_DEFAULT_OPTS=\"--preview 'batcat --theme=\\\"Visual Studio Dark+\\\" --style=numbers --color=always {}'\"" >> "$HOME/.bashrc"
  echo 'alias vim=neovim' >> "$HOME/.bashrc"
fi

sudo update-alternatives --set editor /usr/bin/nvim

# Install packer for managing neovim plugins
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" && \
  mkdir -p "$HOME/.config/nvim"

# qemu
sudo apt install \
  qemu-kvm \
  qemu-system \
  qemu-utils \
  python3 \
  python3-pip \
  libvirt-clients \
  libvirt-daemon-system \
  bridge-utils \
  virtinst \
  libvirt-daemon \
  virt-manager \
  virtiofsd -y

sudo virsh net-start default
sudo virsh net-autostart default

sudo usermod -aG libvirt "$USER" && \
  sudo usermod -aG libvirt-qemu "$USER" && \
  sudo usermod -aG kvm "$USER" && \
  sudo usermod -aG input "$USER" && \
  sudo usermod -aG disk "$USER"

# aws
if ! which aws; then
  cd "$HOME" || exit
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$HOME/awscliv2.zip" && \
    unzip "$HOME/awscliv2.zip" && \
    sudo "$HOME/aws/install"
fi

sudo apt install amazon-ecr-credential-helper -y

# Jetbrains mono font
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

# dbeaver
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list

sudo apt clean && \
  sudo apt autoclean && \
  sudo apt update && \
  sudo apt install dbeaver-ce -y

# postman
sudo snap install postman --channel=v9/stable

# spotify
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg && \
  echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list && \
  sudo apt clean && \
  sudo apt autoclean && \
  sudo apt update && \
  sudo apt install spotify-client

# surfshark
curl -f https://downloads.surfshark.com/linux/debian-install.sh --output "$HOME/surfshark-install.sh" && \
  sudo sh "$HOME/surfshark-install.sh"
