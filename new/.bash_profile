if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

#source ~/.bash_profile-private

# AIRLAB-DO-NOT-MODIFY section:ShellWrapper {{{
# Airlab will only make edits inside these delimiters.

# Source Airlab's shell integration, if it exists.
if [ -e ~/.airlab/shellhelper.sh ]; then
  source ~/.airlab/shellhelper.sh
fi
# AIRLAB-DO-NOT-MODIFY section:ShellWrapper }}}


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jeremy_smith/src/google-cloud-sdk/path.bash.inc' ]; then source '/Users/jeremy_smith/src/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jeremy_smith/src/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/jeremy_smith/src/google-cloud-sdk/completion.bash.inc'; fi
