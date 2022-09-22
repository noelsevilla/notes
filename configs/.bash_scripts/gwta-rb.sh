#!/bin/bash

# Add a work tree for a remote branch and set upstream to it
if [[ -z $1 ]]; then
    echo "Error: Branch name is missing. add name after command like 'gwta-rb branchname'"
    exit 1
fi

remoteBranchExist=$(git ls-remote --heads origin "$1")
if [[ -z $remoteBranchExist ]]; then
    echo "Error: Branch $1 does not exist in remote repo"
    exit 1
fi

git worktree add "$1"
cd "$1" || exit
git branch --set-upstream-to origin/"$1"
