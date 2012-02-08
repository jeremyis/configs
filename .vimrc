set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set encoding=utf-8
" for python, use 4 spaces:
"set expandtab tabstop=4 shiftwidth=4 softtabstop=4

set number
set ruler " show current position at all times
set showcmd " display incomplete commands
set cursorline " highlight line of cursor
set history=50

set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink

" Searching
set incsearch
set ignorecase " searches are case insensitive
set smartcase "...unless they contain at least 1 capital letter
set hlsearch

set backspace=indent,eol,start
set autoindent
set smartindent
"set cindent
"set shiftround
"set background=dark " TEMPORARILY DISABLE TO SEE IF CAUSING DRAWING ISSUE

set nowrap

" not sure if we want this
"set colorscheme default

" highlight lines over 80 length
" highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
" match OverLength /\%81v.*/
call pathogen#infect()
filetype plugin indent on

" auto-reload configuration
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Syntax coloring
syntax on

set backupdir=/tmp
set directory=/tmp

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

filetype plugin on

" To get a buffer for text manipulation and easy copy/paste,
" use F1
nmap <F1> :set number! wrap<CR>
