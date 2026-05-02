#!/usr/bin/env zsh

##### --- BEGIN ZSH --- #####


### --- BEGIN ZSH OPTIONS --- ###
#> https://zsh.sourceforge.io/Doc/Release/Options.html


typeset -a opts_disabled=(
  AUTO_CD                      #[DF] #? to avoid confusion, for better completion control
  AUTO_NAME_DIRS               #[DF] #? to not create named dirs by accident
  BEEP                         #? to reduce interruptions
  CLOBBER                      #? to avoid accidental file overrides
  CORRECT_ALL                  #? to avoid questions and streamline workflow #[O] not useful when advanced completions are on
  CSH_JUNKIE_HISTORY           #[DF]
  CSH_JUNKIE_LOOPS             #[DF]
  HIST_BEEP                    #[DF] #? to reduce interruptions
  HIST_IGNORE_SPACE            #[DF] #[O] completeness is important
  IGNORE_BRACES                #[DF] #[O] brace expansion is cool file{1,2}.txt > file1.txt file2.txt
  INC_APPEND_HISTORY_TIME      #[DF] #? because SHARE_HISTORY is set and these are mutually exclusive options
  KSH_AUTOLOAD                 #[DF]
  KSH_GLOB                     #[DF]
  POSIX_BUILTINS               #[DF]
  PROMPT_BANG                  #[DF] #? because I do not currently use "!" in PS to access history event number
  RM_STAR_SILENT               #[DF] #? to have safety net while removing files with glob containing *
  SH_FILE_EXPANSION            #[DF]
  SH_GLOB                      #[DF] to enable globbing symbols: | () <>
  SH_OPTION_LETTERS            #[DF] to have zsh as option reference
  SINGLE_LINE_ZLE              #[DF]
  BSD_ECHO                     #[DF]
  APPEND_HISTORY               #? appending to history is defined by SHARE_HISTORY opt
  HIST_EXPIRE_DUPS_FIRST       #[DF] #[O] history completeness and chronological order is important
  HIST_IGNORE_ALL_DUPS         #[DF] #[O] history completeness is important
  HIST_IGNORE_DUPS             #[DF] #[O] history completeness is important
  HIST_NO_STORE                #[DF] #[O] history completeness is important
  HIST_NO_FUNCTIONS            #[DF] #[O] history completeness is important
  HIST_SAVE_NO_DUPS            #[DF] #[O] history completeness is important
  HIST_FIND_NO_DUPS            #[DF] #[O] history search predictability is important
  HIST_REDUCE_BLANKS           #[DF] #[O] history accuracy is important
  CHASE_LINKS                  #[DF] #[O] predictability is important
  CDABLE_VARS                  #[DF]
  CORRECT                      #[O] reliance on completions should be enough
  INC_APPEND_HISTORY           #[DF] #? because SHARE_HISTORY is set and these are mutually exclusive options
  EXTENDED_HISTORY             #[DF] #? SHARE_HISTORY controls history event format
  PUSHD_IGNORE_DUPS            #[DF] #[O] dir history completeness is important
)
set +o ${opts_disabled}


typeset -a opts_enabled=(
  SH_WORD_SPLIT                #? to have behavior similar to other shells; unquoted parameter expansion splits on whitespace
  KSH_ARRAYS                   #? because array indexing from 0 is cool
  HIST_LEX_WORDS               #[O] accuracy is more important than performance
  GLOB_SUBST                   #? to enable writing globs in parameters
  CD_SILENT                    #? to reduce verbosity when changing dirs
  INTERACTIVE_COMMENTS         #? to have robust copy/paste commands including comments
  KSH_OPTION_PRINT             #? to show full list of options on `set -o``
  MULTIOS                      #[DF] to avoid using tee for multiple redirections
  BARE_GLOB_QUAL               #[DF] #[O] file qualifier in glob is cool
  PROMPT_SUBST                 #? to enable advanced PS construction
  HIST_ALLOW_CLOBBER           #? to avoid conflict with CLOBBER option
  HIST_SAVE_BY_COPY            #[DF]
  SHARE_HISTORY
  NOMATCH                      #[DF] #? if CSH_NULL_GLOB gets unset fallback to this option
  BAD_PATTERN                  #[DF]
  BG_NICE                      #[DF]
  NOTIFY                       #[DF]
  HUP                          #[DF]
  FUNCTION_ARGZERO             #[DF]
  LOCAL_OPTIONS
  LOCAL_TRAPS
  PROMPT_PERCENT               #[DF] % is a special character in prompt expansion
  CSH_NULL_GLOB                #? more predictive multiple globs behavior passed to same argument list
  BANG_HIST                    #? to enable history search shortcuts: !!, !?, !n, !str
  HIST_VERIFY                  #? to allow edit history item before executing it
  EXTENDED_GLOB                #[O] ~ # ^ symbols in globbing are cool
  AUTO_PUSHD                   #? to retain history of entered directories
  PUSHD_SILENT                 #? to reduce verbosity when changing dirs
  GLOBAL_EXPORT                #[DF]
  HASH_LIST_ALL                #[DF]
  HASH_CMDS                    #[DF]
)
set -o  ${opts_enabled}


### --- END ZSH OPTIONS --- ###


### --- BEGIN ZSH PARAMETERS --- ###
#> https://zsh.sourceforge.io/Doc/Release/Parameters.html

typeset -A zsh_params=(
    HISTFILE    "${XDG_STATE_HOME}/zsh/history"
    HISTSIZE    15_000
    SAVEHIST    10_000
    PS1         '%# '                             #[I] # for root, % for non root
    RPS1        '%~ | %w | %T | %(?.✅.❌)'       #[I] shortened pwd, date, time, last command status emoji
    PS2         '> '                              #[I] shell waits for input
    PS4         '+ '                              #[I] debugging prompt when XTRACE is set
)
for k v in "${(@kv)zsh_params}"; typeset "$k=$v" 


typeset -U cdpath
cdpath=(
    .
)


typeset -U fpath
fpath=(
    ${XDG_CONFIG_HOME}/zsh/functions
    ${ASDF_DATA_DIR}/completions
    ${fpath}
)


### --- END ZSH PARAMETERS --- ###


### --- BEGIN ZSH OTHER --- ###

autoload ${XDG_CONFIG_HOME}/zsh/functions/**(:t)
autoload -Uz compinit && compinit


### --- END ZSH OTHER --- ###


unset opts_disabled opts_enabled zsh_params


##### --- END ZSH --- #####


##### --- BEGIN CUSTOM --- #####


source ${XDG_CONFIG_HOME}/zsh/.aliasrc


### --- BEGIN TOOLS --- ###


#> https://asdf-vm.com/guide/getting-started.html#_2-configure-asdf
[[ ! -s "${ASDF_DATA_DIR}/completions/_asdf" ]] && asdf completion zsh > "${ASDF_DATA_DIR}/completions/_asdf"


#> https://docs.brew.sh/Installation
eval "$(/opt/homebrew/bin/brew shellenv)" 

#> https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"                 

#> https://github.com/junegunn/fzf#setting-up-shell-integration
source <(fzf --zsh)                       


### --- END TOOLS --- ###


##### --- END CUSTOM --- #####


