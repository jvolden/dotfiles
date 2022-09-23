" Pluggins -----------------------------------------------------------------{{{

filetype off

call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'Yggdroot/indentLine'
Plug 'vimwiki/vimwiki'
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'
call plug#end()

filetype plugin indent on

" }}}

" Basic Settings -----------------------------------------------------------{{{
syntax enable

set encoding=UTF-8

set nocompatible

set number
set relativenumber
set colorcolumn=100
	
" Spaces, tabs and indents
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smartindent

set nobackup

set scrolloff=10
set sidescrolloff=10

set ignorecase

set noshowmode
set showcmd

set wildmenu
set wildmode=list:longest

set mouse=a

set splitright

set noswapfile

set pastetoggle=<f2>

colorscheme solarized8
set background=dark

set laststatus=2
" }}}

" Vimscript ----------------------------------------------------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Mappings -----------------------------------------------------------------{{{
let mapleader=","
imap jj <Esc>

nnoremap <Leader>vr :source ~/.vimrc<CR>
nnoremap <Leader>vv :vnew ~/.vimrc<CR>

nnoremap <Space> :

" NO ARROW KEYS!
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
" }}}

" preservim/vim-markdown ---------------------------------------------------{{{
let g:vim_markdown_folding_disabled = 1
" }}}

" Yggdroot/indentLine ------------------------------------------------------{{{
let g:indentLine_setColors = 1
let g:indentLine_color_term = 8
let g:indentLine_char = '│'
let g:indentLine_concealcursor = ''
let g:indentLine_conceallevel = 1
" }}}

" vimwiki/vimwiki ----------------------------------------------------------{{{
let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" }}}

" itchyny/lightline --------------------------------------------------------{{{
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
" }}}
