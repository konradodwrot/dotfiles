# .zshrc - sourced by interactive shells

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/opt/homebrew/bin:$PATH

# path to ohmyzsh installation
export ZSH="$ZDOTDIR/ohmyzsh"

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# _ and - will be interchangeable in tab completion
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode prompt # ask before update
zstyle ':omz:update' frequency 1

HIST_STAMPS="yyyy-mm-dd"

# custom ohmyzsh modules location
ZSH_CUSTOM=~/.config/zsh/custom

# https://github.com/ohmyzsh/ohmyzsh/wiki/plugins
# keep it minimal - instead choose what's needed and take an example
plugins=()

source $ZSH/oh-my-zsh.sh

# tools configuration

## homebrew
### Post-installation steps https://docs.brew.sh/Installation
eval "$(/opt/homebrew/bin/brew shellenv)" 

## direnv
### hook into shell https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"

# user configuration

export EDITOR='vim'
export ARCHFLAGS="-arch $(uname -m)"
