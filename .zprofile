#!/bin/zsh

export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

#if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; 
#then
    #startx
#fi
