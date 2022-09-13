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
alias gc='git checkout'
alias gcb='git checkout -b'
alias gpl='git pull'
alias gps='git push'
alias gpso='git push origin'
alias gs='git status'
alias gv='git remote -v'
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
