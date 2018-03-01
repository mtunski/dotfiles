setopt auto_cd

# allow expansion in prompts
setopt prompt_subst

# this is default, but set for share_history
setopt append_history
# setopt share_history

# save each command's beginning timestamp and the duration to the history file
setopt extended_history

setopt hist_expire_dups_first
setopt hist_fcntl_lock
setopt hist_ignore_all_dups
setopt hist_lex_words
setopt hist_reduce_blanks
setopt hist_save_no_dups

# no c-s/c-q output freezing
setopt noflowcontrol

# display PID when suspending processes as well
setopt longlistjobs
# try to avoid the 'zsh: no matches found...'
setopt nonomatch
# report the status of backgrounds jobs immediately
setopt notify
# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all
# not just at the end
setopt completeinword
# use zsh style word splitting
setopt noshwordsplit
# allow use of comments in interactive code
setopt interactivecomments
