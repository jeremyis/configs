PHP_PEAR=/Users/jeremysmith/pear/bin
export PATH=/usr/local/bin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/opt/play-1.2.3:$PHP_PEAR:$PATH

# use vi keybindings
set -o vi

test -r /sw/bin/init.sh && . /sw/bin/init.sh

grepnodefn () { grep -rnIi "$1" * --color=always | grep -v node_modules; }
findnodefn () { find . | grep -i "$1" --color=always | grep -v node_modules;}
alias grepnode=grepnodefn
alias findnode=findnodefn

VISUAL=vim
PATH=/usr/local/bin:$PATH

#add MIT Proto to path:
PATH=$PATH:/Users/jeremysmith/stuff/misc/proto/src

# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
# export PATH
#PYTHONPATH="/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5/site-packages/debug_toolbar"
#export PYTHONPATH
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH
export GREP_OPTIONS='--color=auto'

# Variables for development
export NODE_ENV='development'
export PHP_ENV='development'

export JAVA_HOME=`/usr/libexec/java_home`
# Amazon RDS (relational db service) command line
export AWS_RDS_HOME='/Users/jeremysmith/stuff/dev/RDSCli-1.6.001'
export PATH=/opt/local/bin:/opt/local/sbin:${AWS_RDS_HOME}/bin:$PATH

# Adds gcc, etc to path
export PATH=/Developer/usr/bin/:$PATH

if [ "$TERM" == "xterm" ]; then
    # No it isn't, it's gnome-terminal
    export TERM=xterm-256color
fi
export TERM=xterm-256color

source ~/.bashrc-private
