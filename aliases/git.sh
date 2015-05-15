alias g="git"

alias gbd="git branch -d $1"
alias gnb="git checkout -b $1"

alias gbase="git fetch origin && git rebase origin/master"

# `sgnb` create new branch for those repos which have local changes
function sgnb() {
	cmd="if ! git diff-index \-\-quiet HEAD \-\-; then git checkout \-b $1; fi;"
	sdv run $cmd
}

# `gitcmd` 
# 1st argument specifies what git command to run.
# With no more arguments, run `git <cmd>` if in a working repo, else run it in all git repos in a workspace.
# 2nd argument specifies the path of a repo, in which the command will run. If it is "a", run in all repos.
function gitcmd() {
	if [ $# -eq 0 ]; then
		echo "No git command specified!"
	elif [ $# -eq 1 ]; then
		cmd=$1;
		if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
			# currently under a working repo, run the git cmd 
			git $cmd;
		else
			# not in a working repo, run the git cmd for all repos
			sdv run git $cmd;
		fi;
	else
		cmd=$1;
		dir=$2;
		shift 2;
		if [[ $dir == "a" ]]; then
			# all directory
			sdv run git $cmd $@;
		else
			# a specified directory
			cd $dir;
			git $cmd $@;
			cd -;
		fi;
	fi;
}

# Similar to `gitcmd`, but filter out repos without local change.
function gitcmd_for_changed_repo() {
	if [ $# -eq 0 ]; then
		echo "No git command specified!"
	elif [ $# -eq 1 ]; then
		cmd=$1;
		if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
			# currently under a working repo, run the git cmd 
			git $cmd;
		else
			# not in a working repo, run the git cmd for all repos with local changes
			cmd_co="if ! git diff-index \-\-quiet HEAD \-\-; then git $cmd; fi;"
			sdv run $cmd_co
		fi;
	else
		cmd=$1;
		dir=$2;
		shift 2;
		if [[ $dir == "a" ]]; then
			# run the git cmd for all repos with local changes
			cmd_co="if ! git diff-index \--quiet HEAD \--; then git $cmd $@; fi;"
			echo "sdv run $cmd_co"
			sdv run $cmd_co
		else
			# a specified directory
			cd $dir;
			pwd;
			echo "git $cmd $@"
			git $cmd "$@";
			cd -;
		fi;
	fi;
}

# Git checkout
alias gc="gitcmd checkout"

# git add
alias ga="gitcmd add"

# git commit
alias gi="gitcmd commit"

# git status
alias gs="gitcmd status"

# git fetch
alias gf="gitcmd fetch"

# git pull
alias gp="gitcmd pull"

# git gui
alias gg="gitcmd_for_changed_repo gui"

# git branch
alias gb="gitcmd branch"

# git diff
alias gd="gitcmd diff"

# last tag
alias lasttag="git describe --abbrev=0 --tags"

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

# git force stash pop
alias gpop="git stash show -p | git apply && git stash drop"
