#!/bin/sh

sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

# if ! which docker; then
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo echo "172.17.0.1 host.docker.internal" | sudo tee -a /etc/hosts
sudo echo "172.17.0.1 keycloak" | sudo tee -a /etc/hosts
# fi

sudo apt clean && \
    sudo apt autoclean && \
    sudo apt update

sudo apt install \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-compose-plugin -y


sudo usermod -aG docker $USER
newgrp docker
newgrp $USER
