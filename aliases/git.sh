alias g="git"

alias gbd="git branch -d $1"
alias gnb="git checkout -b $1"

alias gbase="git fetch origin && git rebase origin/master"

# Git checkout
alias gc="git checkout"

# git add
alias ga="git add"

# git commit
alias gi="git commit"

# git status
alias gs="git status"

# git fetch
alias gf="git fetch"

# git pull
alias gp="git pull"

# git gui
alias gg="git gui"
#alias gg="git_for_changed_repo gui"

# git branch
alias gb="git branch"

# git diff
alias gd="git diff"

# last tag
alias lasttag="git describe --abbrev=0 --tags"

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

# git force stash pop
alias gpop="git stash show -p | git apply && git stash drop"
