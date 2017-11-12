# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

#vim
alias v="mvim"
if [ -f /usr/local/bin/mvim ]; then
  alias vim="mvim -v"
fi
alias vi=vim

# edit hosts
alias hosts='sudo $EDITOR /etc/hosts'

# Detect which `ls` flavor is in use
if [[ "$OSTYPE" =~ ^darwin ]]; then
  colorflag="-G"
else # OS X `ls`
  colorflag="--color"
fi

# save my wrists
alias e="exit && exit"
alias r="rm -rf $@"

# faster directory switching
alias c="cd $@"

# List all files colorized in long format
alias l="ls -la ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -la ${colorflag}"

# List only directories
alias lsd='ls -l | grep "^d"'

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
  alias ls="command ls -G"
else
  alias ls="command ls --color"
  export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
fi

# `cat` with beautiful colors. requires Pygments installed.
#                  sudo easy_install Pygments
alias ca='pygmentize -O style=monokai -f console256 -g'

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

#disk usage
alias dus='du -Psckx * | sort -nr'

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# File size
alias fs="stat -f \"%z bytes\""

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"


# find and grep
alias ff='find . -name $1'
alias fj='find . -name "*.java" | xargs egrep -nw $1'
alias fgram='find . -name "*.gram" | xargs egrep -nw $1'
alias fmib='find . -name "*.mib" | xargs egrep -nw $1'
alias fch='find . -name "*.[c|h]" | xargs egrep -nw $1'
alias fs='find . -name "*.[chsS]" | xargs egrep -nw $1'
alias fmk='find . \( -name "Makefile" -o -name "Makefile\.*" \) | xargs egrep -nw $1'
alias fpl='find . -name "*.pl" | xargs egrep -nw $1'
alias fxml='find . -name "*.xml" | xargs egrep -nw $1'
alias fxsd='find . -name "*.xsd" | xargs egrep -nw $1'
alias fbuild='find . -name "build.xml" | xargs egrep -nw $1'
alias fa='find . -type file | xargs egrep -nw $1'

# python
alias py='ipython'
# alias pn='jupyter notebook --no-browser &'
alias pnbconvert='ipython nbconvert --to slides --post serve my.ipynb'

# maven shortcuts
alias mi='time mvn install'
alias mc='time mvn compile'
alias mnt='time mvn install -DskipTests=true'
alias mi='time mvn clean install'
alias mcint='time mvn clean install -DskipTests=true' # -Dmaven.test.skip=true skips building test jar
