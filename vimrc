"" Pretty colors.
syntax enable
set nocompatible
set softtabstop=4
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set number
set ignorecase
set smartcase
set magic
set ai
set si
set mouse=a
set noswapfile
set background=dark

"" Remap escape to jj. Much quicker! 
inoremap jj <Esc>

"" Turn on status line by default.
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'solarized_dark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component': {
    \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
    \ },
    \ 'separator': { 'left': '⮀', 'right': '⮂' },
    \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
    \ }

"" Turns off default mode text.
set noshowmode

"" Set to 256 colors. (Fixes solarized terminal colors.)
if !has('gui_running')
    set t_Co=256
endif

"" Auto reload .vimrc when saved.
au BufWritePost .vimrc so ~/.vimrc

"" Cause pathogen maker Pope said to.
execute pathogen#infect()
filetype plugin indent on

nmap t o<ESC>k
nmap T O<ESC>j

set cursorline
colorscheme solarized
set colorcolumn=81
