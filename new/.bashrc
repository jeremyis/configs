# Use vi keybindings.
set -o vi

# Aliases
grepnodefn () { grep -rnIi "$1" * --color=always | grep -v node_modules; }
findnodefn () { find . | grep -i "$1" --color=always | grep -v node_modules;}
alias grepnode=grepnodefn
alias findnode=findnodefn

# Exports
export NODE_ENV='development'
export PHP_ENV='development'
export GREP_OPTIONS='--color=auto'

source ~/.bashrc-private

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Virtualenvwrapper
if [ -f  /usr/local/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=$HOME/Dropbox/projects/.virtualenvs
  export PROJECT_HOME=$HOME/Dropbox/projects/
  export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
  source /usr/local/bin/virtualenvwrapper_lazy.sh
fi

# Add to PATH.
export PATH=$PATH:/Users/jeremyis/Dropbox/projects/connect

# For Docker nsenter. See: https://github.com/jpetazzo/nsenter/blob/master/README.md
docker-enter() {
  boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
  boot2docker ssh -t sudo /var/lib/boot2docker/docker-enter "$@"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# fuck: https://github.com/nvbn/thefuck
# sudo pip install thefuck
alias fuck='$(thefuck $(fc -ln -1))'

# Colorize ls output
alias ls='ls -G'

export PATH=$PATH:/usr/local/sbin
