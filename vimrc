syntax on
filetype plugin indent on
set nocompatible     "" Set incompatible with vi
set softtabstop=2  "" Treat tabs like n spaces
set expandtab        "" Expand tabs into spaces
set shiftwidth=2   "" Spaces that < and > shift
set tabstop=2      "" Number of spaces for tabs
set smarttab
set number           "" Line numbers
set ignorecase
set smartcase
set magic
set autoindent       "" Keep previous line indent
set smartindent      "" Indent blocks automaticly
set mouse=a        "" Enable mouse all modes
set noswapfile
set background=dark
set scrolloff=5
set showcmd          "" Show commands as they are typed
set colorcolumn=100
set laststatus=2
set updatetime=250 "" ms to wait before writes
set noshowmode       "" Disable default mode state
set infercase
set completeopt =longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d

"" Set to 256 colors. (Fixes solarized terminal colors.)
if !has('gui_running')
  set t_Co=256
endif

"" Keybindings
let mapleader = ","
inoremap jj <Esc>
nmap t o<ESC>k
nmap T O<ESC>j

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'VundleVim/Vundle.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/calendar.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
call plug#end()

silent! colorscheme evening
silent! colorscheme solarized

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename', 'charvaluehex' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "\ue0a2"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 "._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return (''  != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

"" NERDTree Settings.
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade',     'green', 'none',   'green', '#151515')
call NERDTreeHighlightFile('ini',     'yellow', 'none',  'yellow', '#151515')
call NERDTreeHighlightFile('md',        'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',     'yellow', 'none',  'yellow', '#151515')
call NERDTreeHighlightFile('config',  'yellow', 'none',  'yellow', '#151515')
call NERDTreeHighlightFile('conf',    'yellow', 'none',  'yellow', '#151515')
call NERDTreeHighlightFile('json',    'yellow', 'none',  'yellow', '#151515')
call NERDTreeHighlightFile('html',    'yellow', 'none',  'yellow', '#151515')
call NERDTreeHighlightFile('styl',      'cyan', 'none',    'cyan', '#151515')
call NERDTreeHighlightFile('css',       'cyan', 'none',    'cyan', '#151515')
call NERDTreeHighlightFile('coffee',     'Red', 'none',     'red', '#151515')
call NERDTreeHighlightFile('js',         'Red', 'none', '#ffa500', '#151515')
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

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
