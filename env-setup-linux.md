<h1>Setup Linux environment</h1>

- [Git](#git)
  - [delta - diff pager and highlighter](#delta---diff-pager-and-highlighter)
- [fd-find](#fd-find)
- [bat](#bat)
- [fzf](#fzf)
- [neovim](#neovim)
  - [Install and configure vim plug-ins](#install-and-configure-vim-plug-ins)
- [cmake](#cmake)
- [ssh-ident](#ssh-ident)
- [Node](#node)
  - [nvm](#nvm)
  - [Options](#options)
    - [Set memory use](#set-memory-use)
- [SDKMan](#sdkman)
  - [Java](#java)
  - [Gradle](#gradle)
  - [Kotlin](#kotlin)
- [Ruby](#ruby)
  - [rbenv](#rbenv)
- [Python](#python)
  - [pyenv](#pyenv)
  - [poetry](#poetry)
- [Rust](#rust)
- [asdf](#asdf)
  - [Go](#go)
  - [dotnet](#dotnet)
  - [lua](#lua)
  - [Elixir](#elixir)
    - [erlang](#erlang)
    - [elixir](#elixir-1)
- [GPG and Password manager with pass](#gpg-and-password-manager-with-pass)
  - [GPG](#gpg)
  - [Pass](#pass)
- [IDE](#ide)
  - [IntelliJ](#intellij)
- [Docker and Kubernetes](#docker-and-kubernetes)
  - [Docker](#docker)
    - [Docker Compose V2](#docker-compose-v2)
    - [Docker Credential Helper](#docker-credential-helper)
      - [Multiple docker configs](#multiple-docker-configs)
  - [Kubernetes with Minikube](#kubernetes-with-minikube)
  - [Kubernetes](#kubernetes)
  - [Helm](#helm)
- [AWS](#aws)
  - [AWS CLI](#aws-cli)
    - [Configure AWS profile](#configure-aws-profile)
    - [Multiple AWS Profile](#multiple-aws-profile)
  - [AWS Workspaces](#aws-workspaces)
- [Terraform](#terraform)
- [MongoDB](#mongodb)
- [QEMU](#qemu)
- [JMeter](#jmeter)
- [Browser](#browser)
  - [Brave](#brave)
  - [Chrome](#chrome)
- [DBeaver](#dbeaver)
- [Postman](#postman)
  - [Install with snap](#install-with-snap)
  - [Uninstall](#uninstall)
- [ODBC](#odbc)
  - [Postgres](#postgres)
  - [Informix](#informix)
    - [Install](#install)
    - [Configure](#configure)
- [Spotify](#spotify)

# Git

## [delta](https://github.com/dandavison/delta) - diff pager and highlighter

Download and install from delta release page

```bash
wget https://github.com/dandavison/delta/releases/download/0.16.5/git-delta_0.16.5_amd64.deb -P ~/ && \
sudo dpkg -i ~/git-delta_0.16.5_amd64.deb

# check installed
delta --version

# configure git
git config --global --add core.pager delta && \
git config --global --add interactive.diffFilter 'delta --color-only' && \
git config --global --add delta.navigate true && \
git config --global --add delta.dark true && \
git config --global --add delta.line-numbers true && \
git config --global --add delta.syntax-theme 'Visual Studio Dark+' && \
git config --global --add delta.file-decoration-style cyan && \
git config --global --add delta.file-style cyan && \
git config --global --add delta.inline-hint-styles cyan && \
git config --global --add delta.tabs 4 && \
git config --global --add delta.line-numbers-left-style cyan && \
git config --global --add delta.line-numbers-right-style cyan && \
git config --global --add delta.line-numbers-minus-style deeppink && \
git config --global --add delta.line-numbers-plus-style lime && \
git config --global --add delta.line-numbers-zero-style dimgrey && \
git config --global --add delta.hunk-header-line-number-style cyan && \
git config --global --add delta.hunk-header-file-style cyan && \
git config --global --add delta.hunk-header-decoration-syle 'cyan box'
```

# [fd-find](https://github.com/sharkdp/fd)

Alternative to the [find](https://www.gnu.org/software/findutils/) utility. To be used with [fzf](#fzf)

```bash
sudo apt install fd-find -y

# to search for directories
fdfind -t d

# to search for files
fdfind -t f
```

# [bat](https://github.com/sharkdp/bat)

Alternative to the cat utility

```bash
sudo apt install bat -y

batcat ~/.bashrc
```

# [fzf](https://github.com/junegunn/fzf)

Fuzzy finder from terminal. Install from [git repository](https://github.com/junegunn/fzf)

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
~/.fzf/install

# check if working
fzf --version

echo "export FZF_DEFAULT_OPTS=\"--preview 'batcat --theme=\\\"Visual Studio Dark+\\\" --style=numbers --color=always {}'\"" >> ~/.bashrc
```

# neovim

Install neovim and set as default editor

>Note: swap file for neovim are located in 
>~/.local/share/nvim/swap/

```bash
sudo apt update && sudo apt install neovim -y && \
sudo update-alternatives --set editor /usr/bin/nvim

# create vim alias to point to nvim
echo "alias vim='nvim'" >> ~/.bashrc
```

## Install and configure vim plug-ins

Install packer for managing neovim plugins
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Create an nvim directory in ~/.config and copy the nvim configs from ./configs/nvim
```sh
mkdir -p ~/.config/nvim && cp -r ./configs/nvim/. ~/.config/nvim
```

Open ~/.config/nvim from neovim and run `:PackerSync`

See [this](https://github.com/ThePrimeagen/init.lua) to configure neovim or clone this to ~/.config/nvim

```bash
git clone git@github.com:ThePrimeagen/init.lua ~/.config/nvim
```

Set colortheme to [rasmus](https://github.com/kvrohit/rasmus.nvim)

# [cmake](https://github.com/kitware/cmake)

```bash
sudo apt update && sudo apt install -y build-essential libssl-dev
cd /tmp && wget https://github.com/kitware/cmake/releases/download/v3.27.7/cmake-3.27.7.tar.gz
tar -zxvf cmake-3.27.7.tar.gz && cd cmake-3.27.7

# these would take a while
./bootstrap
make

sudo make install

# check working
cmake --version

# remove install files
rm -rf cmake-3.27.7 && rm -f cmake-3.27.7.tar.gz
```

# [ssh-ident](https://github.com/ccontavalli/ssh-ident)

Use to start ssh-agents and load ssh keys on demand once. this requires python > 3 to be available.

```bash
mkdir -p ~/bin; wget -O ~/bin/ssh goo.gl/MoJuKB; chmod 0755 ~/bin/ssh
echo 'export PATH=~/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

# [Node](https://nodejs.org/en/)

## [nvm](https://github.com/nvm-sh/nvm)

Install to manage node versions.

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# list available nodejs versions
nvm ls-remote

# install latest LTS version
nvm install --lts

# install yarn globally
npm install -g yarn

# check yarn working properly
yarn --version
```

## Options

### Set memory use

Node has a default max memory use of less than 2GB. It's possible to set or increase this by setting the `max-old-space-size` option from `NODE_OPTIONS`.

To do this from the CLI when running your node app:

```bash
NODE_OPTIONS=--max-old-space-size=40996 npm run some-node-script
```

Or you can export this from your terminal:

```bash
echo 'export NODE_OPTIONS="--max-old-space-size=4096"' >> ~/.bashrc
```

# [SDKMan](https://sdkman.io/)

Use this to install SDKs for the JVM like Java and Kotlin

```bash
sudo apt update && sudo apt install zip unzip -y && \
curl -s "https://get.sdkman.io" | bash

# check SDKMan working properly
sdk version
```

## [Java](https://www.w3schools.com/java/java_intro.asp)

Using [SDKMan](##SDKMan), install a version of Java

```bash
# check available versions of java from sdk
sdk list java

# install a version of java
sdk install java 17.0.1-open

# check java working properly
java --version
```

## [Gradle](https://gradle.org/)

Using [SDKMan](##SDKMan), install a version of Gradle

```bash
sdk install gradle 7.3

# check gradle working properly
gradle --version
```

## [Kotlin](https://kotlinlang.org/)

Using [SDKMan](###SDKMan), install a version of Kotlin
```bash
sdk install kotlin 1.5.30

# check kotlin working properly
kotlin -version
```

# [Ruby](https://www.ruby-lang.org/en/)

## [rbenv](https://github.com/rbenv/rbenv)

Using rbenv to manage ruby installations

```bash
sudo apt install rbenv
rbenv init

# verify rbenv working properly
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash

# install ruby-build to install other versions of ruby
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# install a specific version of ruby
rbenv install 2.2.6

# check ruby is working properly
ruby --version
```

# [Python](https://www.python.org/)

## [pyenv](https://github.com/pyenv/pyenv)

Using pyenv to manage python installations and versions

```bash
# install required linraries to build python later on first
sudo apt update && \
  sudo apt install make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y

# then install pyenv
curl https://pyenv.run | bash

# add this to ~/.bashrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc && \
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc && \
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

# list available versions of python
source ~/.bashrc && pyenv install -l

# install a python version
source ~/.bashrc && pyenv install 3.9.2

# set a default python version thru pyenv
echo "3.9.2" >> ~/.pyenv/version
```

## [poetry](https://python-poetry.org/)

Install poetry to manage python project dependencies and publishing

```bash
# install
curl -sSL https://install.python-poetry.org | python - && \
echo 'export PATH="~/.local/bin:$PATH"' >> ~/.bashrc

# check python is installed
poerty --version

# set poetry to create .venv in project directory
poetry config virtualenvs.in-project true
```

# [Rust](https://www.rust-lang.org/tools/install)

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# check rust is working properly
rustup --version
rustc --version
```

# [asdf](https://github.com/asdf-vm/asdf)

Using this to manage versions for different environments and tools

```bash

# add asdf and asdf completions to .bashrc
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1 && \
echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc && \
echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc

# reload shell
exec $SHELL

# check asdf is working correctly
asdf --version
```

## [Go](https://kubernetes.io/)

Using asdf to manage go

```bash
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git

# check available versions
asdf list all golangrw

asdf install golang 1.17.6 && \
asdf global golang 1.17.6

go version
```

## [dotnet](https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu)

```bash
asdf plugin-add dotnet-core https://github.com/emersonsoares/asdf-dotnet-core.git

# check available versions
asdf list all dotnet-core

asdf install dotnet-core 7.0.403
asdf global dotnet-core 7.0.403

# check dotnet working properly
dotnet --info
```

## [lua](https://www.lua.org/)

```bash
asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git

# check available versions
asdf list all lua

asdf install lua 5.4.6
asdf global lua 5.4.6

echo "lua 5.4.6" >> ~/.tool-versions

# check lua working properly
lua -v

```

## [Elixir](https://elixir-lang.org/)

Using asdf to manage elixir versions

### [erlang](https://github.com/asdf-vm/asdf-erlang)

```bash
# install dependencies first for erland
sudo apt install -y build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang 24.0.5

asdf global erlang 24.0.5
```

### [elixir](https://github.com/asdf-vm/asdf-elixir)

```bash
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install elixir 1.12.2-otp-24

asdf global elixir 1.12.2-otp-24

# check elixir is working correctly
elixir --version
```

# GPG and Password manager with pass

This will be used as the credential store for credential helpers ie [docker credential helpers](https://github.com/docker/docker-credential-helpers). 

>You won't need to set this up now unless you know you will need to at least use docker and push to container registries and pull from private container registries.

## [GPG](https://gnupg.org/)

Generate a gpg key. run:

```bash
# if using gpg v2.2
gpg --generate-key

# if not on v2.2, see the manual
gpg --help

# and then find the command to 'generate a new key pair'
# follow through the prompts and complete

# once done, check the generated key
gpg --list-keys
```
## [Pass](https://www.passwordstore.org/)

Install password-store

```bash
git clone https://git.zx2c4.com/password-store ~/password-store
cd ~/password-store
sudo -E make install

# check pass version to confirm working
pass --version

# initialise pass
pass init {{ email used on gpg key creation }}

# ie 'pass init some@email.com'
```

# IDE

## [IntelliJ](https://www.jetbrains.com/help/idea/installation-guide.html)

Install IntelliJ Toolbox and then install Idea and other IntelliJ IDEs from there.

```bash
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.25.12627.tar.gz -P ~/ && \
sudo tar -xzf ~/jetbrains-toolbox-1.25.12627.tar.gz -C /opt
# create symlink to user
sudo ln -s /opt/jetbrains-toolbox-1.25.12627/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox && \
sudo chmod -R +rwx /usr/local/bin/jetbrains-toolbox

# install jetbrains-toolbox deps:
sudo apt install libfuse2 libxi6 libxrender1 libxtst6 mesa-utils libfontconfig libgtk-3-bin -y

# you can then run 'jetbrains-toolbox' from the terminal to start
```

Then install IntelliJ Idea from the toolbox. Once installed, you can run it by running `idea` from the terminal or to open a project

```bash
idea ./some/path/to/project/directory
```

There is a [settings zip file](./intellij/settings-intellij.zip) you can import in Idea to apply configs and theme.

# Docker and Kubernetes

## [Docker](https://www.docker.com/resources/what-container)

Install docker engine using the repository

```bash
# Update package index and install required os packages
sudo apt update
sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add docker GPG keys
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install docker engine
sudo apt update

# NOTE: sometime if you get 'Release file not found' error when running apt update, 
# it could be that the ubuntu release in the docker.list in /etc/apt/sources.list.d/ is incorrect.
# Update docker.list with the correct release name ie from 'Una' to 'Focal'

# Continue with the install
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Test docker engine is working by running a hello-world image
sudo docker run hello-world

# Create docker group to allow users to run docker commands with correct privilege
sudo groupadd docker

# Add user to the docker group
sudo usermod -aG docker $USER

# Activate the changes to the groups
newgrp docker
newgrp $USER

# Add host.docker.internal to /etc/hosts
sudo echo "127.0.0.1 host.docker.internal" | sudo tee -a /etc/hosts

# Log out and back in for the changes to take effect 
```

### Docker Compose V2

```bash
sudo apt update && sudo apt install docker-compose-plugin -y
```

### [Docker Credential Helper](https://github.com/docker/docker-credential-helpers)

You would need to have [GPG and password-store](#gpg-and-password-manager-with-pass) installed and configured before proceeding. Once done:

```bash
cd ~
wget https://github.com/docker/docker-credential-helpers/releases/download/v0.6.2/docker-credential-pass-v0.6.2-amd64.tar.gz
tar -xf docker-credential-pass-v0.6.2-amd64.tar.gz
sudo mv docker-credential-pass /usr/local/bin/

mkdir ~/.docker && touch ~/.docker/config.json
echo -e '{\n  "credsStore": "pass"\n}' >> ~/.docker/config.json
```

#### Multiple docker configs

When you have multiple accounts that pulls from a container registry, you can create multiple docker configs and use the --config option to use a specific docker config

To create another docker config:

```bash
docker --config ~/.docker-registry-1 login registry.example.com -u <username>
```

And to use this config when pulling:

```bash
docker --config ~/.docker-registry-1 pull registry.example.com/container:1.0
```

## Kubernetes with [Minikube](https://minikube.sigs.k8s.io/docs/start/)

```bash
# Install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Start minikube and confirm working
minikube start

# Add kubectl alias in .bashrc to use kubectl included in minikube
echo "alias kubectl='minikube kubectl --'" >> ~/.bashrc

# Check you can access the kubernetes cluster with kubectl
kubectl get po -A
```
Follow further steps 4 from minikube 'docs/start' page to get familiar

https://minikube.sigs.k8s.io/docs/start/

## [Kubernetes](https://kubernetes.io/docs/tutorials/kubernetes-basics)

> NOTE: If you added an alias to kubectl using minikube's kubectl above,
> then you can skip this step
 
Using asdf to manage kubernetes kubectl

```bash
asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git

asdf install kubectl 1.22.2
asdf global kubectl 1.22.2

kubectl version
```

## [Helm](https://helm.sh/)

Using asdf to manage helm

```bash
asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git
asdf install helm 3.8.1

# Set global helm version
asdf global helm 3.8.1

# Check helm is working
helm version
```

# AWS

## [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install)

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
sudo ./aws/install

# install docker ecr login helper
sudo apt install amazon-ecr-credential-helper -y
```

### Configure AWS profile

Create an aws profile:

```bash
aws configure

# set your access and secret
# use getcalleridentity to test your credentials

aws sts get-caller-identity
```

### [Multiple AWS Profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)

You can have multiple aws accounts by adding named profiles. To add a new profile, use the same configure command with the profile option:

```bash
aws configure --profile mynewprofile

# set your access and secret
# use getcalleridentity to test your credentials

aws --profile=mynewprofile sts get-caller-identity
```

To not keep having the profile option on every aws command, you can set an AWS_PROFILE environment variable with the profile you want to use

```bash
export AWS_PROFILE=mynewprofile

# to switch to the default profile
export AWS_PROFILE=default

# or unset AWS_PROFILE to go back to the default profile
unset AWS_PROFILE
```

## [AWS Workspaces](https://clients.amazonworkspaces.com/)

```bash
# Add amazon workspaces repo
wget -q -O - https://workspaces-client-linux-public-key.s3-us-west-2.amazonaws.com/ADB332E7.asc | sudo apt-key add -
echo "deb [arch=amd64] https://d3nt0h4h6pmmc4.cloudfront.net/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/amazon-workspaces-clients.list
sudo apt update

# Install workspace client
sudo apt install workspacesclient
```

# [Terraform](https://www.terraform.io/intro)

Using asdf to manage terraform

```bash
asdf plugin-add terraform https://github.com/Banno/asdf-hashicorp.git
asdf install terraform 1.1.7

# Set global terraform version
asdf global terraform 1.1.7

# Check terraform is working
terraform --version
```

# [MongoDB](https://www.mongodb.com/)

Using asdf to manage mongodb with mongosh

```sh
asdf plugin-add mongosh https://github.com/itspngu/asdf-mongosh
asdf install mongosh 1.5.4
asdf global mongosh 1.5.4

# Check mongosh is working
mongosh --version
```

# [QEMU](https://www.qemu.org/)

Follow [this guide](https://christitus.com/vm-setup-in-linux/) to setup QEMU

OR run commands below

```sh
sudo apt install qemu-kvm qemu-system qemu-utils python3 python3-pip libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y && \
sudo systemctl status libvirtd.service && \
sudo virsh net-start default && \
sudo virsh net-autostart default && \
sudo virsh net-list --all && \
sudo usermod -aG libvirt $USER && \
sudo usermod -aG libvirt-qemu $USER && \
sudo usermod -aG kvm $USER && \
sudo usermod -aG input $USER && \
sudo usermod -aG disk $USER
```

# JMeter

Run the commands below to install jmeter. Change the version to match to download a specific version.

This also adds a `jmeter` alias that runs this jmeter that's downloaded. Remember to update this alias if you need to use a different version of jmeter. 


```bash
wget https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-5.5.zip -P ~/ && \
mkdir -p ~/jmeter && unzip ~/apache-jmeter-5.5.zip -d ~/jmeter && \
echo "alias jmeter='~/jmeter/apache-jmeter-5.5/bin/jmeter'" >> ~/.bashrc
```

# Browser

## Brave

Install the brave browser

```bash
# Update packages and install prereq
sudo apt update && \
sudo apt -y install curl software-properties-common apt-transport-https

# import brave repo keys
curl https://brave-browser-apt-release.s3.brave.com/brave-core.asc| gpg --dearmor > brave-core.gpg && \
sudo install -o root -g root -m 644 brave-core.gpg /etc/apt/trusted.gpg.d/

# Add brave to repo
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Update package and install brave browser
sudo apt update && \
sudo apt install brave-browser -y && \
echo "alias brave='brave-browser'" >> ~/.bashrc
```

## Chrome

```bash
sudo apt update && \
sudo apt install -y curl unzip xvfb libxi6 libconf-2-4 && \
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/ && \
sudo apt install -y ~/google-chrome-stable_current_amd64.deb
```

# DBeaver

Install

```bash
# Add dbeaver repo
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list

# Install
sudo apt update
sudo apt install dbeaver-ce

# Check
apt policy dbeaver-ce
```

# Postman

```bash
wget https://dl.pstmn.io/download/latest/linux64 -O ~/Downloads/linux64
sudo tar -xvf ~/Downloads/linux64 -C /usr/bin
echo 'export PATH="$PATH:/usr/bin/Postman"' >> ~/.bashrc
```

Run `Postman` from terminal or add a shortcut:

```
sudo vim /usr/share/applications/Postman.desktop
```

Paste to file:
```
[Desktop Entry]
Name=Postman API Tool
GenericName=Postman
Comment=Testing API
Exec=/usr/bin/Postman/Postman
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/bin/Postman/app/resources/app/assets/icon.png
StartupWMClass=Postman
StartupNotify=true
```

## Install with snap

The latest version of Postman requires an account. We can use snap to install an earlier version of postman that does not require this

```sh
snap install postman --channel=v9/stable
```

## Uninstall

```bash
sudo rm -r /usr/bin/Postman
sudo rm -r /usr/share/applications/Postman.desktop
sudo rm -r ~/Desktop/Postman.desktop
```

# ODBC

Install odbc

```sh
sudo apt install unixodbc odbcinst
```

Check the location of the configuration file

```sh
odbcint -j
```

## Postgres

Install odbc driver

```sh
sudo apt install odbc-postgresql
```

Add odbc connection for postgres

```sh
vim /etc/odbcinst.ini
```

**Add postgres connection**
```
[postgres]
Driver=/usr/lib/x86_64-linux-gnu/odbc/psqlodbca.so

```

## Informix

See guide from this link [Install informix odbc driver](https://techblog.jj-it.de/oracle-gateway-to-odbc/access-to-informix-database-informix-odbc-driver-installation/) or follow the steps below.

### Install

Install required dependencies

```sh
sudo add-apt-repository universe
install libncurses5 libncurses5:i386
```

Download the [client sdk](https://www.ibm.com/support/pages/download-informix-products) and install.

```sh
sudo mkdir -p /opt/install/ibm/3_7
sudo cp ~/Downlaods/clientsdk.3.70.FC8DE.LINUX.tar /opt/install/ibm/3_7
cd /opt/install/ibm/3_7
sudo tar xf clientsdk.3.70.FC8DE.LINUX.tar
sudo ./installclientsdk

# Install to /opt/IBM/informix
# Select options 1,8,11,12 (odbc and gsl)
```

### Configure

Create a sqlhosts file for informix

```sh
# Depending on where the informix client is installed
# in this case /opt/IBM/informix

sudo cp /opt/IBM/informix/etc/sqlhosts.std /opt/IBM/informix/etc/sqlhosts
sudo vim /opt/IBM/informix/etc/sqlhosts

# Add informix db details ie
echo 'informix onsoctcp localhost 9088' | sudo tee -a /opt/IBM/informix/etc/sqlhosts > /dev/null
```

Add an informix db connection to your odbc.ini file (could be in /etc/odbcinst.ini)

```
[{{name_of_informix_db}}]
Driver=/opt/IBM/informix/lib/cli/iclit09b.so
Database={{database_name}}
Servername={{server_name}}
```

**Export the following env variables**

```sh
echo 'export INFORMIXDIR=/opt/IBM/informix' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$INFORMIXDIR/lib/esql' >> ~/.bashrc
echo 'export ODBCINI=/etc/odbcinst.ini' >> ~/.bashrc
```

# Spotify

```sh
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg && \
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list && \
sudo apt update && \
sudo apt install spotify-client
```

# Shurfshark

```
curl -f https://downloads.surfshark.com/linux/debian-install.sh --output surfshark-install.sh && \
sh surfshark-install.sh
```
