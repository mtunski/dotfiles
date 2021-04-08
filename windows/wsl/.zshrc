export DOTFILES_DIR="$HOME/.dotfiles/windows/wsl"

alias gl="git pull"
alias glg="git log --decorate --abbrev-commit"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gd="git diff"
alias gc="git commit"
alias gca="git commit -a"
alias gco="git checkout"
alias gb="git branch"
alias ga="git add"
alias gaa="git add -A"
alias gcm="git commit -m"
alias gcam="git commit -a -m"
alias gs="git status -sb"
alias gst="git stash"
alias gcl="git clone"
alias gcb="git-copy-branch-name"
alias gpr="gp && git pr"
alias gr="git reset"
alias gm="git merge"
alias gsh="git show"

alias sudo="sudo "
alias ps="ps aux"
alias mkdir="mkdir -pv"

alias ls="exa -a --group-directories-first"
alias ll="ls -lh"

export BAT_THEME="OneHalfDark"
alias cat="clear && bat"



# setopt auto_cd
# # allow expansion in prompts
# # setopt prompt_subst
# # History
# setopt inc_append_history
# setopt share_history
# # save each command's beginning timestamp and the duration to the history file
# # setopt extended_history
# setopt hist_expire_dups_first
# setopt hist_fcntl_lock
# setopt hist_ignore_all_dups
# setopt hist_lex_words
# setopt hist_reduce_blanks
# setopt hist_save_no_dups

setopt auto_cd
# allow expansion in prompts
setopt prompt_subst
# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history
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

export BLOCK_SIZE="human-readable" # https://www.gnu.org/software/coreutils/manual/html_node/Block-size.html
export HISTSIZE="10000"
export SAVEHIST="10000"
export HISTFILE="$HOME/.zsh_history"



. $HOME/.asdf/asdf.sh


# asdf needs to be loaded before plugins (e.g. for z-lua, as lua is loaded by asdf)
# . $DOTFILES_DIR/plugins.zsh

source ~/.zplug/init.zsh

# let zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'


# zplug "zsh-users/zsh-history-substring-search"
# zplug "zsh-users/zsh-history-substring-search"
# zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting"
zplug "skywind3000/z.lua"
zplug "knu/zsh-manydots-magic", use:manydots-magic

# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

zplug load

# for history substring search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

zstyle ":completion:*" accept-exact "*(N)"
zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path "$HOME/.z_comp_cache"
zstyle ":completion:*" completer _complete _match _approximate
zstyle ":completion:*:match:*" original only
zstyle ":completion:*:approximate:*" max-errors 1 numeric
zstyle -e ":completion:*:approximate:*" max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ":completion:*:functions" ignored-patterns "_*"
zstyle -e ":completion:*:default" list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")'
zstyle ":completion:*" squeeze-slashes true
# # Menu if nb items > 2
zstyle ":completion:*" menu select=2
# Case insensitive
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"


# Hook direnv into your shell.
eval "$(asdf exec direnv hook zsh)"
# A shortcut for asdf managed direnv.
direnv() { asdf exec direnv "$@"; }
export DIRENV_LOG_FORMAT=""

# # append completions to fpath
# fpath=(${ASDF_DIR}/completions $fpath)
# # initialize completions with ZSH's compinit
# autoload -Uz compinit
# compinit



# SETUP TAB TITLE
eval "$(starship init zsh)"
function set_win_title(){
    echo -ne "\033]0; $(basename $PWD) \007"
}
precmd_functions+=(set_win_title)

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin



# Erlang history (e.g. for Elixir console)
export ERL_AFLAGS="-kernel shell_history enabled"

# Disable completion for hosts (only complete what's in ssh/config)
zstyle ':completion:*:ssh:*' hosts off



# set DISPLAY variable to the IP automatically assigned to WSL2
# WARNING!!! THIS BREAKS CRAWLER IN HEADLESS!!!
# export DISPLAY=$WSL_IF_IP:0
# unset LIBGL_ALWAYS_INDIRECT
