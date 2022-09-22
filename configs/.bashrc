#!/bin/bash

# increase nodejs max memory
export NODE_OPTIONS="--max-old-space-size=4096"

export PATH=~/.bash_scripts:$PATH
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
