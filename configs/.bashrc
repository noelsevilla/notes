#!/bin/bash

# Set terminal colors
RED='\033[31m'
GREEN='\033[32m'
BLUE='\033[34m'
CYAN='\033[36m'
NC='\033[0m' # No Color

# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git
alias gf='git fetch --all --prune'
alias gl='git log --graph --pretty=format:"%Cgreen%ad%Creset %C(auto)%h%d %s %C(bold black)<%aN>%Creset" --date=format-local:"%Y-%m-%d %H:%M"'
alias gb='git branch --list --format="%(color:green)%(authordate:format:%Y-%m-%d %H:%M) %(if)%(HEAD)%(then)%(color:brightgreen)* %(end)%(if)%(push)%(then)%(color:brightwhite)%(refname:short)%(else)%(color:brightred)%(refname:short)%(end) %(color:reset)%(if)%(push:track)%(then)%(color:white)%(push:track) %(else)%(end)%(color:reset)%(objectname:short) %(subject) %(color:brightblack)<%(authorname)>" --all'
alias gfb='git fetch --all --prune  && gb'
alias gbd='git branch -D'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gpl='git pull'
alias gps='git push'
alias gpso='git push origin'
alias gs='git status'
alias gv='git remote -v'
alias gc='git clone'
alias gwtl='git worktree list'
alias gwtr='git worktree remove'
alias gwta='git worktree add'
alias gwtp='git worktree prune'

alias ptest='pytest -s --disable-warnings --tb=short -m'

# update os
alias update-os='sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove -y'

# increase nodejs max memory
export NODE_OPTIONS="--max-old-space-size=4096"

removeContainers () {
    if [[ ( $1 == "--help") ||  $1 == "-h" ]]
        then
            echo "Use option -n with a name to check containers that partially match"
            return
    fi

    if [[ $1 == "-n" && -n "$2" ]]
        then
            matchingContainers=$(docker container list --all --filter name="$2" | awk '{if(NR>1) print $NF}')
            if [[ -z "$matchingContainers" ]]
                then
                    echo No containers found matching "$2"
                    return
            fi

            echo Stopping and removing containers...
            docker container stop $matchingContainers
            docker container rm $matchingContainers
        else
            echo "Set a value to search for containers with option -n"
            return
    fi
}


# Add a work tree for a remote branch and set upstream to it
gwta-rb () {
	if [[ -z $1 ]]; then
        echo "Error: Branch name is missing. add name after command like 'gwta-rb branchname'"
        return
    fi

    remoteBranchExist=$(git ls-remote --heads origin "$1")
    if [[ -z $remoteBranchExist ]]; then
        echo "Error: Branch $1 does not exist in remote repo"
        return
    fi

	git worktree add "$1"
	cd "$1" || exit
	git branch --set-upstream-to origin/"$1"
}

# Clone a bare git repo and configure to fetch from remote
gc-bare () {
    if [[ -z $1 ]] || [[ -z $2 ]]; then
        echo "Error: Either the repo and target directory name is missing. Add them  after the command like 'gc-bare reponame directoryname'"
        return
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
        return
    fi
}
