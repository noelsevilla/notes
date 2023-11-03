# ls
alias ll='ls -alhF --time-style="+%Y-%m-%d %H:%M:%S"'
alias la='ls -A'
alias l='ls -CF'

# git
alias gf='git fetch --all --prune'
alias gl='git log --graph --pretty=format:"%C(auto)%h%d %Cgreen%ad%Creset %s %C(dim white)<%aN>%Creset" --date=format-local:"%Y%m%d-%H%M"'
alias gb='git branch --list --format="%(color:green)%(authordate:format:%Y%m%d-%H%M)%(color:reset) %(color:dim white)%(objectname:short)%(color:reset) %(if)%(HEAD)%(then)%(color:brightgreen)* %(end)%(if)%(push)%(then)%(color:brightwhite)%(refname:short)%(else)%(color:brightred)%(refname:short)%(end) %(color:reset)%(if)%(push:track)%(then)%(color:white)%(push:track) %(else)%(end)%(color:reset)%(color:normal)%(subject) %(color:dim white)<%(authorname)>" --all'
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
alias gbd-all='git branch | egrep -v "(^\*|master)" | xargs git branch -D'
alias gcp='git cherry-pick'
alias gsh='git stash'
alias gshp='git stash pop'
alias gd='git diff'
alias gcom='git commit'
alias gcoma='git commit --amend --no-edit'

# aws
alias aws-get-identity='aws sts get-caller-identity'

# docker
alias d='docker'
alias dc='d container'
alias di='d image'
alias dn='d network'
alias dv='d volume'
alias de='d exec -it'
alias d-restart='d restart'
alias dc-prune='dc prune -f'
alias dc-list='dc list'
alias dc-list-all='dc list --all'
alias di-list='di list'
alias di-list-all='di list --all'
alias di-prune='di prune -f'
alias di-prune-all='di prune --all -f'
alias compose='d compose'

# minikube
alias kube='minikube kubectl --'
alias mini-docker='eval $(minikube docker-env)'

# rust
alias c='cargo'
alias cr='cargo run'

# python
alias pi='pipenv'
alias pirun='pipenv run python'
alias po='poetry'
alias porun='po run python'
alias pytest='pytest -s --disable-warnings --tb=short -m'

# other alias
alias cl='clear'
alias reload='source ~/.bashrc'
alias work='cd ~/work'
alias update-os='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias dbeaver='dbeaver &> /dev/null & '

function idea() {
  if [ -z "$1" ]; then
    source idea &> /dev/null &
  else
    source idea "$1" &> /dev/null &
  fi
}
