#!/bin/bash

export PATH=~/.bash_scripts:$PATH
# Add if using git bash
if [ -f ~/.bash_config ]; then
    . ~/.bash_config
fi
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

# increase nodejs max memory
export NODE_OPTIONS="--max-old-space-size=4096"

# set python pipenv to create venv in project directory
export PIPENV_VENV_IN_PROJECT=1
export PIPENV_VERBOSITY=1
