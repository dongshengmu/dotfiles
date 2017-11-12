# User specific exports

# set DEFAULT_USER to hide the prompt user name
export DEFAULT_USER=dongshengmu
plugins=(zsh-autosuggestions git brew gem npm pip rvm django virtualenv pod virtualenvwrapper bower)
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# use functions/git.sh gl() instead of alias .zgen gl
unalias gl

#alias ll='ls -lFtr'
alias pn='pyter notebook --notebook-dir=~/notebooks/caterpillar --no-browser &> ~/jupyter.log &'

export PATH=~/anaconda3/bin:$PATH
export PYTHONSTARTUP=~/.pythonrc
# export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
# export SPLUNK_HOME=/Applications/Splunk

source $DOT_CONFIG_HOME/extra/company.sh
