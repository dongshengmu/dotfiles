alias g="git"

alias gbd="git branch -d $1"
alias gnb="git checkout -b $1"

alias gbase="git fetch origin && git rebase origin/master"
alias gbasea="sdv run -- git fetch origin && git rebase origin/master"

# Git checkout
alias gc="gitcmd checkout"
alias gca="sdv run -- git checkout"

# git add
alias ga="gitcmd add"
alias gaa="sdv run -- git add"

# git commit
alias gi="gitcmd commit"
alias gia="sdv run -- git commit"

# git status
alias gs="gitcmd status"
alias gsa="sdv run -- git status a -sb"

# git fetch
alias gf="gitcmd fetch"
alias gfa="sdv run -- git fetch"

# git pull
alias gp="gitcmd pull"
alias gpa="sdv run -- git pull"

# git gui
alias gg="gitcmd_for_changed_repo gui"

# git branch
alias gb="gitcmd branch"
alias gba="sdv run -- git branch"

# git diff
alias gd="gitcmd diff"
alias gda="sdv run -- git diff"

# git log
alias gla='sdv run -- "source ~/dotfiles/functions/git.sh; gl"'

# last tag
alias lasttag="git describe --abbrev=0 --tags"

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

# git force stash pop
alias gpop="git stash show -p | git apply && git stash drop"
