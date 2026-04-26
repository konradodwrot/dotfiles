## wrap aliases, to print underlying command before execution
log() {
    print -P "alias: %f$*"
    "$@"
}

## apply configuration from dotfiles via chezmoi
chezmoi_check_apply_config() {
    # checkout diffs
    chezmoi diff
    # apply one by one
    chezmoi apply --verbose --interactive
}

## generate robust ssh keys
generate_ssh_keys() {
    ssh-keygen -t ecdsa-sha2-nistp521 -b 521 -f ~/.ssh/id_access -C odwrotkonrad+kodwrot-lt@gmail.com
    ssh-keygen -t ecdsa-sha2-nistp521 -b 521 -f ~/.ssh/id_signing -C odwrotkonrad+kodwrot-lt@gmail.com
}

## prepare ssh idenitity for access
## arg: $1 - time period
ssh_auth() {
    local time="${1:-4h}"

    ssh-add -t $time ~/.ssh/id_access
    ssh-add -t $time ~/.ssh/id_signing
}

ssh_test_git_connection() {
    ssh -vT git@github.com 2>&1 | tee /dev/tty | grep "successfully authenticated"
    github_status=$?

    ssh -vT git@gitlab.com
    gitlab_status=$?

    [[ github_status -eq 0 ]] && echo "GitHub: ✅" || echo "GitHub: ❌"
    [[ gitlab_status -eq 0 ]] && echo "GitLab: ✅" || echo "GitLab: ❌"
}
