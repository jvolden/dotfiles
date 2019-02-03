# dotfiles

My dotfiles that I use on Windows/Cygwin and Linux. Should work with any bash/zsh shell environment.

## Included files:

1. bashrc: Mostly for fallback if zsh is not installed. Needs updating.  
2. dir_colors: Sets colors to Solarized Dark. See: https://github.com/seebi/dircolors-solarized  
3. gitconfig: My very generic global gitconfig. Replace with yours.
4. minttyrc: Settings for mintty. Mostly needed for Solarized colors.  
_(If you don't use cygwin, this can be deleted.)_
5. profile: Just the template profile file for bash.
6. tmux.conf: A few bindings and Solarized Dark color settings.
7. vimrc/vim folder: My current settings file with the following Vundle plugins

    ```vimrc
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'itchyny/lightline.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'scrooloose/nerdtree'
    Plugin 'tpope/vim-sensible'
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter.git'
    ```

8. zshrc/zsh folder: My current settings for zsh. 
    * agnosters theme: https://gist.github.com/3712874
    * vim_prompt
    * Lots of laggy horrible plugins turned on that I can't live without.
    * Git prompt

__TLDR: Generally these will dotfiles will:__
* Set term and vim themes to solarized. 
* Adds a few status line submodules for zsh and vim.
* ~~Adds~~ Provides DejaVuSansMono font. https://github.com/powerline/fonts  
(Just pick your favorite powerline font.)

## Install:

Run these commands:

  1. $ chsh -s $(which zsh) (Globally set in bashrc.)
  2. Run install.sh

## Required:

Windows Only: For lightline and zsh theme to work correctly, install DejaVuSansMono from ./fonts.

_(Not required, but the status lines will look incorrect.)_

### TODO:

- [x] Add fonts to dotfiles?
- [x] Update install.sh to backup old files ~~incrementally~~ if needed.
- [ ] Add git status line to bash. Change bashrc completely?
- [ ] Update README.md to explain included dotfiles/folders.