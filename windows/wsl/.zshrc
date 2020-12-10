export DOTFILES_DIR="$HOME/.dotfiles/windows/wsl"

alias ls="exa -a --group-directories-first"
alias ll="ls -lh"

export BAT_THEME="OneHalfDark"
alias cat="clear && bat"





. $HOME/.asdf/asdf.sh


# asdf needs to be loaded before plugins (e.g. for z-lua, as lua is loaded by asdf)
. $DOTFILES_DIR/plugins.zsh


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



eval "$(starship init zsh)"
function set_win_title(){
    echo -ne "\033]0; $(basename $PWD) \007"
}
precmd_functions+=(set_win_title)

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# FOR VCXSRV
# export DISPLAY=$WSL_IF_IP:0
# unset LIBGL_ALWAYS_INDIRECT



export ERL_AFLAGS="-kernel shell_history enabled"





zstyle ':completion:*:ssh:*' hosts off
