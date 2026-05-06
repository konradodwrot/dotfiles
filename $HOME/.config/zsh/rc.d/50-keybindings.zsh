# Z Line Editor

## unicode modifiers
## ⌘ - command
## ⌥ - alt
## ⇧ - shift


WORDCHARS=""


bindkey -N key_map
bindkey -M key_map -R "^@"-"~" self-insert

ESC=$'\u001B'
CSI=$'\u001B['
DCS=$'\u0090'

typeset -A keystrokes=(
    bracketedPaste     "${CSI}200~"

    up                 "${CSI}A"
    down               "${CSI}B"
    right              "${CSI}C"
    left               "${CSI}D"

    cmdUp              "${CSI}1;9A"
    cmdDown            "${CSI}1;9B"
    cmdRight           "${CSI}1;9C"
    cmdLeft            "${CSI}1;9D"

    altLeft            "${CSI}1;3D"
    altRight           "${CSI}1;3C"

    backspace          $'\b'
    cmdBackspace       "${DCS}"$'\b'
    altBackspace       "${ESC}"$'\b'

    delete             "${CSI}3~"
    altDelete          "${CSI}3;3~"
    cmdDelete          "${CSI}3;9~"

    cmdZ               "${DCS}z"
    cmdShiftZ          "${DCS}Z"
    cmdX               "${DCS}x"

    cr                 $'\r'
    tab                $'\t'
)

typeset -A keystrokes_widgets=(
    "$keystrokes[bracketedPaste]"   bracketed-paste

    "$keystrokes[up]"               up-line-or-history
    "$keystrokes[down]"             down-line-or-history
    "$keystrokes[right]"            forward-char
    "$keystrokes[left]"             backward-char

    "$keystrokes[cmdUp]"            beginning-of-buffer-or-history
    "$keystrokes[cmdDown]"          end-of-buffer-or-history
    "$keystrokes[cmdRight]"         vi-end-of-line
    "$keystrokes[cmdLeft]"          vi-beginning-of-line

    "$keystrokes[altLeft]"          vi-backward-word
    "$keystrokes[altRight]"         vi-forward-word

    "$keystrokes[backspace]"        backward-delete-char
    "$keystrokes[cmdBackspace]"     backward-kill-line
    "$keystrokes[altBackspace]"     backward-delete-word

    "$keystrokes[delete]"           delete-char
    "$keystrokes[altDelete]"        delete-word
    "$keystrokes[cmdDelete]"        kill-line

    "$keystrokes[cmdZ]"             undo
    "$keystrokes[cmdShiftZ]"        redo
    "$keystrokes[cmdX]"             kill-buffer

    "$keystrokes[cr]"               accept-line
    "$keystrokes[tab]"              expand-or-complete
)
for key wid in ${(kv)keystrokes_widgets}; bindkey -M key_map "${key}" "${wid}" 

bindkey -A key_map main


# STTY 


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
    susp    '^Z'        # Process Suspend (SIGTSTP)
    quit    '^\\'       # Process Quit + core dump (SIGQUIT)
    erase   '^H'        # Char Remove Backwards
    intr    '^C'        # Process Interrupt (SIGINT)
    status  '^T'        # Process Status (SIGINFO)
)

for action char in ${(kv)cchars}; stty ${action} ${char}


unset keystrokes_widgets disabled_cchars cchars
