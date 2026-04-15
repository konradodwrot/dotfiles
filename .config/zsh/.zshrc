# .zshrc - sourced for interactive shells

## ZSH Parameters

LISTMAX=50 # ls pattern <tab>: "do you wish to see all X possibilities"?
PS1='%F{cyan}%~%f $ ' # `directory $`

## Tools

### Direnv

eval "$(direnv hook zsh)"
