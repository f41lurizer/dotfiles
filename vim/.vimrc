set shiftwidth=4    " reindent operations indent 4 spaces
set tabstop=4       " visual spaces per tabs
set softtabstop=4   " backspace over 4 spaces 
set expandtab		" tabs to spaces
set showmatch       " highlight matching [{()}]
set number          " show line numbers
set hidden          " hide modified buffers without saving
syntax on          "syntax highlighting

setl autoread  " auto reload file if edited
set backspace=indent,eol,start       " allow backspacing over lines, start of inserts, indents (default on some systems)

"autoindent for various programming languages:
filetype on
autocmd FileType c,cpp,h setl cindent "c/c++
autocmd FileType java setl cindent "java
autocmd FileType html setl cindent "html
autocmd FileType sh setl shiftwidth=2 tabstop=2 "shell scripts
autocmd FileType py, rb setl cindent shiftwidth=2 tabstop=2 "scripting languages
autocmd FileType vim setl cindent shiftwidth=2 tabstop=2 "vim languages
autocmd FileType make setl noexpandtab "leave tabs alone with makefiles
autocmd FileType jsp set filetype=html
autocmd FileType .blade.php set filetype=html.blade.phpl setl smartindent "laravel blade files
autocmd FileType php setl cindent "php
autocmd FileType
autocmd FileType c,cpp,h,java,sh,py,rb,make,jsp,vim call HighlightOver80()
"disable autocomment
autocmd BufEnter * setl formatoptions-=ro

"set cursorline     " shows line cursor is on by underlining it
"remove tabline
set showtabline=0
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

"better marks
nnoremap ' `

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
nnoremap <Leader>on :enew<Enter>
"vimrc
nnoremap <Leader>sv :source ~/.vimrc<Enter>
nnoremap <Leader>ov :edit ~/.vimrc<Enter>
"buffer commands
nnoremap <Leader>g :CtrlPBuffer<Enter>
"nnoremap <Leader>g :b
nnoremap <Leader>d :bp\|bd#<Enter>
nnoremap <Leader>i :b#<Enter>
"tab commands
nnoremap <Leader>t :tabn<Enter>
nnoremap <Leader>ot :tabnew<Enter>
"minimacros
nnoremap <Leader>ct :call Trim()<Enter>
cnoremap <Leader>r <Enter>
"misc commands
nnoremap <Leader>m :make<Enter>
nnoremap <Leader>n :call ToggleNumbers()<Enter>
nnoremap <Leader>sh :sh<Enter>
"undo to last write
nnoremap <Leader>u :earlier 1f<Enter>
nnoremap <Leader><Leader> <Space>
cnoremap <Leader><Leader> <Space>
"commenting
nnoremap <Leader>cm ^i//<Esc>
autocmd FileType blade nnoremap <buffer> <Leader>cm ^i{{--<Esc>$a--}}
"******************* End Keybindings******************

"local file stuff
"Load local config
if filereadable(glob("~/.local.vimrc"))
  source ~/.local.vimrc
endif

"create undodir
set undofile
set undodir=~/.vim/undo "create undo directory

"set directory for swap files
set directory=~/.vim/swap "create swap directory

"set backupdir
"plugins
"pathogen initialization
execute pathogen#infect()
Helptags
filetype plugin on
let g:Dsurround = 'ks'
"for verminal
nnoremap <Leader>om :call NewBuffer()<Enter>
"for ultisnips
let g:UltiSnipsExpandTrigger="qm"
let g:UltiSnipsJumpForwardTrigger="qn"
let g:UltiSnipsJumpBackwardTrigger="qb"
"load neocomplete default settings
source ~/.vim/bundle/neocomplete.vim-master/settings.vim
"don't preview completion suggestions
set completeopt-=preview

"functions
function HighlightOver80()
  "underlinetext over 80 characters
  highlight OverLength cterm=underline
  "for highlighting columns over 80
  match OverLength /\%>80v.\+/
endfunction

"trim all trailing white space
function Trim()
:%s/\s\+$//e
endfunction

"toggle relative/line numbers
function ToggleNumbers()
  if(&number == 0)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunction
