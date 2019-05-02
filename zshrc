umask 022
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
export EDITOR=vim
setopt appendhistory autocd extendedglob nomatch notify globdots
unsetopt beep
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey "^[OA" history-beginning-search-backward
bindkey "^[OB" history-beginning-search-forward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
# ctrl-left/right
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

# ctrl-backspace/delete
bindkey "\C-_" backward-kill-word
bindkey "\e[3;5~" kill-word

# alt-backspace
bindkey "\e\d" undo

bindkey "\e[3~" delete-char
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

zstyle :compinstall filename '~/.zshrc'
#autoload -Uz compinit
#compinit -Cu
#zstyle ':completion:*' menu select
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

eval `dircolors ~/.dir_colors`

alias ls="ls -AF --color"

setopt prompt_subst

source ~/.zsh/completion.zsh
source ~/.zsh/promptvi.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/title.zsh


if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
