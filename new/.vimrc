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
Plugin 'airblade/vim-gitgutter' " Show git diff next to line numbers
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-scripts/taglist.vim' " For seeing file summary panel from tags
Plugin 'solarnz/thrift.vim' " Syntax for thrift

" All of your Vundle Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
set paste " must be set before expandtab
set expandtab tabstop=2 shiftwidth=2 softtabstop=2

set number
set ruler " show current position at all times
set showcmd " display incomplete commands
let mapleader = ","

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

"******* Colors ***********
set t_Co=256 " Weird vim screen color issue

" Indent guides. https://github.com/nathanaelkane/vim-indent-guides
let indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgray  ctermbg=234
let indent_guides_color_change_percent = 10
let indent_guides_guide_size = 2
let g:indent_guides_enable_on_vim_startup = 1

" 80 line character coloring - http://vimbits.com/bits/13
if exists('+colorcolumn')
  set colorcolumn=100
else
  augroup 100_chars
  autocmd!
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
  augroup END
endif

colorscheme slate
set background=dark
syntax on " Syntax coloring - MUST come before highlight color

" use custom search highlight color
hi Search cterm=NONE ctermfg=grey ctermbg=Magenta
hi IncSearch cterm=NONE ctermfg=grey ctermbg=Red

"******* END OF Colors ***********


set nowrap
filetype plugin indent on

" Fix aggressive markdown syntax highlighting
autocmd FileType markdown |
      \hi def link markdownItalic              NONE |
      \hi def link markdownItalicDelimiter     NONE |
      \hi def link markdownBold                NONE |
      \hi def link markdownBoldDelimiter       NONE |
      \hi def link markdownBoldItalic          NONE |
      \hi def link markdownBoldItalicDelimiter NONE

" Google App Scripts .gs files are javascript-like.
au BufRead,BufNewFile *.gs set syntax=javascript

set backupdir=/tmp
set directory=/tmp

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

filetype plugin on

" Ignore searches with ctrl+p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Remove trailing white space on save.
autocmd BufWritePre * :%s/\s\+$//e

" Autowrap for git commits.
autocmd Filetype gitcommit setlocal spell textwidth=72

let Tlist_Use_Right_Window=1 "Put taglist plugin on right side
let Tlist_Compact_Format=1

" bufexplorer (plugin) config:
"let g:bufExplorerShowRelativePath=1 " Show relative path
"let g:bufExplorerSplitOutPathName=0 " Show path name as part of file
"let g:bufExplorerSortBy='fullpath' " Sort by full file name
let g:bufExplorerSortBy='mru'
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSplitOutPathName=0
let g:bufExplorerShowDirectories=0



""" CUSTOM MACROS """
" Open definition of focused item in split window
" TODO: make these work
":map , :sp<ENTER>*Ngd
":nmap <F2> :sp %:p:h
":cnoremap <F1> :vs %:p:h

" To get a buffer for text manipulation and easy copy/paste,
" use F1
let maplocalleader = "\\"
nnoremap <F1> :set number! wrap<CR>

nnoremap <F2> :syntax sync fromstart<CR>
"nnoremap <F3> :call NumberToggle()<CR>
nnoremap <F4> :e %:p:h<CR>
nnoremap + *N
nnoremap <leader><leader> :sp<CR>gd

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Copy current buffer's file path to clipboard
nnoremap <leader>fp :let @+ = expand("%:p")<cr>

" Copy current files directory to clipboard
nnoremap <leader>dp :let @+ = expand("%:p:h")<cr>

" Copy content of main reigster to clipboard
nnoremap <leader>cp :let @+ = @"<cr>

" Change working directory to directory of current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" swap this line up
noremap <leader>- ddp

" swap this line with one above it
noremap <ledaer>_ ddkkp

let g:private_vimrc_path = fnamemodify(expand("$MYVIMRC"), ":p:h") . '/.vimrc-private'
if filereadable(g:private_vimrc_path)
  execute 'source '. g:private_vimrc_path
endif


""" Experimental: """

"http://vim.wikia.com/wiki/Bookmark_files
function! MoshBookmark()
  redir >> ~/.vims
  echo
  "echo strftime("%Y-%b-%d %a %H:%M")
  "echo "cd ". $PWD
  echo expand("%:p").':'.line('.')
  "echo ' word='.expand("<cword>")
  "echo ' cline='.getline('.')
  redir END
endfunction
":command! MoshBookmark :call MoshBookmark()
nnoremap <leader>m :call MoshBookmark()<cr>
nnoremap <leader>sm :e ~/.vims<cr>

" See local buffer diffs
nnoremap <leader>di :w !diff % -<cr>

" Make vim interactive: http://stackoverflow.com/questions/4642822/commands-executed-from-vim-are-not-recognizing-bash-command-aliases
set shellcmdflag=-ic

" folding
" TODO: toggle for enable folding http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
"set foldmethod=indent
"set foldcolumn=1
hi Folded ctermbg=59

" TODO: add markers http://learnvimscriptthehardway.stevelosh.com/chapters/18.html


" Macro to add visual mode text to clipboard
" http://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
function! Get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

vnoremap <leader>cp :<c-u>let @+ = Get_visual_selection()<cr>


" Configure statusline
" TODO: add pretty colors
" TODO: maybe use https://github.com/powerline/powerline

set laststatus=2  " always show status line

set statusline=%n
set statusline+=\ %.70f
set statusline+=\ %m\ %r

set statusline+=%=
set statusline+=\c\:%02v " Current col
set statusline+=\ %4l    " Current line
set statusline+=/        "    Separator
set statusline+=%-4L     " Total lines
set statusline+=\ %2p%%


" ctrl p
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" See http://stackoverflow.com/a/22784889
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Open Taglist plugin
nnoremap <silent> <F8> :TlistToggle<CR>

" Show tab number
if exists("+showtabline")
     function MyTabLine()
         let s = ''
         let t = tabpagenr()
         let i = 1
         while i <= tabpagenr('$')
             let buflist = tabpagebuflist(i)
             let winnr = tabpagewinnr(i)
             let s .= '%' . i . 'T'
             let s .= (i == t ? '%1*' : '%2*')
             let s .= ' '
             let s .= i . ')'
             let s .= ' %*'
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
             let file = bufname(buflist[winnr - 1])
             let file = fnamemodify(file, ':p:t')
             if file == ''
                 let file = '[No Name]'
             endif
             let s .= file
             let i = i + 1
         endwhile
         let s .= '%T%#TabLineFill#%='
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
         return s
     endfunction
     set stal=2
     set tabline=%!MyTabLine()
endif
