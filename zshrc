umask 022
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
export EDITOR=vim
export SHELL=/bin/zsh
setopt appendhistory autocd extendedglob nomatch notify globdots
unsetopt beep

bindkey -M viins 'jj' vi-cmd-mode

zstyle :compinstall filename '~/.zshrc'

eval `dircolors ~/.dir_colors`

alias ls="ls -AF --color"
alias tmuxattach="tmux -S /tmp/jonjeffs attach -t jonjeff"
alias tmuxcreate="tmux -S /tmp/jonjeffs new-session -s jonjeff"
alias tmuxls="tmux -S /tmp/jonjeffs ls"

setopt prompt_subst

source ~/.zsh/completion.zsh
source ~/.zsh/promptvi.zsh
#source ~/.zsh/prompt.zsh
source ~/.zsh/title.zsh
source ~/.zsh/key-bindings.zsh
source ~/.zsh/functions.zsh
[[ $- = *i*  ]] && source ~/.zsh/liquidprompt/liquidprompt

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
