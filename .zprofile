if (($+commands[devbox])); then
  eval "$(devbox global shellenv --init-hook)"
fi

if (($+commands[brew])); then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi 

if (($+commands[orb])); then
  # Added by OrbStack: command-line tools and integration
  source ~/.orbstack/shell/init.zsh 2>/dev/null || :
fi
