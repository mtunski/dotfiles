# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files sourced from it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# config for devbox shell
if [ ! -e "$Z4H"/z4h.zsh ]; then
  source ~/.zshenv
  z4h source ~/.p10k.zsh
fi

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'no'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'pc'

# Don't start tmux.
zstyle ':z4h:' start-tmux       'no'

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'no'

# Enable direnv to automatically source .envrc files.
zstyle ':z4h:direnv'         enable 'yes'
# Show "loading" and "unloading" notifications from direnv.
zstyle ':z4h:direnv:success' notify 'no'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# SSH when connecting to these hosts.
# zstyle ':z4h:ssh:example-hostname1'   enable 'yes'
# zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
# The default value if none of the overrides above match the hostname.
zstyle ':z4h:ssh:*'                   enable 'yes'

# Send these files over to the remote host when connecting over SSH to the
# enabled hosts.
zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh'

# Start ssh-agent if it's not running yet.
# zstyle ':z4h:ssh-agent:' start yes
zstyle ':z4h:ssh-agent:' start 'no'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
# z4h install ohmyzsh/ohmyzsh || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# Extend PATH.
path=(~/bin $path)

# Export environment variables.
# export GPG_TTY=$TTY

# Source additional local files if they exist.
# z4h source ~/.env.zsh

# Use additional Git repositories pulled in with `z4h install`.
#
# This is just an example that you should delete. It does nothing useful.
# z4h source ohmyzsh/ohmyzsh/lib/diagnostics.zsh  # source an individual file
# z4h load   ohmyzsh/ohmyzsh/plugins/emoji-clock  # load a plugin

# Define key bindings.
z4h bindkey z4h-backward-kill-word  Ctrl+Backspace     Ctrl+H
z4h bindkey z4h-backward-kill-zword Ctrl+Alt+Backspace

# z4h bindkey undo Ctrl+/ Shift+Tab  # undo the last command line change
# z4h bindkey redo Alt+/             # redo the last undone command line change

z4h bindkey z4h-cd-back    Shift+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Shift+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Shift+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Shift+Down   # cd into a child directory

# Autoload functions.
autoload -Uz zmv

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# # Define aliases.
# alias tree='tree -a -I .git'

# # Add flags to existing aliases.
# alias ls="${aliases[ls]:-ls} -A"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

# Custom 

if (( $+commands[npiperelay.exe] )) then
  # Configure ssh forwarding
  export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
  # need `ps -ww` to get non-truncated command for matching
  # use square brackets to generate a regex match for the process we want but that doesn't match the grep command running it!
  ALREADY_RUNNING=$(ps -auxww | grep -q "[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent"; echo $?)
  if [[ $ALREADY_RUNNING != "0" ]]; then
      if [[ -S $SSH_AUTH_SOCK ]]; then
          # not expecting the socket to exist as the forwarding command isn't running (http://www.tldp.org/LDP/abs/html/fto.html)
          rm $SSH_AUTH_SOCK
      fi
      # setsid to force new session to keep running
      # set socat to listen on $SSH_AUTH_SOCK and forward to npiperelay which then forwards to openssh-ssh-agent on windows
      (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
  fi
fi

export PGHOST=localhost
export AUTOSSH_FIRST_POLL=30
export AUTOSSH_GATETIME=60
export ERL_AFLAGS="-kernel shell_history enabled"

unsetopt extendedglob

alias psql=pgcli

if (( $+commands[exa] )) then
  alias ls=exa
  # alias ls='exa -l --group-directories-first --color=auto --git --icons --no-permissions --no-user'
  # alias ll='exa -lahF --group-directories-first --color=auto --git --icons'
fi

if (( $+commands[batcat] || $+commands[bat] )) then
  alias cat=bat
fi

if (( $+commands[explorer.exe] )) then
  alias open="explorer.exe $1"
fi

if (( $+commands[autossh] )) then
  alias surfer.tunnels.start="autossh -M 0 -f -T -N surfer.tunnels"
  alias surfer.tunnels.stop="killall autossh"
  alias surfer.backend="cd ~/Code/Surfer/surfer-core && iex -S mix phx.server"
  alias surfer.frontend="cd ~/Code/Surfer/surfer-core && yarn && yarn start:ssl"
  alias surfer.crawler="cd ~/Code/Surfer/surfer-crawler && yarn start:dev"
  alias surfer.clusterer="cd ~/Code/Surfer/surfer-clusterer && make docker-start"
fi

if (( $+commands[wslpath] )) then
  keep_current_path() {
    printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"
  }
  precmd_functions+=(keep_current_path)
fi

# load surfer helpers in remote environment
if [ -e /etc/profile.d/surfer-umbrella.sh ]; then
  source /etc/profile.d/surfer-umbrella.sh
fi

# zstyle ':z4h:fzf-dir-history' fzf-bindings tab:repeat
# zstyle ':z4h:cd-down'         fzf-bindings tab:repeat

# z4h bindkey z4h-fzf-dir-history Shift+Down

# # Recursively traverse directories when TAB-completing files.
# zstyle ':z4h:fzf-complete' recurse-dirs yes
# zstyle ':z4h:fzf-complete' fzf-bindings tab:repeat

zstyle ':completion:*:ssh:*' ignored-patterns surfer-bastion surfer.tunnels
