################
# dmu customized
################

# command history search
alias h='history 25'
bind '"\e[A": history-search-backward'  # Up arrow
bind '"\e[B": history-search-forward'   # Down arrow

export BLOCKSIZE=K
export EDITOR="mvim -v"
export CLICOLOR=1
export LESS="-EirMXx1,5"
export PAGER=less

alias vi='mvim -v'
alias ll='ls -lFtra'
alias lt='ls -rt'

alias mydu='sudo du -h --max-depth=1 --exclude=./homes/* --exclude=./volume/* --exclude=./mnt/* | sort '

GREP_COLOR='1;37;41'
alias grep='grep --color=auto'
alias psf='ps -eaf --forest'
alias vnc='vncserver -geometry 1440x900'
export LSCOLORS='Da'

echo "Bash tip: use Ctrl-R to search command line history. Or !x for last command starts with x"

DOCDESTDIR=~/public_html/daybreak/; export DOCDESTDIR
export CISRC=/volume/junosv-storage02/ssd-builder/ssd_jenkins/workspace/NGSRX_CI
export CIREVM=/host/svl-ssd-build02/b/ssd-builder/ssd_jenkins/workspace/REVM_CI/PVT_SBU_NGSRX_X46_BRANCH/src/

export PYTHONSTARTUP=~/.pythonrc
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export SPLUNK_HOME=/Applications/Splunk

alias mountsvn='mount -t smbfs //dmu@eng-sam.jnpr.net/svl-junos-d013-b/dmu svnsb'
alias mountgit='mount svl-eng009-cf2:/vol/ngsrx_dev_store/ngsrx-dev-store/dmu gitsb'
alias aca='ant clean; ant'

# Git bash auto completion for git commands and branch names
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias find_large_files='find . -type f -size +20000k -exec ls -lh {} \; '
alias find_firefox_lock='find ~/.mozilla/firefox -name ".parentlock"'
#'find . -name ".parentlock" -exec ls -l '{}' \; '

alias grepall='find . -type file | xargs egrep $1'
alias grepp='find . -name "*.[hcSs]" -print | xargs egrep $1'
alias grepmakefile="find . \( -name makefile -o -name '*.mak' \) -print | xargs egrep $1"

# prepare cscope filelist
alias makecscope="find . -name '*.[chsS]' -print > cscope.files"
# build cscope db
alias buildcscope='cscope -b -R -q'
#start cs
alias cs='cscope -d -R'

alias ppcgdb='/volume/fwtools/gdb/2005a_401/bin/powerpc-eabi-gdb *.elf'
alias jrca='/volume/fwtools/jrca/current'

alias py='ipython'
alias pn='ipython notebook'
alias pnbconvert='ipython nbconvert --to slides --post serve my.ipynb'

alias diffi="diff -I ' \$Id: .* Exp \$$'"
alias cvspatch='echo "cvs diff -upN > file; then, patch -u -p -N -i patchfile > log_file"'
alias mypatch='patch -u -p -N -i'
alias lookup-email-alias='echo "laka -find $USER"'
alias copsreview='echo "cops reviewers --pr xxx --logfile ~/prxxx_log.txt > ~/prxxx_review.txt; /usr/sbin/sendmail -odb -oem -t < ~/prxxx_review.txt"'
alias sendcops='/usr/sbin/sendmail -odb -oem -t'

alias mysym94='cat ~/1 | $SB/src/juniper/pfe/tools/jemsym/jemsym *.sym'
alias mysym='cat ~/1 | $SB/src/pfe/tools/jemsym/jemsym *.sym'
alias ff='find . -name $1'
alias fj='find . -name "*.java" | xargs egrep -nw $1'
alias fgram='find . -name "*.gram" | xargs egrep -nw $1'
alias fmib='find . -name "*.mib" | xargs egrep -nw $1'
alias fch='find . -name "*.[c|h]" | xargs egrep -nw $1'
alias fs='find . -name "*.[chsS]" | xargs egrep -nw $1'
alias fmk='find . \( -name "Makefile" -o -name "Makefile\.*" \) | xargs egrep -nw $1'
alias fpl='find . -name "*.pl" | xargs egrep -nw $1'
alias fxml='find . -name "*.xml" | xargs egrep -nw $1'
alias fbuild='find . -name "build.xml" | xargs egrep -nw $1'
alias fa='find . -type file | xargs egrep -nw $1'
alias faus='/volume/enterprise-sw/bin/show-all-free-pvl-hw.pl | egrep "(A20|A40)"'

alias gman='groff -Tascii -man $1'

#Useful quick notes:
alias mntpfe='echo "mount -t nfs phobos-cf1:/vol/FTP/tftpboot /usr/share/pfe"'
alias tipscreen='echo "screen -S creat, screen -ls list, screen -dr attach, screen -x share"'

alias tiprsync='echo "rsync -auvv bin dmu@172.29.9.99:/Users/dmu/tmp"'
alias rsync_doc='rsync -auvv $SRXSRC/doc/build/sphinx/* ~/public_html/daybreak'

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
