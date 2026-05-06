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
bindkey -M key_map "⌫" backward-delete-char                      
bindkey -M key_map "⌘⌫" backward-kill-line             
bindkey -M key_map "⌥⌫" backward-delete-word

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
