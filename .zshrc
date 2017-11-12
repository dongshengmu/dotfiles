export DOT_CONFIG_HOME=~/dotfiles

# path
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:$HOME/bin:.

# Source file, if it exists
function try-source() {
  if [ -f $1 ]; then
    source $1;
  fi
}

source "${DOT_CONFIG_HOME}/.zgen/zgen.zsh"
# if the init script doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting

    # bulk load
    zgen loadall <<EOPLUGINS
        #fasd
        zsh-users/zsh-syntax-highlighting
        zsh-users/zsh-history-substring-search
        #jira
        #jsontools
EOPLUGINS
    # ^ can't indent this EOPLUGINS

    # completions
    zgen load zsh-users/zsh-completions src

    zgen load robbyrussell/oh-my-zsh lib/

    # theme
    zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
fi

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000

setopt appendhistory autocd beep extendedglob nomatch
bindkey -v
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

# Detect OS
UNAME=`uname`
CURRENT_OS='Linux'
DISTRO=''

if [[ $UNAME == 'Darwin' ]]; then
    CURRENT_OS='OS X'
else
    # Must be Linux, determine distro
    # Work in progress, so far CentOS is the only Linux distro I have needed to
    # determine
    if [[ -f /etc/redhat-release ]]; then
        # CentOS or Redhat?
        if grep -q "CentOS" /etc/redhat-release; then
            DISTRO='CentOS'
        else
            DISTRO='RHEL'
        fi
    fi
fi

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# bind UP and DOWN arrow keys
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# bind A E to begining/end of line
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# bind R for history search
bindkey '^R' history-incremental-search-backward

# activate theme
# antigen theme https://gist.github.com/sethmcl/daa7bfad597bb5f423d6 ice
# antigen theme https://gist.github.com/sethmcl/5567c8519760c8e7b5d2 agnoster
# antigen theme https://github.com/robbyrussell/oh-my-zsh themes/agnoster
source $DOT_CONFIG_HOME/dmu-agnoster.zsh-theme

# load environment
for file in $DOT_CONFIG_HOME/.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# FasD
eval "$(fasd --init auto)"

# vim key bindings
bindkey -v

try-source ~/.nvm/nvm.sh

# for agnoster theme
# export DEFAULT_USER=

# Setup zsh-autosuggestions
source ~/.zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'

# default EDITOR PAGER
export BLOCKSIZE=K
export EDITOR="mvim -v"
export CLICOLOR=1
export LESS="-EirMXx1,5"
export PAGER=less
