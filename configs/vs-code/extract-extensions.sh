#!/bin/bash

extensions=$(code --list-extensions)
for extension in ${extensions[*]}; do
	printf "$extension%s\n"
done > extensions
