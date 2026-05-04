### --- BEGIN SETUP DIRS --- ###


typeset -A dirs_env=(
    ASDF_DATA_DIR       "${HOME}/.local/share/asdf"         # asdf installs tools here
    XDG_BIN_HOME        "${HOME}/.local/bin"                # xdg - bin recommendation
    XDG_CACHE_HOME      "${HOME}/.cache"                    # user-specific non-esseintial data
    XDG_CONFIG_HOME     "${HOME}/.config"                   # user-specific configuration files
    XDG_DATA_HOME       "${HOME}/.local/share"              # user-specific data files
    XDG_STATE_HOME      "${HOME}/.local/state"              # user-specific state data
)
typeset -a dirs_other=(
    "${HOME}/.local/share/asdf/completions"                 # asdf completions 
    "${HOME}/.local/state/zsh"                              # zsh history
)
mkdir -p ${(v)dirs_env} ${dirs_other}                       # create dirs if non existing


typeset -A dirs_named=(
    bin         "${HOME}/.local/bin"                        # cd ~bin
    cache       "${HOME}/.cache"                            # cd ~cache
    config      "${HOME}/.config"                           # cd ~config
    data        "${HOME}/.local/share"                      # cd ~data
    dotfiles    "${HOME}/.local/share/dotfiles"             # cd ~dotfiles
    projects    "${HOME}/.local/share/projects"             # cd ~projects
    state       "${HOME}/.local/state"                      # cd ~state
)
for k v in "${(@kv)dirs_named}"; hash -d "$k=$v"            # hash -d adds dirs to cd with ~name


### --- END SETUP DIRS --- ###
### --- BEGIN SETUP ENVIRONMENT VARIABLES --- ###

typeset -A env_vars=(
    ASDF_CONFIG_FILE    "${HOME}/.config/asdf/.asdfrc"
    EDITOR              "vim"
    LANG                "C.UTF-8"
    LC_COLLATE          "pl_PL.UTF-8"
    LC_CTYPE            "C.UTF-8"
    LC_MESSAGES         "C.UTF-8"
    LC_NUMERIC          "C.UTF-8"
    LC_TIME             "C.UTF-8"
)
env_vars+=( ${(kv)dirs_env} )
for k v in "${(@kv)env_vars}"; export "$k=$v"


typeset -U path=(
    ${XDG_BIN_HOME}                                         # user bin
    /opt/homebrew/bin                                       # homebrew bin
    ${ASDF_DATA_DIR}/shims                                  # asdf bins
    /opt/homebrew/share/google-cloud-sdk/bin                # gcloud bin
    /usr/local/bin
    /usr/bin
    /usr/sbin
    /bin
    /sbin
)


### --- END SETUP ENVIRONMENT VARIABLES --- ###


unset dirs_env dirs_other dirs_named env_vars
