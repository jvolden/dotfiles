filetype plugin indent on

"" Visual/layout settings
syntax on
set showtabline=2
set number           "" Line numbers
set nocompatible     "" Set incompatible with vi
set scrolloff=5
set showcmd          "" Show commands as they are typed
set noshowmode       "" Disable default mode state
set colorcolumn=100
set textwidth=100    "" Auto CR at 100 when typing
set background=dark

"" Default tab/indent settings
set softtabstop=2    "" Treat tabs like n spaces
set expandtab        "" Expand tabs into spaces
set shiftwidth=2     "" Spaces that < and > shift
set tabstop=2        "" Number of spaces for tabs
set smarttab
set autoindent       "" Keep previous line indent
set smartindent      "" Indent blocks automaticly

"" Search settings
set ignorecase
set smartcase
set magic

"" System settings
set mouse=a          "" Enable mouse all modes
set noswapfile
set updatetime=250   "" ms to wait before writes

" Keybindings
let mapleader = ","
let maplocalleader = "\\"
inoremap jj <Esc>

" Install vim-plug and plugins if vim-plug is not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'        " Light status/tabline plugin
Plug 'tpope/vim-sensible'           " Sensible
Plug 'tpope/vim-fugitive'           " Git wrapper
Plug 'tpope/vim-vinegar'            " Better netrw settings
Plug 'airblade/vim-gitgutter'       " Git diffs in side column
Plug 'easymotion/vim-easymotion'    " Faster motions
Plug 'vim-syntastic/syntastic'      " Syntax checking
Plug 'chriskempson/base16-vim'      " Fancy colours
Plug 'rust-lang/rust.vim'           " Rust settings
Plug 'lervag/vimtex'                " LaTeX plugin
Plug 'sirver/ultisnips'             " Snippets
Plug 'junegunn/fzf'
call plug#end()

"" vimtex settings
let g:vimtex_quickfix_mode = 0
let g:vimtex_compiler_latexmk = {
  \ 'options' : [
  \   '-verbose',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \   '-pdf',
  \   '-shell-escape',
  \ ],
  \}

"" UltiSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsEditSplit="vertical"

" Turn on cursor line when editing.
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
autocmd FileType c,cpp,hpp,sh autocmd BufWritePre <buffer> %s/\s\+$//e

"" Syntastic settings
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_python_python_exec = 'python3'

"" base16colorschemes
if filereadable(expand("~/.vim/.vimrc_background"))
  let base16colorspace=256
  source ~/.vim/.vimrc_background
endif

"" Latex Settings
let g:tex_flavor='latex'

" base16 colors
if filereadable(expand("~/.vim/lightlinerc"))
  source ~/.vim/lightlinerc
endif

"" Edit .vimrc
nnoremap <Leader>ve :e $MYVIMRC<CR>
"" Reload .vimrc
nnoremap <Leader>vr :source $MYVIMRC<CR>

nnoremap <Leader>f :FZF<CR>
