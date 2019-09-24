syntax on
filetype plugin indent on
set showtabline=2
set nocompatible     "" Set incompatible with vi
set softtabstop=2    "" Treat tabs like n spaces
set expandtab        "" Expand tabs into spaces
set shiftwidth=2     "" Spaces that < and > shift
set tabstop=2        "" Number of spaces for tabs
set smarttab
set number           "" Line numbers
set ignorecase
set smartcase
set magic
set autoindent       "" Keep previous line indent
set smartindent      "" Indent blocks automaticly
set mouse=a          "" Enable mouse all modes
set noswapfile
set scrolloff=5
set showcmd          "" Show commands as they are typed
set colorcolumn=100
set updatetime=250   "" ms to wait before writes
set noshowmode       "" Disable default mode state
set infercase
set completeopt =longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d

"" Keybindings
let mapleader = ","
inoremap jj <Esc>
nmap t o<ESC>k
nmap T O<ESC>j

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-syntastic/syntastic'
Plug 'ervandew/supertab'
Plug 'chriskempson/base16-vim'
call plug#end()

"" NERDTree Settings.
noremap <Leader>f :NERDTreeToggle<CR>
noremap <silent> <Leader>v :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree

"" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade',   'green',   'none', 'green',   '#151515')
call NERDTreeHighlightFile('ini',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('coffee', 'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

"" Reload .vimrc when saved
augroup vimrchooks
  au!
  autocmd BufWritePost .vimrc source ~/.vimrc
augroup END

augroup omni_complete
  " clear commands before resetting
  autocmd!
  " Enable omnicomplete for supported filetypes
  autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

"" base16colorschemes
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

if filereadable(expand("~/.lightlinerc"))
  source ~/.lightlinerc
endif
