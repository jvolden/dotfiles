# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jon/.zshrc'

autoload -Uz compinit
compinit -u
# End of lines added by compinstall
autoload -U promptinit
promptinit
prompt adam2

eval `dircolors ~/.dir_colors`

alias ls="ls -AF --color"
