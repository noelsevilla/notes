<h1>Setup Windows Subsystem for Linux</h1>

- [Prerequisites](#prerequisites)
- [Set WSL2 as the default version](#set-wsl2-as-the-default-version)
- [Install a Linux distribution](#install-a-linux-distribution)
  - [Upgrade linux packages](#upgrade-linux-packages)
- [Install Windows Terminal](#install-windows-terminal)
- [Setup Linux environment](#setup-linux-environment)
- [Enable GUI on WSL](#enable-gui-on-wsl)
  - [VcXsrc](#vcxsrc)
  - [Configure WSL](#configure-wsl)
- [IntelliJ](#intellij)
  - [Command line is too long Error](#command-line-is-too-long-error)

# Prerequisites

Check if [wsl](https://docs.microsoft.com/en-us/windows/wsl/about) is already installed by running from the terminal:

```bash
wsl

# Windows Subsystem for Linux has no installed distributions.
# Distributions can be installed by visiting the Microsoft Store:
# https://aka.ms/wslstore
```

If it's already installed, then proceed to the next section. Otherwise, continue with installation of WSL by following the steps from [manually install wsl instructions](https://docs.microsoft.com/en-us/windows/wsl/install-manual).

# Set WSL2 as the default version

Use the later [WSL2 version](https://aka.ms/wsl2).

```bash
wsl --set-default-version 2
```

# Install a Linux distribution

Install a linux distribution of choice. This installs Ubuntu 20.04 LTS

```bash
wsl --install --distribution ubuntu-20.04
```

Follow through the prompts, you will be ask to create a user account to run the linux distro as.

Once done, you should have a terminal running in Ubuntu.

## Upgrade linux packages

From the open terminal for Ubuntu, update and upgrade installed packages by running:

```bash
# You will be asked to enter a password for the user.
# This is the user and password you set during the linux distro installation.

sudo apt-get update && sudo apt-get upgrade -y
```

# Install [Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/install)

Windows terminal is a handy app to run miltiple shells including Ubuntu which we installed earlier.

You can install it from the [Windows store here](https://www.microsoft.com/en-nz/p/windows-terminal/9n0dx20hk701?rtc=1).

# Setup Linux environment

Now that you have a linux environment thru WSL, you can set this up using the [env-setup-linux.md guide](https://github.com/noelsevilla/notes/blob/master/configs/env-setup-linux.md).

# Enable GUI on WSL

**NOTE: This is no longer required for WSL running from Windows 11.

Enable running a GUI from WSL on Windows. ie running a browser test.

## [VcXsrc](https://sourceforge.net/projects/vcxsrv/)

This enables the app running from WSL to display in Windows. Download and install it from [here](https://sourceforge.net/projects/vcxsrv/).

When you first run it, allow `Public networks` when the Windows firewall pop up.

Right click on the app icon and select the options `Multiple windows` and `Start no client` for it to display from WSL.

Open the app and from `extra settings` disable `access control`.

## Configure WSL

Log in to your linux distro (ie Ubuntu).

Open bash and run the following:

```bash
echo "export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0" >> ~/.bashrc
echo "export LIBGL_ALWAYS_INDIRECT=1" >> ~/.bashrc
echo "GDK_SCALE=1" >> ~/.bashrc

# echo $DISPLAY to confirm working
echo $DISPLAY

# automatically start dbus
sudo /etc/init.d/dbus start &> /dev/null

# grant paswordless access for dbus
# this will open a file editor
sudo visudo -f /etc/sudoers.d/dbus

# enter the following. replace <your-username> with your linux username
# you can check your username by running the command whoami
<your-username> ALL = (root) NOPASSWD: /etc/init.d/dbus

# save and close the file
```

You should now be able to display a GUI running from WSL on windows.

# IntelliJ

## Command line is too long Error

Set the `Shorten command line` method in the `Run/Debug` configuration of IntelliJ 

OR

In the .idea folder, update `workspace.xml` to add a property with name `dynamic.classpath` and value of `true` in `PropertiesComponent`

```xml
<component name="PropertiesComponent">
  <property name="dynamic.classpath" value="true" />
</component>
```
