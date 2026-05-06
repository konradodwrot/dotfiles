bindkey -N key_map

# unicode modifiers
# ⌘ - command
# ⌥ - alt
# ⇧ - shift

bindkey -M key_map -R "^@"-"~" self-insert
bindkey -M key_map "^[[200~" bracketed-paste

# arrows
bindkey -M key_map "↑" up-line-or-history                        
bindkey -M key_map "⌘↑" beginning-of-buffer-or-history 
bindkey -M key_map "↓" down-line-or-history                    
bindkey -M key_map "⌘↓" end-of-buffer-or-history       
bindkey -M key_map "→" forward-char                            
bindkey -M key_map "←" backward-char                           

bindkey -M key_map "⌥←" vi-backward-word              
bindkey -M key_map "⌥→" vi-forward-word  

bindkey -M key_map "⌘→" vi-end-of-line             
bindkey -M key_map "⌘←" vi-beginning-of-line  

# deletions
bindkey -M key_map "\b" backward-delete-char                      
bindkey -M key_map "⌘\b" backward-kill-line             
bindkey -M key_map "⌥\b" backward-delete-word

bindkey -M key_map "␡" delete-char                               
bindkey -M key_map "⌥␡" delete-word                          
bindkey -M key_map "⌘␡" kill-line

# other
bindkey -M key_map "⌘z" undo                 
bindkey -M key_map "⌘⇧z" redo        
bindkey -M key_map "⌘x" kill-buffer

bindkey -M key_map "\r" accept-line     
bindkey -M key_map "\f" accept-line    
bindkey -M key_map "\t" expand-or-complete 

bindkey -A key_map main

WORDCHARS="" # words splits on everything


# stty
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

