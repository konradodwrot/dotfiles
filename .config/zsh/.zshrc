# .zshrc - sourced for interactive shells

## ZSH Parameters

LISTMAX=50 # ls pattern <tab>: "do you wish to see all X possibilities"?
PS1='%F{cyan}%~%f $ ' # `directory $`

### History Parameters

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=50000

## ZSH Options

### History

setopt APPEND_HISTORY               # (default) append to history file, do not overwrite
setopt BANG_HIST                    # (default) ! - expansion
setopt EXTENDED_HISTORY             # timestamps
setopt HIST_ALLOW_CLOBBER           # allow overwrite if desired
unsetopt HIST_EXPIRE_DUPS_FIRST     # expire oldest records
setopt HIST_FCNTL_LOCK              # fnctl locking, improves performance
setopt HIST_FIND_NO_DUPS            # no need for dups in search 
unsetopt HIST_IGNORE_ALL_DUPS       # keep dups, even if not adjacent
unsetopt HIST_IGNORE_DUPS           # keep dups, even if adjacent
unsetopt HIST_IGNORE_SPACE          # leading whitespace commands are fine
setopt HIST_LEX_WORDS               # improve search accuracy
unsetopt HIST_NO_FUNCTIONS          # functions are fine
unsetopt HIST_NO_STORE              # store
setopt HIST_REDUCE_BLANKS           # remove extra whitespace
setopt HIST_SAVE_BY_COPY            # (default) hist.new
unsetopt HIST_SAVE_NO_DUPS          # dups are fine
setopt HIST_VERIFY                  # show command to a user before running it
unsetopt INC_APPEND_HISTORY         # use SHARE_HISTORY instead (exclusive)
unsetopt INC_APPEND_HISTORY_TIME    # use SHARE_HISTORY instead (exclusive)
setopt SHARE_HISTORY                # share history across all sessions & incrementally append to history file

### Changing Directories

setopt NO_AUTO_CD           # cd: typing dir name without cd won't cd to it
setopt AUTO_PUSHD           # cd: auto pushd
unsetopt CDABLE_VARS        # cd: do not search home dir if dir in pwd doesn't extists 
setopt CD_SILENT            # cd: do not print dir on cd
unsetopt CHASE_DOTS         # overriden by CHASE_LINKS
setopt CHASE_LINKS          # cd: when cd to link move to physical location dir instead
unsetopt PUSHD_IGNORE_DUPS  # pushd: keep full record
unsetopt PUSHD_MINUS        # pushd: do not reverse +/-
setopt PUSHD_SILENT         # pushd: do not print dir 
unsetopt PUSHD_TO_HOME      # pushd: moves one dir up instead to home

### I/O

setopt CORRECT # spell check commands
setopt CORRECT_ALL # spell check commands and args
setopt INTERACTIVE_COMMENTS # allow comments in interactive shells

## Tools

### Direnv

eval "$(direnv hook zsh)"
