- [Upgrade nodejs and nvm](#upgrade-nodejs-and-nvm)
  - [Check node version](#check-node-version)
  - [Install and use node version](#install-and-use-node-version)
- [Update node js project dependencies](#update-node-js-project-dependencies)
  - [Check outdated packages](#check-outdated-packages)
  - [Update all packages to latest versions](#update-all-packages-to-latest-versions)
  - [Update individual packages to specific or latest version](#update-individual-packages-to-specific-or-latest-version)
    - [Update package to latest version](#update-package-to-latest-version)
    - [Update package to specific version](#update-package-to-specific-version)

# Upgrade nodejs and nvm

This notes how to upgrade [nodejs](https://nodejs.org/en/) and project dependencies and [nvm](https://github.com/nvm-sh/nvm).

## Check node version

From a terminal, check the current version of node running

```sh
node -v
```

To check the versions of node installed from nvm

```sh
nvm list
```

And to check versions available to install from remote

```sh
nvm ls-remote
```

## Install and use node version

Get a list of avaiable node version in nvm to install. In the case of updating node, see if there is a version higher than the current version by running the script earlier.

If there is a new version available to install, run `nvm install` with the version number ie to install version 18.7.0:

```sh
nvm install 18.7.0
```

This installs the version of node locally, but it would not have set this as your current node server. To do this, you would run the `nvm use` command like so:

```sh
nvm use 18.7.0
```

# Update node js project dependencies

## Check outdated packages

When updating a package to a specific version, you can check for versions of the package on the npm registry.

You can also use a convenient way of checking for update paths using the `outdated` command. This will list the current and latest version of your package, a link to the npm registry and if the upgrade includes breaking changes or not.

```sh
# yarn
yarn outdated

# or a specific package
yarn outdated package-name
```

```sh
# npm
npm outdated

# or a specific pakcage
npm outdated package-name
```

You will see the latest version, a link to the package website and effect of the package upgrade, whether it includes breaking changes or not.

## Update all packages to latest versions

Updating all packages to their latest versions would be the quickest way to update the dependencies of a project. You can do this by running:

```sh
# yarn
yarn upgrade --latest
```

```sh
# npm
# There is no direct way to upgrade all packages to latest using npm
# Run this instead
npm outdated | sed '1d; s/ .*/@latest/' | xargs npm i --save
```

This will check the npm registry and pick the latest version of each dependencies and upgrade to these versions and will update package.json and yarn-lock.json with the new versions.

## Update individual packages to specific or latest version

### Update package to latest version

Updating a package to the latest version can be done by running:

```sh
# yarn
yarn upgrade package-name --latest
```

```sh
# npm
npm install package-name@latest # pass --save-dev for dev dependencies
```

### Update package to specific version

Updating a package to a specific version can be done by running:

```sh
# yarn
yarn upgrade package-name@4.2.0 # any version number
```

```sh
# npm
npm install package-name@4.2.0 # pass --save-dev for dev dependencies
```
