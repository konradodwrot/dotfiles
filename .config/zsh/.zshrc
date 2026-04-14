## ZSH parameters for the shell 
# https://zsh.sourceforge.io/Doc/Release/Parameters.html#Parameters-Used-By-The-Shell

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1000000 

LANG=C.UTF-8
LC_ALL=C.UTF-8
LC_COLLATE=pl_PL.UTF-8 # PL sorting 
LC_CTYPE=C.UTF-8
LC_MESSAGES=C.UTF-8
LC_NUMERIC=C.UTF-8
LC_TIME=C.UTF-8

LISTMAX=50 # ls pattern <tab>: "do you wish to see all X possibilities"?

# working dir with ~ prefix if possible
PS1='%F{cyan}%~%f$ '

## Tools
# Direnv - for autoloading .env - https://direnv.net/
eval "$(direnv hook zsh)"
