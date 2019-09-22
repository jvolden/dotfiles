# dotfiles

My dotfiles that I use on Windows/WSL and Linux. Should work with any bash/zsh shell environment.

## Included files:

1. bashrc: Mostly for fallback if zsh is not installed. Needs updating.  
2. dir_colors: Sets colors to Solarized Dark. See: https://github.com/seebi/dircolors-solarized  
3. gitconfig: My very generic global gitconfig. Replace with yours.
5. profile: Just the template profile file for bash.
6. tmux.conf: A few bindings and Solarized Dark color settings.
7. vimrc/vim folder: My current settings file with the following Vundle plugins

```vimrc
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter.git'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim'
```

8. zshrc/zsh folder: My current settings for zsh. 
    * agnosters theme: https://gist.github.com/3712874
    * vim_prompt
    * Lots of laggy horrible plugins turned on that I can't live without.
    * Git prompt

__TLDR: Generally these dotfiles will:__
* Set term and vim themes to solarized. 
* Adds a few status line submodules for zsh and vim.
* ~~Adds~~ Provides DejaVuSansMono font. https://github.com/powerline/fonts  
(Just pick your favorite powerline font.)

## Install:

Run install.sh

To make zsh default shell: $ chsh -s $(which zsh)

## Required:

Windows Only: For lightline and zsh theme to work correctly, install DejaVuSansMono from ./fonts.

_(Not required, but the status lines will look incorrect.)_

### TODO:

- [x] Add fonts to dotfiles?
- [x] Update install.sh to backup old files ~~incrementally~~ if needed.
- [ ] Add git status line to bash. Change bashrc completely?
- [ ] Update README.md to explain included dotfiles/folders.
