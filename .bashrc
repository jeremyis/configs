# Use vi keybindings.
set -o vi

# Aliases
grepnodefn () { grep -rnIi --exclude-dir={node_modules,.git} "$1" * --color=always ; }
findnodefn () { find . | grep -i "$1"  --exclude-dir={node_modules,.git} --color=always; }
function grepr() { grep -rI "$1" * --color=always; }
alias ngrep=grepnodefn
alias nfind=findnodefn
alias grepr=grepr

greprubyfn () { grep -rIn --include \*.rb --color=always "$1" *; }
alias grepruby=greprubyfn

# http://stackoverflow.com/questions/4589731/git-blame-statistics
# Counts blamed lines by authors on file.
gitauthorsfn () { git ls-tree -r -z --name-only HEAD -- $1 | xargs -0 -n1 git blame --line-porcelain HEAD | grep  "^author "|sort|uniq -c|sort -nr; }
alias git-authors=gitauthorsfn

# Removes local branches that are merged and prunes any tracking branches
gitcleanupfn () { git checkout master  && git branch --merged | grep -v master | xargs git branch -d && git remote prune origin; }
alias git-cleanup=gitcleanupfn

# Requires core-utils brew install coreutils
copypathfn() { greadlink -f $1 |  tr -d  '\n' |  pbcopy; }
alias cfp=copypathfn


## FFmpeg
avprobefn () {  /Users/jeremyis/Dropbox/projects/recharm/scripts/avprobe.sh -f "$1" "$2"; }
alias avprobe=avprobefn

crawl_and_probe() { python3 /Users/jeremyis/Dropbox/projects/recharm/scripts/crawl_and_probe.py "$1";}
alias crawlandprobe=crawl_and_probe

# Exports
export NODE_ENV='development'
export PHP_ENV='development'
export GREP_OPTIONS='--color=auto'

source ~/.bashrc-private

# For Docker nsenter. See: https://github.com/jpetazzo/nsenter/blob/master/README.md
docker-enter() {
  boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
  boot2docker ssh -t sudo /var/lib/boot2docker/docker-enter "$@"
}

# Colorize ls output
alias ls='ls -G'
alias ll="ls -l"

export PATH=$PATH:/usr/local/sbin

# Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/Users/jeremy_smith/go
export GOBIN=$GOPATH/bin

# Python
#export PATH=/Users/jeremyis/.local/bin:$PATH

# So vi calls the correct vim (not necessarily /usr/bin/vim)
#alias vi="vim"
function vi() {
    if [ $# -eq 0 ]; then
        vim ~/.vims
    else
        vim $@
    fi
}


# Fix terminal Ctrl-S / Ctrl-Q with VIM
# http://stackoverflow.com/questions/13648237/ctrls-horizontal-split-not-working-with-command-t-in-vim
stty start undef stop undef

# git auto complete: https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# http://unix.stackexchange.com/a/285956
function colorgrid()
{
    iter=16
    while [ $iter -lt 52 ]
    do
        second=$[$iter+36]
        third=$[$second+36]
        four=$[$third+36]
        five=$[$four+36]
        six=$[$five+36]
        seven=$[$six+36]
        if [ $seven -gt 250 ];then seven=$[$seven-251]; fi

        echo -en "\033[38;5;$(echo $iter)m█ "
        printf "%03d" $iter
        echo -en "   \033[38;5;$(echo $second)m█ "
        printf "%03d" $second
        echo -en "   \033[38;5;$(echo $third)m█ "
        printf "%03d" $third
        echo -en "   \033[38;5;$(echo $four)m█ "
        printf "%03d" $four
        echo -en "   \033[38;5;$(echo $five)m█ "
        printf "%03d" $five
        echo -en "   \033[38;5;$(echo $six)m█ "
        printf "%03d" $six
        echo -en "   \033[38;5;$(echo $seven)m█ "
        printf "%03d" $seven

        iter=$[$iter+1]
        printf '\r\n'
    done
}


function config_ps1() {
  export reset='\[\033[m\]'
  if [ "$USER" = "jeremy_smith" ]; then
    j="\[\033[01;38;5;196m\]j"
    e="\[\033[01;38;5;202m\]e"
    r="\[\033[01;38;5;208m\]r"
    e2="\[\033[01;38;5;214m\]e"
    m="\[\033[01;38;5;226m\]m"
    y="\[\033[01;38;5;228m\]y"

      local __user="$j$e$r$e2$m$y$reset"
  else
      local __user="\[\033[01;36m\]\u$reset"
  fi

  export limegreen='\[\e[0;32m\]'
  export red='\[\e[1;31m\]'
  export blue='\[\e[0;34m\]'
  export promptcolor="\[\033[01;38;5;220m\]"
  export PS1="$limegreen\t$reset $blue\h$reset:$red\w$reset $__user$promptcolor\$$reset "
}

# config_ps1
# see: https://bashrcgenerator.com/
# export PS1="\[\033[38;5;90m\]\[\033[48;5;231m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;202m\]\T\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;56m\]\[\033[48;5;230m\]\w\[$(tput sgr0)\]:\n\[$(tput sgr0)\]\[\033[38;5;40m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
# Even this would cause wrapping issues on hitting the up key in tmux. ::shrug::
#export PS1="\[\033[0;32m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

# This claims this is OK https://unix.stackexchange.com/a/382562
#export PS1="\[\e[36m\]\W $ \[\e[m\] "
#export PS1='\w\$ ' # https://serverfault.com/a/83384


# Node version manager = nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"

#
# Preserve history (in tmux https://askubuntu.com/a/339925)
#

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
#shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export NODE_PATH=$NODE_PATH:`npm root -g`
