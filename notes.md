# Anything Settings

- [Anything Settings](#anything-settings)
  - [Useful commands](#useful-commands)
    - [Color picker](#color-picker)
    - [Unicode table](#unicode-table)
    - [Set default linux editor](#set-default-linux-editor)
  - [SSH](#ssh)
    - [Generate SSH keys for Github (or other version control)](#generate-ssh-keys-for-github-or-other-version-control)
    - [Multiple accounts and hosts](#multiple-accounts-and-hosts)
  - [Linux](#linux)
    - [Find files](#find-files)
    - [Batch rename](#batch-rename)
    - [ddrescue for iso images](#ddrescue-for-iso-images)
  - [Git](#git)
    - [Worktree](#worktree)
    - [Increase qemu/kvm disk size](#increase-qemukvm-disk-size)

## Useful commands

### Color picker

[Color picker tool](https://www.w3schools.com/colors/colors_picker.asp)

### Unicode table

[Unicode character table](https://unicode-table.com/en)

## SSH

### [Generate SSH keys for Github (or other version control)](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

### Multiple accounts and hosts

If you have multiple hosts you need to connect to with different ssh keys, you can add a config to .ssh defining multiple hosts and the corresponding ssh key to use

ie
If you need to access two organizations in github using two different accounts, have two different ssh keys and use the corresponding one for each host like so:

```bash
# ~/.ssh/config
Host github.com # Could be your main account or first organisation
    HostName github.com
    User yourusername
    IdentityFile ~/.ssh/id_ed25519_yourusername_ssh

Host github.com-organisation2
    HostName github.com
    User yourotherusername
    IdentityFile ~/.ssh/id_25519_yourotherusername_ssh
```

Once setup, if you are cloning from your main account, you can do

```bash
git clone git@github.com:yourusername/some-repo.git
```

And to clone a repo from the organisation2 account, do:

```bash
git clone git@github.com-organisation2:organisation2/some-org-repo.git
```

## Linux

### Set default linux editor

```bash
update-alternatives --list editor

update-alternatives --set editor /usr/bin/vim.basic
```

### File Permissions Notation
|||
|-|-|
| 400 | read by owner |
| 040 | read by group |
| 004 | read by anybody |
| 200 | write by owner |
| 020 | write by group |
| 002 | write by anybody |
| 100 | execute by owner |
| 010 | execute by group |
| 001 | execute by anybody |

### Find files

Find files in linux using [find](https://www.plesk.com/blog/various/find-files-in-linux-via-command-line/).

### Batch rename

[How to rename files in linux](https://linuxize.com/post/how-to-rename-files-in-linux/)
[How to rename multiple files on linux](https://linuxconfig.org/how-to-rename-multiple-files-on-linux)

### Increase qemu/kvm disk size

[Increase disk size of a vm and expanding windows vm disk size](https://techglimpse.com/expand-windows-10-vm-virtual-disk-size-qemu-kvm/)


### ddrescue for iso images

```sh
ddrescue -D --force /path/to/iso/image /dev/sdx/path/to/usb
```

### Remove apt repository

Remove file entry of application in directory `/etc/apt/sources.list.d`

## Git

### Worktree

Articles about and on how to use worktrees for workspace and branch management

[How to use git worktree and in a clean way](https://morgan.cugerone.com/blog/how-to-use-git-worktree-and-in-a-clean-way/)
[Worktrees that fetches remote branches from bare repository](https://morgan.cugerone.com/blog/workarounds-to-git-worktree-using-bare-repository-and-cannot-fetch-remote-branches/)
