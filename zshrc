umask 022
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
export EDITOR=vim
export SHELL=/bin/zsh
export PATH="$HOME/.cargo/bin:$PATH"
setopt appendhistory autocd extendedglob nomatch notify globdots
unsetopt beep

bindkey -M viins 'jj' vi-cmd-mode

zstyle :compinstall filename '~/.zshrc'

eval `dircolors ~/.dircolors`

alias ls="ls -AF --color"
alias dir="dir --color"
alias rm="rm -i"
alias tm560a="tmux -2 attach -t 560"
alias tm560c="tmux -2 new-session -s 560"
alias tm647a="tmux -2 attach -t 647"
alias tm647c="tmux -2 new-session -s 647"
alias tm678a="tmux -2 attach -t 678"
alias tm678c="tmux -2 new-session -s 678"
alias tmuxls="tmux ls"

setopt prompt_subst

. ~/.bin/z/z.sh

source ~/.zsh/completion.zsh
source ~/.zsh/promptvi.zsh
#source ~/.zsh/prompt.zsh
source ~/.zsh/title.zsh
source ~/.zsh/key-bindings.zsh
source ~/.zsh/functions.zsh
[[ $- = *i*  ]] && source ~/.zsh/liquidprompt/liquidprompt

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jon/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jon/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jon/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jon/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
