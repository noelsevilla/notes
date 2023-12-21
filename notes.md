<h1>Anything Settings</h1>

- [Useful commands](#useful-commands)
  - [Color picker](#color-picker)
  - [Unicode table](#unicode-table)
  - [Regex look ahead and behind](#regex-look-ahead-and-behind)
- [SSH](#ssh)
  - [Generate SSH keys for Github (or other version control)](#generate-ssh-keys-for-github-or-other-version-control)
  - [Multiple accounts and hosts](#multiple-accounts-and-hosts)
- [Linux](#linux)
  - [Set default linux editor](#set-default-linux-editor)
  - [File Permissions Notation](#file-permissions-notation)
  - [Find files](#find-files)
  - [Batch rename](#batch-rename)
  - [Increase qemu/kvm disk size](#increase-qemukvm-disk-size)
  - [ddrescue for iso images](#ddrescue-for-iso-images)
  - [Remove apt repository](#remove-apt-repository)
- [Git](#git)
  - [Worktree](#worktree)
- [Read or Watch](#read-or-watch)
  - [Simplicity](#simplicity)
  - [Naming](#naming)
  - [Testing](#testing)
  - [JavaScript double vs triple equal for comparison](#javascript-double-vs-triple-equal-for-comparison)
  - [5 things to make work worth doing](#5-things-to-make-work-worth-doing)
  - [4 kinds of people we work with](#4-kinds-of-people-we-work-with)

# Useful commands

## Color picker

[Color picker tool](https://www.w3schools.com/colors/colors_picker.asp)

## Unicode table

[Unicode character table](https://unicode-table.com/en)

## Regex look ahead and behind

Examples of [using look ahead and look behind with Regex](https://javascript.info/regexp-lookahead-lookbehind)

For a given path `/path/ids/12s4f-245sr-65ht7/items/12dr5-24fgs-rgt76` , we want to extract two ids:

- One between `ids` and `items`, using:

  ```/(?<=ids\/).*(?=\/items)/ --> 12s4f-245sr-65ht7```

- the other after `items`, using:

  ```/(?<=\/items\/).*/ --> 12dr5-24fgs-rgt76```

# SSH

## [Generate SSH keys for Github (or other version control)](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

## Multiple accounts and hosts

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

# Linux

## Set default linux editor

```bash
update-alternatives --list editor

update-alternatives --set editor /usr/bin/vim.basic
```

## File Permissions Notation
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

## Find files

Find files in linux using [find](https://www.plesk.com/blog/various/find-files-in-linux-via-command-line/).

## Batch rename

[How to rename files in linux](https://linuxize.com/post/how-to-rename-files-in-linux/)
[How to rename multiple files on linux](https://linuxconfig.org/how-to-rename-multiple-files-on-linux)

## Increase qemu/kvm disk size

[Increase disk size of a vm and expanding windows vm disk size](https://techglimpse.com/expand-windows-10-vm-virtual-disk-size-qemu-kvm/)


## ddrescue for iso images

```sh
ddrescue -D --force /path/to/iso/image /dev/sdx/path/to/usb
```

## Remove apt repository

Remove file entry of application in directory `/etc/apt/sources.list.d`

# Git

## Worktree

Articles about and on how to use worktrees for workspace and branch management

[How to use git worktree and in a clean way](https://morgan.cugerone.com/blog/how-to-use-git-worktree-and-in-a-clean-way/)
[Worktrees that fetches remote branches from bare repository](https://morgan.cugerone.com/blog/workarounds-to-git-worktree-using-bare-repository-and-cannot-fetch-remote-branches/)

# Read or Watch

## Simplicity

> There are two ways of constructing software;</br>
> One way is to make it so simple that there are obviously no deficiencies;</br>
> And the other is to make it so complicated that there are no obvious deficiencies.
> 
> \- Tony Hoare

> Perfection is achieved,</br>
> not when there is nothing more add,</br>
> but when there is nothing left to take away
> 
> \- Antoince de Saint-Exupery

> If you have two equally likely solutions to a problem,</br>
> choose the simplest
>
> \- Occam's Razor

> Don't confuse terse with concise and simple

- [The Art of Simplicity](https://www.youtube.com/watch?v=R4C_JciDsuo)

- [RDD - Resume Driven Development](https://www.youtube.com/watch?v=nZcLHkORdHE&t=32m43s)

- [JDD - Jesus Driven Development](https://www.youtube.com/watch?v=uQ75fI1tqoM&t=1336s)

- [Long Method](https://www.youtube.com/watch?v=nVZE53IYi4w&t=35m33s) is not about the length of the code, but levels of abstraction

## Naming

> If we can't name a variable or a function appropriately,</br>
> it may be a sign we've not yet understood its true purpose.

- [Give good meaningful names](https://www.youtube.com/watch?v=nVZE53IYi4w&t=38m37s)

- [Naming things](https://www.youtube.com/watch?v=-J3wNP6u5YU)

## Testing

> Testing vs Verification;</br>
> Testing is the act of gaining insight;</br>
> Verification checks if it still works

- [We automate tests not because we have a lot of time, but because we don't](https://www.youtube.com/watch?v=uQ75fI1tqoM&t=1531s)

## JavaScript double vs triple equal for comparison

Watch Venkat talk about [using double and tiple equals in javascript](https://www.youtube.com/watch?v=aIVKX5SeLoE&t=27m55s)

```javascript
const a = '1';
const b = 1;
const c = '1.0';

console.log(a == b); // true
console.log(b == c); // true
console.log(a == c); // false

console.log(a === b); // false
console.log(b === c); // false
console.log(a === c); // false

```

## 5 things to make work worth doing

- where you want to live
- who you work with
- the mission that you're doing
- how much you get paid
- ability to control your time

## 4 kinds of people we work with

[People we work with in software](https://www.youtube.com/watch?v=llGgO74uXMI&t=5906s)

1. knows domain really well, knows no software
2. knows no domain, knows software really well
3. knows domain really well and knows software really well 
