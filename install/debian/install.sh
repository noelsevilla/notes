#!/bin/bash

export JDK_VERSION="17.0.12-amzn"
export GRADLE_VERSION="8.10.2"
export KOTLIN_VERSION="2.0.21"
export PYTHON_VERSION="3.9.2"
export ASDF_VERSION="v0.14.1"
export GO_VERSION="1.23.2"
export LUA_VERSION="5.4.7"
export NVM_VERSION="v0.40.1"

# Set terminal colors
export TXT_RED="\033[31m"
export TXT_GREEN="\033[32m"
export TXT_BLUE="\033[34m"
export TXT_CYAN="\033[36m"
export TXT_NC="\033[0m" # No Color

sudo apt clean && \
    sudo apt autoclean && \
    sudo apt update

export ENVIRONMENT_DIR=$(realpath "$(dirname "$BASH_SOURCE")")

for f in "${ENVIRONMENT_DIR}"/scripts/*.sh; do
    printf "${TXT_GREEN}--->>> Running ${f}\n${TXT_NC}"
    source "${f}"
    printf "${TXT_GREEN}--->>> Done running ${f}\n${TXT_NC}"
done
