#!/bin/bash

if [[ ( $1 == "--help") ||  $1 == "-h" ]]; then
    echo "Use option -n with a name to check containers that partially match"
    exit 1
fi

if [[ $1 == "-n" && -n "$2" ]]; then
    matchingContainers=$(docker container list --all --filter name="$2" | awk '{if(NR>1) print $NF}')
    if [[ -z "$matchingContainers" ]]; then
        echo No containers found matching "$2"
        exit 1
    fi

    echo Stopping and removing containers...
    docker container stop $matchingContainers
    docker container rm $matchingContainers
else
    echo "Set a value to search for containers with option -n"
    exit 1
fi
