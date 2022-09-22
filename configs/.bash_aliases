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

# other alias
alias cl='clear'
alias ptest='pytest -s --disable-warnings --tb=short -m'
alias update-os='sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove -y'
