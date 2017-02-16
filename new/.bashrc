# Use vi keybindings.
set -o vi

# Aliases
grepnodefn () { grep -rnIi "$1" * --color=always | grep -v node_modules; }
findnodefn () { find . | grep -i "$1" --color=always | grep -v node_modules;}
alias grepnode=grepnodefn
alias findnode=findnodefn

greprubyfn () { grep -rIn --include \*.rb --color=always "$1" *; }
alias grepruby=greprubyfn

# http://stackoverflow.com/questions/4589731/git-blame-statistics
# Counts blamed lines by authors on file.
gitauthorsfn () { git ls-tree -r -z --name-only HEAD -- $1 | xargs -0 -n1 git blame --line-porcelain HEAD | grep  "^author "|sort|uniq -c|sort -nr; }
alias git-authors=gitauthorsfn

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

# So vi calls the correct vim (not necessarily /usr/bin/vim)
alias vi="vim"

# Fix terminal Ctrl-S / Ctrl-Q with VIM
# http://stackoverflow.com/questions/13648237/ctrls-horizontal-split-not-working-with-command-t-in-vim
stty start undef stop undef
