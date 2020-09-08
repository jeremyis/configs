if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# The next line enables bash completion for gcloud.
source '/Users/jeremyis/google-cloud-sdk/completion.bash.inc'

source /Users/jeremyis/.iterm2_shell_integration.bash

# Path to the bash it configuration
export BASH_IT="/Users/jeremyis/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline-custom'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

export SCM_GIT_SHOW_DETAILS=true
export SCM_GIT_IGNORE_UNTRACKED=true
export SCM_GIT_SHOW_REMOTE_INFO=false

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh

# The next line updates PATH for the Google Cloud SDK.
source '/Users/jeremyis/dev/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/jeremyis/dev/google-cloud-sdk/completion.bash.inc'

export SHELL='/bin/bash'
