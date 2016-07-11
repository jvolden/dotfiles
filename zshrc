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

#autoload -Uz vcs_info
#zstyle ':vcs_info:*'                    stagedstr       'M'
#zstyle ':vcs_info:*'                    unstagedstr     'M'
#zstyle ':vcs_info:*'                    check-for-changes true
#zstyle ':vcs_info:*'                    actionformats   '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
#zstyle ':vcs_info:*'                    formats         '%F{5}[%F{2}%b%F{5}] %F{2}%c%F{3}%u%f'
#zstyle ':vcs_info:git*+set-message:*'   hooks git-untracked
#zstyle ':vcs_info:*'                    enable git
#
#+vi-git-untracked() {
#    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
#       [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
#       hook_com[unstaged]+='%F{1}??%f'
#    fi
#}
#
#precmd () {
#    vcs_info
#}
#
#PROMPT='%F{5}[%F{2}%n%F{5}@%F{2}%m%F{5}] %F{3}%3~ ${vcs_info_msg_0_} %f%# '

source ~/dotfiles/zsh/completion.zsh
source ~/dotfiles/zsh/promptvi.zsh
source ~/dotfiles/zsh/prompt.zsh
