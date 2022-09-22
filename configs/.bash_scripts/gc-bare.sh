#!/bin/bash

# Set terminal colors
RED='\033[31m'
GREEN='\033[32m'
BLUE='\033[34m'
CYAN='\033[36m'
NC='\033[0m' # No Color

# Clone a bare git repo and configure to fetch from remote
if [[ -z $1 ]] || [[ -z $2 ]]; then
    echo "Error: Either the repo and target directory name is missing. Add them  after the command like 'git-clone-bare reponame directoryname'"
    exit 1
fi

printf "Cloning ${CYAN}'$1'${NC} to ${BLUE}'$2'${NC}\n"
cloneResult=$(git clone --bare "$1" "$2"/.repo 2>&1)
cloneExitCode=$?

if [ $cloneExitCode == 0 ] || [[ $cloneResult == *"already exists"* ]]; then
    printf "${cloneResult}\n"
    cd "$2" || exit
    printf "Setting git configs\n"
    echo "gitdir: ./.repo" > .git
    git config --local remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
    git fetch --all --prune
    defaultBranch=$(git remote show origin | awk '/HEAD branch/ {print $NF}')
    if [[ $defaultBranch != *"(unknown)" ]]; then
        printf "Getting latest of the ${defaultBranch} branch\n"
        gwta-rb "$defaultBranch" # this is another function, see above. make sure it exists ^^^
        cd ..
    else
        printf "Not adding a default branch worktree. Repo has an unknown HEAD branch\n"
    fi
    cd ..
    printf "${GREEN}Done${NC}\n\n"
else
    printf "${RED}Error cloning $1$\n${cloneResult}\n\n${NC}"
    exit 1
fi
