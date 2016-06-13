" vim: foldmethod=marker: set foldmarker=\"\*\*\*\*\*,\"\end:
"***** vundle initialization ********************
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'SirVer/ultisnips'
Plugin 'Shougo/neocomplete.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'benjifisher/matchit.zip'
Plugin 'tomtom/tlib_vim'
Plugin 'kasldfh/verminal'
Plugin 'MarcWeber/vim-addon-mw-utils'
call vundle#end()            " required
filetype plugin indent on    " required
"end vundle initialization

"***** sensible defaults ********************
set shiftwidth=4    " reindent operations indent 4 spaces
set tabstop=4       " visual spaces per tabs
set softtabstop=4   " backspace over 4 spaces 
set expandtab		" tabs to spaces
set showmatch       " highlight matching [{()}]
set number          " show line numbers
set title
set titlestring=Vim
set hidden          " hide modified buffers without saving
syntax on          "syntax highlighting
colorscheme default "use default color scheme
set autoread  " auto reload file if edited
set backspace=indent,eol,start       " allow backspacing over lines, start of inserts, indents (default on some systems)
"disable autocomment
autocmd BufEnter * setl formatoptions-=ro
set modeline
"end defaults

"***** filetype specific stuff **************
"autoindent for various programming languages:
filetype on
filetype indent on
autocmd Filetype c,cpp,h setl cindent "c/c++
autocmd Filetype java setl cindent "java
autocmd FileType make setl noexpandtab "leave tabs alone with makefiles

autocmd Filetype sh setl shiftwidth=2 tabstop=2
autocmd FileType python setl cindent shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType ruby setl cindent shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType perl setl cindent shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType vim setl cindent shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType php setl cindent 


autocmd Filetype html setl smartindent shiftwidth=2 tabstop=2  softtabstop=2
autocmd FileType .blade.php set filetype=html.blade.phpl setl smartindent 
autocmd FileType jade setl cindent shiftwidth=2 tabstop=2 softtabstop=2

autocmd FileType text setl tw=80
autocmd FileType c,cpp,h,java,sh,py,rb,make,jsp,vim call HighlightOver80()

autocmd FileType jsp set filetype=html
"end filetype specific stuff

"***** appearance
"remove tabline--when disabled can't visually tell tabs are open
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
"end appearance

"***** session saving **************
" '100=save marks for last 100 files,
" f1=save global marks as well,
"%=save buffer list if no cl args
set viminfo='100,f1 ",%
"preserve last vim session in ~/.vim/prev file
"only want to save options and buffers, not window size, etc
set sessionoptions=buffers,options
autocmd VimLeave * mksession! ~/.vim/prev
"end session saving 

"***** Keybindings***************
"virtual j and k
nnoremap j gj
nnoremap k gk
"cmap f find
cnoreabbrev f find
cnoreabbrev e find

"better marks
nnoremap ' `

"Leader mappings
let mapleader = " "
"write commands
nnoremap <Leader>w :w<Enter>
nnoremap <Leader>s :wq<Enter>

"quitting commands
nnoremap <Leader>q :q<Enter>
nnoremap <Leader>x :qa<Enter>
nnoremap <Leader>xx :qa!<Enter>

"escape remap 
inoremap jk <Esc>
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

"bashrc keybindings
nnoremap <Leader>ob :edit ~/.bashrc<Enter>
nnoremap <Leader>sb :!source ~/.bashrc<Enter>

"tmux conf keybinding
nnoremap <Leader>ot :edit ~/.tmux.conf<Enter>

"buffer commands
nnoremap <Leader>g :CtrlPBuffer<Enter>
"nnoremap <Leader>g :b " enable if no ctrlp
"delete a buffer
nnoremap <Leader>d :bp\|bd#<Enter>
"switch to previous buffer
nnoremap <Leader>i :b#<Enter>
"tab commands
nnoremap <Leader>t :tabn<Enter>
nnoremap <Leader>ot :tabnew<Enter>
"mini macros
nnoremap <Leader>ct :call Trim()<Enter>
"compile a c programs quickly
nnoremap <Leader>m :make<Enter>
"toggle between number and relativenumber
nnoremap <Leader>n :call ToggleNumbers()<Enter>
"spawn a subshell
nnoremap <Leader>sh :sh<Enter>
"toggle paste mode
nnoremap <Leader>p :set paste!<Enter> 
"undo to last write
nnoremap <Leader>oh q:
nnoremap <Leader>u :earlier 1f<Enter>
nnoremap <Leader>2 :setl shiftwidth=2 tabstop=2 softtabstop=2<Enter>
nnoremap <Leader>4 :setl shiftwidth=4 tabstop=4 softtabstop=4<Enter>
"to type a space quickly, type space space
nnoremap <Leader><Leader> <Space>
cnoremap <Leader><Leader> <Space>
"commenting
nnoremap <Leader>cm ^i//<Esc>
autocmd FileType blade nnoremap <buffer> <Leader>cm ^i{{--<Esc>$a--}}<Esc>
"end keybindings

"***** local file stuff *****************
"Load local config
if filereadable(glob("~/.local.vimrc"))
  source ~/.local.vimrc
endif

"create undodir
set undofile
set undodir=~/.vim/undo "create undo directory

"set directory for swap files
set directory=~/.vim/swap "create swap directory

"end local file stuff

"***** plugins configuration****************************88
"for verminal
nnoremap <Leader>om :call NewBuffer()<Enter>
"for ultisnips
let g:UltiSnipsExpandTrigger="qm"
let g:UltiSnipsJumpForwardTrigger="qn"
let g:UltiSnipsJumpBackwardTrigger="qb"
"load neocomplete default settings
source ~/.vim/neocomplete_settings.vim
"don't preview completion suggestions
set completeopt-=preview
"end plugins configuration

"***** functions***************
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
"end functions

"***** unused settings **************************
"set cursorline     " shows line cursor is on by underlining it
"end unused settings
