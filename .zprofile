#!/bin/zsh
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx 
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

#if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; 
#then
    #startx
#fi
