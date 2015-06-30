set shiftwidth=4    " reindent operations indent 4 spaces
set tabstop=4       " visual spaces per tabs
set expandtab		" tabs to spaces
set showmatch       " highlight matching [{()}]
set number          " show line numbers
set hidden          " hide modified buffers without saving
syntax on          "syntax highlighting

setl autoread  " auto reload file if edited
set backspace=indent,eol,start       " allow backspacing over lines, start of inserts, indents (default on some systems)
"autoindent for various programming languages:
filetype on
autocmd Filetype c,cpp,h setl cindent "c/c++
autocmd Filetype java setl cindent "java
autocmd Filetype php setl cindent "php
autocmd Filetype html setl cindent "html
autocmd Filetype sh setl shiftwidth=2 tabstop=2 "shell scripts
autocmd Filetype py, rb setl cindent shiftwidth=2 tabstop=2 "scripting languages
autocmd FileType make setl noexpandtab "leave tabs alone with makefiles
autocmd FileType jsp set filetype=html
autocmd FileType c,cpp,h,java,php,html,sh,py,rb,make,jsp call HighlightOver80()
"disable autocomment
autocmd BufEnter * setl formatoptions-=ro

"set cursorline     " shows line cursor is on by underlining it
"clear statusline
set statusline=
set statusline+=%n\     "buffer number
set statusline+=%F\     "fileName
set statusline+=%h%m%r  "help, modified, readonly
set statusline+=%= "switch to left side
set statusline+=Ascii:\ %b  "ascii code
set statusline+=\ Line:\ %l/%L   "line number/numLines
set statusline+=\ Column:\ %c    "column number
set laststatus=2

" '100=save marks for last 100 files,
" f1=save global marks as well,
"%=save buffer list if no cl args
set viminfo='100,f1 ",%
"preserve last vim session in ~/.vim/prev file
"only want to save options and buffers, not window size, etc
set sessionoptions=buffers,options
autocmd VimLeave * mksession! ~/.vim/prev

"enable recursive file finding with :find
set path+=**
"use the autocommand so supertab doesn't get slow
autocmd InsertEnter * set path-=**
autocmd InsertLeave * set path+=**


"************************** Keybindings***************
"RSI Keybindings
"cmap f find
cnoreabbrev f find
cnoreabbrev e find
"RSI Prevention:
"motions
noremap f j
noremap s h
noremap d k
noremap g l
"set right hand keys to left
noremap j f
noremap h g
noremap k d
noremap l s
noremap hh gg

"renoremap escape and :
noremap zf :
inoremap zz <Esc>`^

"End RSI Prevention Bindings
"Leader mappings
let mapleader = " "
"write commands
nnoremap <Leader>w :w<Enter>
nnoremap <Leader>s :wq<Enter>
"quitting commands
nnoremap <Leader>q :q<Enter>
nnoremap <Leader>x :qa<Enter>
nnoremap <Leader>xx :qa!<Enter>
"window commands
nnoremap <Leader>j <C-w>j
nnoremap <Leader>l <C-w>l
nnoremap <Leader>k <C-w>k
nnoremap <Leader>h <C-w>h
nnoremap <Leader>v :vsp<Enter>
"opening a file
"nnoremap <Leader>f :find<Space>
nnoremap <Leader>e :edit<Space>
nnoremap <Leader>f :CtrlPMixed<Enter>
"vimrc
nnoremap <Leader>sv :source ~/.vimrc<Enter>
nnoremap <Leader>ov :edit ~/.vimrc<Enter>
"buffer commands
nnoremap <Leader>g :CtrlPBuffer<Enter>
"nnoremap <Leader>g :b
nnoremap <Leader>d :bp\|bd#<Enter>
nnoremap <Leader>i :b#<Enter>
"minimacros
nnoremap <Leader>t :call Trim()<Enter>
nnoremap <Leader>cm ^i//<Esc>
cnoremap <Leader>r <Enter>
"misc commands
nnoremap <Leader>m :make<Enter>
nnoremap <Leader>n :call ToggleNumbers()<Enter>
nnoremap <Leader>n :set relativenumber!<Enter>
nnoremap <Leader><Leader> <Space>
cnoremap <Leader><Leader> <Space>

"******************* End Keybindings******************

"plugins
"pathogen initialization
execute pathogen#infect()
filetype plugin on
let g:Dsurround = 'ks'

"functions
function HighlightOver80()
"underlinetext over 80 characters
highlight OverLength cterm=underline
match OverLength /\%>80v.\+/
endfunction

"trim all trailing white space (call with :call Trim())
function Trim()
:%s/\s\+$//e
endfunction

"toggle relative/line numbers
function ToggleNumbers()
  if(&number == 0)
    set number
  else
    set relativenumber
  endif
endfunction
