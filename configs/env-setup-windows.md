# Setup Windows dev environment

## [Chocolatey](https://chocolatey.org/install)

Windows package manager. Will require for installing some tools.

Follow instructions from [here](https://chocolatey.org/install).

```bash
# check chocolatey is installed
choco -v
```

## [Git](https://git-scm.com/downloads)

Install git and git bash for windows.

**NOTE: Install git to C:\git instead of C:\Program Files. This allows us to perform symlinks later on this setup for [SDKMan](#sdkman).**

## [C++ build tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)

Download and install C++ build tools from [here](https://visualstudio.microsoft.com/visual-cpp-build-tools/).

## [Node](https://nodejs.org/en/)

### [nvm](https://github.com/coreybutler/nvm-windows/releases)

Download the setup.zip file from the latest release, extract and run setup as administrator.

Run terminal as administrator to run and use nvm.

```bash
# check nvm installed
nvm

# install a version of node
nvm install 16.13.0

# use a version of node
nvm use 16.13.0

# check if yarn is installed
yarn -v

# if yarn not installed, install it globally
npm install -g yarn
```

## [Ruby](https://www.ruby-lang.org/en/)

### [rbenv](https://github.com/nak1114/rbenv-win)

Download and run the batch file from [here](https://gist.github.com/nak1114/7ea63204203883c5884d)

```bash
# check rbenv installed
rbenv

# install a version of ruby
rbenv install 2.6.6-x64

# set a global ruby version
rbenv global 2.6.6-x64
rbenv rehash
```

## [Python](https://www.python.org/)

### [pyenv](https://github.com/pyenv-win/pyenv-win)

git clone pyenv

```bash
git clone https://github.com/pyenv-win/pyenv-win.git "$HOME/.pyenv"
```

add these to environment variables from powershell

```powershell
[System.Environment]::SetEnvironmentVariable('PYENV',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
[System.Environment]::SetEnvironmentVariable('PYENV_ROOT',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
[System.Environment]::SetEnvironmentVariable('PYENV_HOME',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")

```

add user path variable

```powershell
[System.Environment]::SetEnvironmentVariable('path', $env:USERPROFILE + "\.pyenv\pyenv-win\bin;" + $env:USERPROFILE + "\.pyenv\pyenv-win\shims;" + [System.Environment]::GetEnvironmentVariable('path', "User"),"User")

```

```bash
# check pyenv working
pyenv

# install a version of python
pyenv install 3.9.3

# set a global python version
pyenv global 3.9.3
pyenv rehash
```

## [SDKMan](https://sdkman.io/)

Use this to install SDKs for the JVM like Java and Kotlin

Download and install [7zip](https://www.7-zip.org/download.html) and make it the default zip executable

```bash
ln -s /c/Program\ Files/7-Zip/7z.exe /c/git/mingw64/bin/zip.exe

# install sdkman
curl -s "https://get.sdkman.io" | bash

# check sdkman working
sdk version
```

### [Java](https://www.w3schools.com/java/java_intro.asp)

Using [SDKMan](##SDKMan), install a version of Java

```bash
sdk install java 17.0.1-open
sdk use 17.0.1-open

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
sdk install kotlin 1.5.3

# check kotlin working properly
source ~/.bashrc
kotlin -version
```

## [Rust](https://www.rust-lang.org/tools/install)

Download and install from installer. make sure c++ build tools are installed first.

```bash
# check rust is working
rustup --version
rustc --version
```

## [Helm](https://helm.sh/)

Install helm from chocolatey

```bash
choco install kubernetes-helm

# check helm is working
helm version
```

## [Go](https://go.dev/)

Install golang from chocolatey

```bash
choco install golang --version 1.17.13

# check go is working
go version
```
