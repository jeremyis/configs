""" VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'kchmck/vim-coffee-script'
Plugin 'lchi/vim-toffee'
Plugin 'groenewege/vim-less'
Plugin 'nathanaelkane/vim-indent-guides'

" All of your Vundle Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


set encoding=utf-8
set expandtab tabstop=2 shiftwidth=2 softtabstop=2

set number
set ruler " show current position at all times
set showcmd " display incomplete commands
let mapleader = ","

" set highlight/underline line color
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

colorscheme slate
set background=dark

set nowrap
syntax on
filetype plugin indent on

syntax on " Syntax coloring

set backupdir=/tmp
set directory=/tmp

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

filetype plugin on

" 80 line character coloring - http://vimbits.com/bits/13
if exists('+colorcolumn')
  set colorcolumn=80
else
  augroup 80_chars
  autocmd!
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  augroup END
endif

" Ignore searches with ctrl+p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
j
set paste

" Remove trailing white space on save.
autocmd BufWritePre * :%s/\s\+$//e

" Autowrap for git commits.
autocmd Filetype gitcommit setlocal spell textwidth=72

" Indent guides. https://github.com/nathanaelkane/vim-indent-guides
let indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgray  ctermbg=235
let indent_guides_color_change_percent = 10
let indent_guides_guide_size = 2
let g:indent_guides_enable_on_vim_startup = 1

" bufexplorer (plugin) config:
"let g:bufExplorerShowRelativePath=1 " Show relative path
"let g:bufExplorerSplitOutPathName=0 " Show path name as part of file
"let g:bufExplorerSortBy='fullpath' " Sort by full file name

" Weird vim screen color issue
set t_Co=256


""" CUSTOM MACROS """
" Open definition of focused item in split window
" TODO: make these work
":map , :sp<ENTER>*Ngd
":nmap <F2> :sp %:p:h
":cnoremap <F1> :vs %:p:h

" To get a buffer for text manipulation and easy copy/paste,
" use F1
let mapleader = ","
let maplocalleader = "\\"
nnoremap <F1> :set number! wrap<CR>

inoremap <F2> :syntax sync fromstart<CR><F2>
"nnoremap <F3> :call NumberToggle()<CR>
nnoremap <F4> :e %:p:h<CR>
nnoremap + *N
nnoremap <leader><leader> :sp<CR>gd

nnoremap <leader>rc :split $MYVIMRC<cr>
nnoremap <leader>sr :source $MYVIMRC<cr>
