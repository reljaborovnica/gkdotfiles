export PATH=$PATH:$HOME/.local/bin:/var/lib/flatpak/exports/bin

autoload -U compinit promptinit
compinit
promptinit; prompt gentoo
#prompt gentoo
#PROMPT="%n@%m%d"
PROMPT='%B%F{green}%n%f%F{blue}@%f%F{magenta}%m%f %F{blue}%~>%f%f%b '
HISTSIZE=100000
SAVEHIST=100000

export HISTFILE="$HOME/.history" 
export SAVEHIST=$HISTSIZE

zstyle ':completion:*:descriptions' format '%U%B%d%b%u' 
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b' 
#setopt correctall

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

alias cp="cp -iv"
alias mv="cp -iv"
alias rm="rm -vI"
alias ffmpeg="ffmpeg -hide_banner"
alias nano='nano -wl'
alias ls="ls -hN --color=auto --group-directories-first"
alias diff="diff --color=auto" 
alias cat='bat --color=auto'
alias vim='nvim'
alias chs='sshpass -p 5556 ssh relja@10.1.3.3'
alias cpve='sshpass -p Dadada123 ssh root@10.1.1.15'
alias cpih='sshpass -p 5556 ssh root@10.1.250.10'
alias ip='ip -color=auto'

export TERMINAL="alacritty"

source .config/zsh/autosuggestions/zsh-autosuggestions.plugin.zsh
source .config/zsh/syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
