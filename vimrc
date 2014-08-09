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
            \             [ 'fugitive', 'filename' ] ]
            \ },
            \ 'component_function': {
            \   'fugitive': 'MyFugitive',
            \   'readonly': 'MyReadonly',
            \   'modified': 'MyModified',
            \   'filename': 'MyFilename'
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
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

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
