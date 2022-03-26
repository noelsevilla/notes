# Setup [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about)

- [Setup Windows Subsystem for Linux](#setup-windows-subsystem-for-linux)
  - [Prerequisites](#prerequisites)
  - [Set WSL2 as the default version](#set-wsl2-as-the-default-version)
  - [Install a Linux distribution](#install-a-linux-distribution)
    - [Upgrade linux packages](#upgrade-linux-packages)
  - [Install Windows Terminal](#install-windows-terminal)
  - [Setup Linux environment](#setup-linux-environment)

## Prerequisites

Check if wsl is already installed by running from the terminal:

```bash
wsl

# Windows Subsystem for Linux has no installed distributions.
# Distributions can be installed by visiting the Microsoft Store:
# https://aka.ms/wslstore
```

If it's already installed, then proceed to the next section. Otherwise, continue with installation of WSL by following the steps from [manually install wsl instructions](https://docs.microsoft.com/en-us/windows/wsl/install-manual).

## Set WSL2 as the default version

Use the later [WSL2 version](https://aka.ms/wsl2).

```bash
wsl --set-default-version 2
```

## Install a Linux distribution

Install a linux distribution of choice. This installs Ubuntu 20.04 LTS

```bash
wsl --install --distribution ubuntu-20.04
```

Follow through the prompts, you will be ask to create a user account to run the linux distro as.

Once done, you should have a terminal running in Ubuntu.

### Upgrade linux packages

From the open terminal for Ubuntu, update and upgrade installed packages by running:

```bash
# You will be asked to enter a password for the user.
# This is the user and password you set during the linux distro installation.

sudo apt-get update && sudo apt-get upgrade -y
```

## Install [Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/install)

Windows terminal is a handy app to run miltiple shells including Ubuntu which we installed earlier.

You can install it from the [Windows store here](https://www.microsoft.com/en-nz/p/windows-terminal/9n0dx20hk701?rtc=1).

## Setup Linux environment

Now that you have a linux environment thru WSL, you can set this up using the [env-setup-linux.md guide](https://github.com/noelsevilla/notes/blob/master/configs/env-setup-linux.md).
