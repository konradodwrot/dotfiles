# .zshenv - sourced for all shells

## XDG locations

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

## ZSH Parameters

ZDOTDIR="$XDG_CONFIG_HOME/zsh" # ZSH Config Dir

### Locale Parameters

LANG=C.UTF-8
LC_ALL=C.UTF-8
LC_COLLATE=pl_PL.UTF-8 # PL sorting 
LC_CTYPE=C.UTF-8
LC_MESSAGES=C.UTF-8
LC_NUMERIC=C.UTF-8
LC_TIME=C.UTF-8
