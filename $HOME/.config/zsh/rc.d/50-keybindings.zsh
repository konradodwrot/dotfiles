bindkey -N keys

bindkey -M keys -R "\M-^@"-"\M-^?" self-insert
bindkey -M keys -R " "-"~" self-insert
bindkey -M keys "^[[200~" bracketed-paste

bindkey -M keys "^[[A" up-line-or-history                      # up
bindkey -M keys $'\u009E\u2191' beginning-of-buffer-or-history # command + up
bindkey -M keys "^[[B" down-line-or-history                    # bottom
bindkey -M keys $'\u009E\u2193' end-of-buffer-or-history       # command + bottom
bindkey -M keys "^[[C" forward-char                            # left
bindkey -M keys "^[[D" backward-char                           # right
bindkey -M keys "^M" accept-line                               # enter
bindkey -M keys $'\u001b\u000d' self-insert-unmeta             # shift + enter = enter new line in prompt

bindkey -M keys "^?" backward-delete-char                      # backspace
bindkey -M keys "^[[3~" delete-char                            # del
bindkey -M keys "^[^?" backward-delete-word                    # alt + backspace
bindkey -M keys "^[[3;3~" delete-word                          # alt + del
bindkey -M keys $'\u009E\u232B' backward-kill-line             # Command + backspace
bindkey -M keys $'\u009E\u2421' kill-line                      # Command + del
bindkey -M keys "^[[1;3D" vi-backward-word                     # alt + left
bindkey -M keys "^[[1;3C" vi-forward-word                      # alt + right

bindkey -M keys $'\u009E\u2192' vi-end-of-line                 # Command + Right
bindkey -M keys $'\u009E\u2190' vi-beginning-of-line           # Command + Left
bindkey -M keys $'\u009Ez' undo                                # Command + z
bindkey -M keys $'\u009EZ' redo                                # Command + Shift + z
bindkey -M keys $'\u009Ex' kill-buffer                         # Command + x

bindkey -M keys "^I" expand-or-complete                        # Tab

bindkey -A keys main

WORDCHARS=""
