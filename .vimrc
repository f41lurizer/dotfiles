set laststatus=2    " show status line
set expandtab       " make tabs spaces
set shiftwidth=4    " reindent operations indent 4 spaces
set tabstop=4       " visual spaces per tabs
set showmatch       " highlight matching [{()}]
set number          " show line numbers
set hidden          " hide modified buffers without saving
syntax on          "syntax highlighting
setlocal autoread  " auto reload file if edited
set backspace=indent,eol,start       " allow backspacing over lines, start of inserts, indents (default on some systems)

"cool stuff:
"set cursorline     " shows line cursor is on by underlining it
:set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P    " show ascii and hex codes for character under cursor

"autoindent for various programming languages:
filetype on
autocmd Filetype c,cpp,h setl cindent  "c/c++
autocmd Filetype java setl cindent     "java
autocmd Filetype php setl cindent      "php
autocmd Filetype html setl cindent     "html
autocmd Filetype sh setl cindent shiftwidth=2 tabstop=2     "shell scripts
autocmd Filetype py setl cindent shiftwidth=2 tabstop=2     "shell scripts
autocmd FileType make setl noexpandtab   "leave tabs alone with makefiles

"not in use: 
"nnoremap j gj       " move vertically by visual line
"nnoremap k gk       " move vertically by visual line
"set cindent         " auto indent with C standard
