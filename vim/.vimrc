set laststatus=2    " show status line
set expandtab       " make tabs spaces
set shiftwidth=4    " reindent operations indent 4 spaces
set tabstop=4       " visual spaces per tabs
set showmatch       " highlight matching [{()}]
set number          " show line numbers
set hidden          " hide modified buffers without saving
syntax on          "syntax highlighting
setl autoread  " auto reload file if edited
set backspace=indent,eol,start       " allow backspacing over lines, start of inserts, indents (default on some systems)
"autoindent for various programming languages:
filetype on
autocmd Filetype c,cpp,h setl cindent  "c/c++
autocmd Filetype java setl cindent     "java
autocmd Filetype php setl cindent      "php
autocmd Filetype html setl cindent     "html
autocmd Filetype sh setl cindent shiftwidth=2 tabstop=2     "shell scripts
autocmd Filetype py, rb setl cindent shiftwidth=2 tabstop=2     "scripting languages
autocmd FileType make setl noexpandtab   "leave tabs alone with makefiles


"cool stuff:
"set cursorline     " shows line cursor is on by underlining it
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P    " show ascii and hex codes for character under cursor
set viminfo='100,f1 ",%               " '100=save marks for last 100 files, f1=save global marks as well, %=save buffer list if no cl args
"preserve last vim session in ~/.vim/prev file
set sessionoptions=buffers,options          "only want to save options and buffers, not window size, etc
autocmd VimLeave * mksession! ~/.vim/prev

"************************** Keybindings***************
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

nnoremap zz <Esc>
vnoremap zz <Esc>gV
onoremap zz <Esc>
inoremap zz <Esc>`^

"renoremap enter to zg
nnoremap zg <Enter>
vnoremap zg <Enter>
onoremap zg <Enter>
inoremap zg <Enter>
cnoremap zg <Enter>
"End RSI Prevention Bindings
"******************* End Keybindings******************


"plugins 
"pathogen initialization
execute pathogen#infect()
filetype plugin on
