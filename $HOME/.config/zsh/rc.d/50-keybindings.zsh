# Z Line Editor

## unicode modifiers
## ⌘ - command
## ⌥ - alt
## ⇧ - shift


WORDCHARS="" #[I] words aware commands split on everything but alphanumeric


bindkey -N key_map
bindkey -M key_map -R "^@"-"~" self-insert

typeset -A keystrokes_widgets=(
    # Bracketed paste
    "^[[200~"   bracketed-paste

    # Arrows
    "↑"         up-line-or-history
    "⌘↑"        beginning-of-buffer-or-history
    "↓"         down-line-or-history
    "⌘↓"        end-of-buffer-or-history
    "→"         forward-char
    "←"         backward-char

    "⌥←"        vi-backward-word
    "⌥→"        vi-forward-word

    "⌘→"        vi-end-of-line
    "⌘←"        vi-beginning-of-line

    # Deletions
    "\b"        backward-delete-char
    "⌘\b"       backward-kill-line
    "⌥\b"       backward-delete-word

    "␡"         delete-char
    "⌥␡"        delete-word
    "⌘␡"        kill-line

    # Other
    "⌘z"        undo
    "⌘⇧z"       redo
    "⌘x"        kill-buffer

    "\r"        accept-line
    "\f"        accept-line
    "\t"        expand-or-complete
)
for key wid in ${(kv)keystrokes_widgets}; bindkey -M key_map "${key}" "${wid}" 

bindkey -A key_map main


# STTY 
#[I] before keystroke reaches ZLE it passess through stty, so it have a chance to intercept it and send signal to current the foreground process

typeset -a disabled_cchars=(
    discard
    dsusp
    eof
    eol
    eol2
    erase
    intr
    kill
    lnext
    quit
    reprint
    start
    status
    stop
    susp
    werase
)
for cchar in ${disabled_cchars}; stty ${cchar} undef

typeset -A cchars=(
    susp    '^S'        # Process Suspend 
    quit    '^Q'        # Process Quit 
    erase   '^H'        # Char Remove Backwards
    status  '^A'        # Process Status
)

for action char in ${(kv)cchars}; stty ${action} ${char}


unset keystrokes_widgets disabled_cchars cchars
