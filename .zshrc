export DOT_CONFIG_HOME=~/dotfiles

# path
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:$HOME/bin:.

# Source file, if it exists
function try-source() {
  if [ -f $1 ]; then
    source $1;
  fi
}

source $DOT_CONFIG_HOME/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/

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

# antigen bundles (https://github.com/zsh-users/antigen)
antigen bundles <<EOBUNDLES
  fasd
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  jira
  jsontools
EOBUNDLES

try-source ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-history-substring-search.git/zsh-history-substring-search.zsh
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

antigen apply


# for agnoster theme
# export DEFAULT_USER=

# Setup zsh-autosuggestions
source ~/.zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}

zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle

# default EDITOR PAGER
export BLOCKSIZE=K
export EDITOR="mvim -v"
export CLICOLOR=1
export LESS="-EirMXx1,5"
export PAGER=less

