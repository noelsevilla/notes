#!/bin/bash

# Add if using git bash
if [ -f ~/.bash_config ]; then
    . ~/.bash_config
fi
export PATH=~/.bash_scripts:$PATH
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# increase nodejs max memory
export NODE_OPTIONS="--max-old-space-size=4096"
