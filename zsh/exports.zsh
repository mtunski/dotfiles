export ASDF_DIR=$(brew --prefix asdf)
export ZSH_DIR="$HOME/.zsh"
export _Z_DATA="$ZSH_DIR/z"

export CLICOLOR="1"
export BLOCK_SIZE="human-readable" # https://www.gnu.org/software/coreutils/manual/html_node/Block-size.html
export HISTSIZE="10000"
export SAVEHIST="10000"
export HISTFILE="$ZSH_DIR/history"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export PGHOST="/tmp"

export ERL_AFLAGS="-kernel shell_history enabled"
