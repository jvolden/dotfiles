# dotfiles

Attempting to keep it clean while working with both \*nix and cygwin shells. 

* Sets term and vim themes to solarized. 
* Along with a few status line submodules for zsh and vim.
* ~~Adds~~ Provides DejaVuSansMono font. https://github.com/powerline/fonts

### First use:

Run these commands:

  1. $ chsh -s $(which zsh) (Globally set in bashrc.)
  2. Run install.sh

### Required:

For lightline and zsh theme to work correctly, install DejaVuSansMono from ./fonts.

### TODO:

- [x] Add fonts to dotfiles?
- [ ] Update install.sh to backup old files incrementally.
- [ ] Add git status line to bash. Change bashrc completely?