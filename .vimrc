set laststatus=2    " show status line
set expandtab       " make tabs spaces
set shiftwidth=4    " reindent operations indent 4 spaces
set tabstop=4       " visual spaces per tabs
set showmatch       " highlight matching [{()}]
set number          " show line numbers
set hidden          " hide modified buffers without saving
:setlocal autoread  " auto reload file if edited
set cindent         " auto indent with C standard
set backspace=indent,eol,start       " allow backspacing over lines, start of inserts, indents (default on some systems)
:set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P    " show ascii and hex codes for character under cursor

"cool stuff: 
"set cursorline     " shows line cursor is on by underlining it
"these two remaps messs with normal navigation...
"nnoremap j gj       " move vertically by visual line
"nnoremap k gk       " move vertically by visual line
