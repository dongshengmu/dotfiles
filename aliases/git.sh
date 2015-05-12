alias g="git"

alias gbd="git branch -d $1"
alias gnb="git checkout -b $1"

# `sgnb` create new branch for those repos which have local changes
function sgnb() {
	cmd="if ! git diff-index \-\-quiet HEAD \-\-; then git checkout \-b $1; fi;"
	sdv run $cmd
}

alias gbase="git fetch origin && git rebase origin/master"

# Git checkout
# alias gc="git checkout $@"
alias sgc="sdv run git checkout $@"
function gc() {
	if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		git checkout $@;
	else
		if [ $# -eq 0 ]; then
			sdv run git status;
		else
			cd $1;
			shift;
			git checkout $@;
			cd -;
		fi;
	fi;
}

# git add
# alias ga="git add"
function ga() {
	if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		git add $@;
	else
		if [ $# -eq 0 ]; then
			sdv run git status;
		else
			cd $1;
			shift;
			git add $@;
			cd -;
		fi;
	fi;
}

# git commit
# alias gi="git commit"
function gi() {
	if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		git commit $@;
	else
		if [ $# -eq 0 ]; then
			sdv run git status;
		else
			cd $1;
			shift;
			git commit $@;
			cd -;
		fi;
	fi;
}

# git status
# alias gs="git status"
# `gs` do `git status` if in a git repo, otherwise do `sdv run git status`
function gs() {
	if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		git status;
	else
		if [ $# -eq 0 ]; then
			sdv run git status;
		else
			cd $@;
			git status;
			cd -;
		fi;
	fi;
}

# git gui
# alias gg="git gui"
function gg() {
	if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		git gui;
	else
		if [ $# -eq 0 ]; then
			# run `git gui` for those repos which have local changes
			sdv run "if ! git diff-index \-\-quiet HEAD \-\-; then git gui; fi;";
		else
			cd $1;
			git gui;
			cd -;
		fi;
	fi;
}

# git branch
# alias gb="git branch"
alias sgb="sdv run git branch"
function gb() {
	if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		git branch $@;
	else
		if [ $# -eq 0 ]; then
			sdv run git branch;
		else
			cd $1;
			shift;
			git branch $@;
			cd -;
		fi;
	fi;
}

# git diff
# alias gd="git diff"
alias sgd="sdv run git diff"
function gd() {
	if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		git diff $@;
	else
		if [ $# -eq 0 ]; then
			sdv run git diff;
		else
			cd $1;
			shift;
			git diff $@;
			cd -;
		fi;
	fi;
}

# last tag
alias lasttag="git describe --abbrev=0 --tags"

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

# git force stash pop
alias gpop="git stash show -p | git apply && git stash drop"
