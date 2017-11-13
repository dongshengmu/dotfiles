#!/usr/bin/env bash
# take this repo and copy it to somewhere else minus the .git stuff.
function gitexport(){
  mkdir -p "$1"
  git archive master | tar -x -C "$1"
}

__git_files () { 
    _wanted files expl 'local files' _files     
}

# `sgnb` create new branch for those repos which have local changes
function sgnb() {
  cmd="if ! git diff-index --quiet HEAD --; then git checkout -b $1; fi;"
}

# `gitcmd` 
# 1st argument specifies what git command to run.
# With no more arguments, run `git <cmd>` if in a working repo, else run it in all git repos in a workspace.
# 2nd argument specifies the path of a repo, in which the command will run. If it is "a", run in all repos.
function gitcmd() {
  if [ $# -eq 0 ]; then
    echo "No git command specified!";
  elif $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    # currently under a working repo
    cmd=$1;
    shift;
    if [[ $1 == "a" ]]; then
      # run the git cmd in all repos
      shift;
    else
      # run the git cmd in current repo
      git $cmd $@;
    fi;
  elif [ $# -eq 1 ]; then
    # not in a working repo, and no dir specification
    cmd=$1;
    shift;
  else
    cmd=$1;
    dir=$2;
    shift 2;
    if [[ $dir == "a" ]]; then
      # all directory
    else
      # a specified directory
      cd $dir;
      if [[ $? = 0 ]]; then
        git $cmd $@;
        cd -;
      fi;
    fi;
  fi;
}

# Similar to `gitcmd`, but filter out repos without local change.
function gitcmd_for_changed_repo() {
  if [ $# -eq 0 ]; then
    echo "No git command specified!";
  elif $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    # currently under a working repo
    cmd=$1;
    shift;
    if [[ $1 == "a" ]]; then
      # run the git cmd in all repos
      shift;
      cmd_co="if ! git diff-index --quiet HEAD --; then git $cmd $@; fi;"
    else
      # run the git cmd in current repo
      git $cmd $@;
    fi;
  elif [ $# -eq 1 ]; then
    # not in a working repo, and no dir specification
    cmd=$1;
    shift;
    cmd_co="if ! git diff-index --quiet HEAD --; then git $cmd $@; fi;"
  else
    cmd=$1;
    dir=$2;
    shift 2;
    if [[ $dir == "a" ]]; then
      # all directory
      cmd_co="if ! git diff-index --quiet HEAD --; then git $cmd $@; fi;"
    else
      # a specified directory
      cd $dir;
      if [[ $? = 0 ]]; then
        git $cmd $@;
        cd -;
      fi;
    fi;
  fi;
}


# git log
function gl() {
  hash_width=10
  hash_post=",trunc"
  hash_color="yellow"

  author_width=28
  author_post=",trunc"
  author_color="green"

  subject_width=10
  subject_post=""
  subject_color="cyan"

  date_width=10
  date_post=""
  date_color="bold white"

  git log --pretty=format:"%<|(${hash_width}${hash_post})%C(${hash_color})%h%<|(${author_width}${author_post})%C(${author_color})%an%<|(${subject_width}${subject_post})%C(${subject_color})%s %C(${date_color})(%ar)" $@ | less
}

function gls() {
  git log --pretty=format:"%C(yellow)%h:%Cgreen%an %C(cyan)%s %C(bold white)(%ar)" --stat $@ | less
}

function glsf() {
  git log --pretty=format:"%C(yellow)%h:%Cgreen%an %C(cyan)%s %C(bold white)(%ar)" --stat -p $@ | less
}
