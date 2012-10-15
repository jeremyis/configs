set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set encoding=utf-8
" for python, use 4 spaces:
"set expandtab tabstop=4 shiftwidth=4 softtabstop=4

set number
set ruler " show current position at all times
set showcmd " display incomplete commands
"set cursorline " highlight/underline line of cursor

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
"set smartindent "Enabling this won't let you indent lines that begin with '#'
"set cindent
"set shiftround
set background=dark " TEMPORARILY DISABLE TO SEE IF CAUSING DRAWING ISSUE

set nowrap

" not sure if we want this
"set colorscheme default

" highlight lines over 80 length
" highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
" match OverLength /\%81v.*/
call pathogen#infect()
syntax on
filetype plugin indent on

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

" 80 line character coloring - http://vimbits.com/bits/13
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" toggle between relative and absolute line numbers -http://vimbits.com/bits/40
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <F3> :call NumberToggle()<cr>

" bufexplorer (plugin) config:
let g:bufExplorerShowRelativePath=1 " Show relative path
let g:bufExplorerSplitOutPathName=0 " Show path name as part of file
let g:bufExplorerSortBy='fullpath' " Sort by full file name

" Ignore searches with ctrl+p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" For this awesome plugin:https://github.com/nathanaelkane/vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gre11 ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gre82 ctermbg=236

set paste

" Try to fix syntax-highlighting scroll issues. See: http://www.sbf5.com/~cduan/technical/vi/vi-4.shtml
"syn sync minlines=1000

""" CUSTOM MACROS """
" Open definition of focused item in split window
" TODO: make these work
":map , :sp<ENTER>*Ngd
":nmap <F2> :sp %:p:h
":cnoremap <F1> :vs %:p:h

" To get a buffer for text manipulation and easy copy/paste,
" use F1
nmap <F1> :set number! wrap<CR>

noremap <F2> :syntax sync fromstart<CR>
inoremap <F2> :syntax sync fromstart<CR<F2>
nmap + *N

" Weird vim screen color issue
set t_Co=256

" If you are using Vundle (and not pathogen)
"Bundle 'kchmck/vim-coffee-script'
"Bundle '/digitaltoad/vim-jade'

" colorscheme ir_black
"colorscheme kruby

