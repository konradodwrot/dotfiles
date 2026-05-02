#!/usr/bin/env zsh

##### --- BEGIN ZSH --- #####


### --- BEGIN ZSH OPTIONS --- ###

#> https://zsh.sourceforge.io/Doc/Release/Options.html
typeset -a opts_disabled=(
  AUTO_CD                      #[D]? to avoid confusion, for better completion control
  AUTO_NAME_DIRS               #[D]? to not create named dirs by accident
  BEEP                         #? to reduce interruptions while working
  CLOBBER                      #? to avoid accidental file overrides
  CORRECT_ALL                  #? to avoid questions and streamline workflow #[O] not useful when advanced completions are on
  CSH_JUNKIE_HISTORY
  CSH_JUNKIE_LOOPS
  GLOB_SUBST                   # globs inside vars won't be interpretted e.g. search=**/*.txt echo $search; unless `~` is used e.g. echo $~search
  GLOBAL_EXPORT                # disable exported function scoped parameters being global
  HIST_BEEP                    # do not beep if history event is missing
  HIST_EXPIRE_DUPS_FIRST
  HIST_IGNORE_ALL_DUPS         # full history record
  HIST_IGNORE_DUPS             # full history record
  HIST_IGNORE_SPACE            # if command is prepended with a space write it down to history
  HIST_LEX_WORDS
  HIST_NO_FUNCTIONS            # full history record, including functions definitions
  HIST_NO_STORE                # full history record, including 'history' command invocations
  HIST_SAVE_NO_DUPS            # full history record
  IGNORE_BRACES                # file{1,2}.txt is expanding to multiple args
  INC_APPEND_HISTORY_TIME      # use SHARE_HISTORY instead
  KSH_ARRAYS                   # $array will print all elems instead of first one; arrays are indexes starting from 1
  KSH_AUTOLOAD                 # autoload - function files contains only body of a fuction; filename determines name of a function
  KSH_GLOB                     # disable KSH-like globbing patterns; ^p -> negation; p## -> 1+ ; p# -> 0+ ; (p) -> 1
  POSIX_BUILTINS               # short lived vars before command; command builtin ignores shell fns; exec can run fns; 
  PROMPT_BANG                  # disable `!` history events in prompts
  PUSHD_IGNORE_DUPS            # enable full directory history in directory stack
  RM_STAR_SILENT               # rm with * will ask for confirmation to delete files
  SH_FILE_EXPANSION            # ~ tilde expansion comes last; so other users home dirs are resolvable e.g. ~root -> /var/root
  SH_GLOB                      # enable globbing symbols: | () <>
  SH_OPTION_LETTERS            # use zsh short letter option mappings
  SH_WORD_SPLIT                # disable unqoted parameter expansion, use arrays instead
  SINGLE_LINE_ZLE              # enable multiline command editing
)
set +o ${opts_disabled}


typeset -a opts_enabled=(
  CD_SILENT                    #? to reduce verbosity
  BSD_ECHO                     # make echo not interpret backslashes by default; use printf instead
  INTERACTIVE_COMMENTS         # enable comments in interactive shells
  KSH_OPTION_PRINT             # print all options on `` or `setopt`
  MULTIOS                      # multiple inputs and outputs support without tee and cat; 
  BARE_GLOB_QUAL               # last parantheses in globbing will be qualifier list e.g. (@) - symlink, (*) - executable
  PROMPT_SUBST                 # enable expansions in PROMPT params, for prompt creation
  APPEND_HISTORY
  EXTENDED_HISTORY             # timestamps, how long command took to execute; history
  HIST_ALLOW_CLOBBER           # > becomes >| , useful if NO_CLOBBER is set
  HIST_FIND_NO_DUPS            # when searching I don't want to see dups
  HIST_REDUCE_BLANKS           # remove redundant whitespace from commands
  HIST_SAVE_BY_COPY            # .new .old rename
  SHARE_HISTORY                # shared history
  NOMATCH                      # error if glob returned nothing, overriden by CSH_NULL_GLOB
  BAD_PATTERN                  # error if glob pattern is malformed
  BG_NICE                      # background jobs have lower prio
  NOTIFY                       # background jobs immediately reports status rather than waiting for next prompt
  HUP                          # closing shell cause background jobs to be cleaned via SIGHUP
  FUNCTION_ARG_ZERO            # $0 in function body contains function name rather than shell path
  LOCAL_OPTIONS                # setting options inside a function is not visible to the outside
  LOCAL_TRAPS                  # setting traps inside a function is bound to function lifetime
  PROMPT_PERCENT               # % is a special character in prompt expansion
  PROMPT_SUBST                 # expansions are performed in prompts
  CSH_NULL_GLOB                # if using multiple globs one after another, do not report error if at least one return items
  BANG_HIST                    # enable history shortcuts: !!, !?, !n, !str
  HIST_VERIFY                  # add history item to the line editor before executing
  INC_APPEND_HISTORY           # use SHARE_HISTORY instead
  EXTENDED_GLOB                # enable ~ # ^ in globbing
  CORRECT                      # try to correct cmd if invalid
  CD_ABLE_VARS                 # enable auto expansion of var in cd e.g. cd /var/path, useful in e.g. cd NVM_DIR
  HASH_CMDS                    # build index of commands from PATH for fast search
  HASH_ALL                     # build index of commands from PATH for fast search
  HASH_LIST_ALL                # build index of commands from PATH for fast search
  CHASE_LINKS                  # when changing dirs, go to source if it's a symlink
  AUTO_PUSHD                   # auto pushd when changing directories with cd
  PUSHD_SILENT                 # disable printing directory stack after pushd/popd
)
set -o  ${opts_enabled}


### --- END ZSH OPTIONS --- ###


### --- BEGIN ZSH PARAMETERS --- ###


typeset -A zsh_params=(
    HISTFILE    "${XDG_STATE_HOME}/zsh/history"
    HISTSIZE    15_000
    SAVEHIST    10_000
    PS1         '%# '                             # # for root, % for non root
    RPS1        '%~ | %w | %T | %(?.✅.❌)'       # shortened pwd, date, time, last command status emoji
    PS2         '> '                              # shell waits for input
    PS4         '+ '                              # debugging prompt when XTRACE is set
)
for k v in "${(@kv)zsh_params}"; typeset "$k=$v" 


typeset -U fpath                                  # array form of synced scalar FPATH
fpath=(
    ${XDG_CONFIG_HOME}/zsh/functions
    ${ASDF_DATA_DIR}/completions
    ${fpath}
)


typeset -U cdpath                                 # array form of synced scalar CDPATH
cdpath=(
    .
)


### --- END ZSH PARAMETERS --- ###


### --- BEGIN ZSH OTHER --- ###


# completions asdf
[[ ! -s "${ASDF_DATA_DIR}/completions/_asdf" ]] && asdf completion zsh > "${ASDF_DATA_DIR}/completions/_asdf"

autoload ${XDG_CONFIG_HOME}/zsh/functions/**(:t)
autoload -Uz compinit && compinit


### --- END ZSH OTHER --- ###


##### --- END ZSH --- #####


##### --- BEGIN CUSTOM --- #####


source ${XDG_CONFIG_HOME}/zsh/.aliasrc


### --- BEGIN TOOLS --- ###


eval "$(/opt/homebrew/bin/brew shellenv)" # homebrew https://docs.brew.sh/Installation


eval "$(direnv hook zsh)"                 # direnv https://direnv.net/docs/hook.html


source <(fzf --zsh)                       # fzf


### --- END TOOLS --- ###


##### --- END CUSTOM --- #####


unset opts_disabled opts_enabled zsh_params
