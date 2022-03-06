# Setup WSL dev environment

## [ssh-ident](https://github.com/ccontavalli/ssh-ident)

Use to start ssh-agents and load ssh keys on demand once. this requires python > 3 to be available.

```bash
mkdir -p ~/bin; wget -O ~/bin/ssh goo.gl/MoJuKB; chmod 0755 ~/bin/ssh
echo 'export PATH=~/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

## [Node](https://nodejs.org/en/)

### [nvm](https://github.com/nvm-sh/nvm)

Install to manage node versions.

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# check nvm installed
command -v nvm

# install node
nvm install node

# or with a specific version
nvm install node 16.13.1

# it default to the first node installed but to use a different version
nvm use 16.13.1

# install yarn globally
npm install -g yarn

# check yarn working properly
yarn --version

```

## [SDKMan](https://sdkman.io/)

Use this to install SDKs for the JVM like Java and Kotlin

```bash
curl -s "https://get.sdkman.io" | bash

# check SDKMan working properly
sdk version
```

### [Java](https://www.w3schools.com/java/java_intro.asp)

Using [SDKMan](##SDKMan), install a version of Java

```bash
sdk install java 17.0.1-open

# check java working properly
java --version
```

### [Gradle](https://gradle.org/)

Using [SDKMan](##SDKMan), install a version of Gradle

```bash
sdk install gradle 7.3

# check gradle working properly
gradle --version
```

### [Kotlin](https://kotlinlang.org/)

Using [SDKMan](###SDKMan), install a version of Kotlin
```bash
sdk install kotlin 1.5.30

# check kotlin working properly
kotlin -version

```

## [DotNet](https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu)

Pick the matching version of Ubuntu

```bash
# Get the Microsoft package
wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Install SDK
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-5.0

# check dotnet working properly
dotnet --version
```

## [Ruby](https://www.ruby-lang.org/en/)

### [rbenv](https://github.com/rbenv/rbenv)

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

## [Python](https://www.python.org/)

### [pyenv](https://github.com/pyenv/pyenv)

Using pyenv to manage python installations and versions
```bash
# install required linraries to build python later on first
sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# then install pyenv
curl https://pyenv.run | bash

# add this to ~/.bashrc
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# check pyenv is working properly
pyenv

# install a python version
pyenv install 3.9.7

# set a default python version thru pyenv
vim ~/.pyenv/version

# enter the version to use and save file
```

## [Rust](https://www.rust-lang.org/tools/install)

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# check rust is working properly
rustup --version
rustc --version
```

## [asdf](https://github.com/asdf-vm/asdf)

Using this to manage versions for different environments and tools

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1

# add asdf and asdf completions to .bashrc
echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc

# reload shell
exec $SHELL

# check asdf is working correctly
asdf --version

```

### [Go](https://kubernetes.io/)

Using asdf to manage go

```bash
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git

asdf install golang 1.17.6
asdf global golang 1.17.6

go version
```

### [Kubernetes](https://kubernetes.io/)

Using asdf to manage kubernetes kubectl

```bash
asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git

asdf install kubectl 1.22.2
asdf global kubectl 1.22.2

kubectl version
```

### [Helm](https://helm.sh/)

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

### [Elixir](https://elixir-lang.org/)

Using asdf to manage elixir versions

#### [erlang](https://github.com/asdf-vm/asdf-erlang)

```bash
# install dependencies first for erland
apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang 24.0.5

asdf global erlang 24.0.5
```

#### [elixir](https://github.com/asdf-vm/asdf-elixir)

```bash
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install elixir 1.12.2-otp-24

asdf global elixir 1.12.2-otp-24

# check elixir is working correctly
elixir --version
```
## AWS

### [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install)

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

### [AWS Workspaces](https://clients.amazonworkspaces.com/)

```bash
# Add amazon workspaces repo
wget -q -O - https://workspaces-client-linux-public-key.s3-us-west-2.amazonaws.com/ADB332E7.asc | sudo apt-key add -
echo "deb [arch=amd64] https://d3nt0h4h6pmmc4.cloudfront.net/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/amazon-workspaces-clients.list
sudo apt-get update

# Install workspace client
sudo apt-get install workspacesclient
```
