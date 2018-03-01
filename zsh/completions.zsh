################################################################################
##### Key bindings
################################################################################

# Prevents key timeout lag.
KEYTIMEOUT=1

# Bind UP and DOWN arrow keys for subsstring search.
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
# zmodload zsh/terminfo
# bindkey "$terminfo[cuu1]" history-substring-search-up
# bindkey "$terminfo[cud1]" history-substring-search-down

################################################################################
##### Completions config
################################################################################
zstyle ":completion:*" accept-exact "*(N)"
zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path "$ZSH_DIR/cache"
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

################################################################################
##### Load it!
################################################################################

autoload -Uz compinit && compinit -d "$ZSH_DIR/zcompdump"
