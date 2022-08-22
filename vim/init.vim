" viM: foldmethod=marker: set foldmarker=\"\*\*\*\*\*,\"\end:
"***** Plugins
call plug#begin()
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'srstevenson/vim-picker'
	Plug 'stephpy/vim-yaml'
	Plug 'hashivim/vim-terraform'
	Plug 'vim-python/python-syntax'
    Plug 'udalov/kotlin-vim'
    Plug 'powerman/vim-plugin-AnsiEsc'
	"Plugin Settings
	"deoplete settings
	let g:deoplete#enable_at_startup = 1
	" Use pipenvs...kinda hardcoded but \o/
	" To set up: create to virtualenvs somewhere for neovim python
	let g:python_host_prog = '/Users/maz.jindeel/.local/share/virtualenvs/vim_python2-g3tPzZN_/bin/python'
	let g:python3_host_prog = '/Users/maz.jindeel/.local/share/virtualenvs/vim_python3-AsYrRTyA/bin/python'
endif
call plug#end()
"end Plugins

"***** Sensible defaults
set shiftwidth=4    " reindent operations indent 4 spaces
set noexpandtab		" tabs to spaces
set tabstop=4       " visual spaces per tabs
set et " To all the people with shitty editors, you finally won
"set softtabstop=4   " backspace over 4 spaces
set showmatch       " highlight matching [{()}]
set number          " show line numbers
set title
set titlestring=Vim
set hidden          " hide modified buffers without saving
set nohlsearch
syntax on          "syntax highlighting
" For white background, 'morning' seems to be a better scheme
"colorscheme morning
"colorscheme default "use default color scheme
set autoread  " auto reload file if edited
set backspace=indent,eol,start       " allow backspacing over lines, start of inserts, indents (default on some systems)
set wildmode=longest,list " bash like tab completion
"disable autocomment
autocmd BufEnter * setl formatoptions-=ro
set ignorecase    "ignore case in search patterns
set smartcase     "disables ignorecase if caps are in search pattern
"end defaults

"***** functions***************
"trim all trailing white space
function! Trim()
:%s/\s\+$//e
endfunction

"toggle relative/line numbers
function! ToggleNumbers()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction
"end functions

"***** filetype specific defaults
au TermOpen * setlocal listchars= nonumber norelativenumber
au TermOpen * startinsert
au BufEnter,BufWinEnter,WinEnter term://* startinsert
au BufLeave term://* stopinsert
au FileType json setl sw=2 ts=2 sts=2 et
au FileType javascript setl sw=2 ts=2 sts=2 et
au FileType java setl sw=4 ts=4 sts=4 noet
au FileType typescript setl sw=2 ts=2 sts=2 et
au FileType typescript.tsx setl sw=2 ts=2 sts=2 et
au FileType markdown  setl sw=2 ts=2 sts=2 et
au BufWritePre * call Trim()
"end filetype specific defaults

"***** Keybindings
"Regular keybindings
"virtual j and k
" nnoremap j gj
" nnoremap k gk
"cmap f find
"cnoreabbrev f find
cnoreabbrev e edit

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
nnoremap <Leader>sp :sp<Enter>

"opening a file
"nnoremap <Leader>f :find<Space>
nnoremap <Leader>e :edit<Space>
"nnoremap <Leader>f :CtrlPMixed<Enter>
nnoremap <Leader>on :enew<Enter>

" configuration file keybindings
nnoremap <Leader>ob :edit ~/.bashrc<Enter>
nnoremap <Leader>sb :!source ~/.bashrc<Enter>
nnoremap <Leader>ot :edit ~/.tmux.conf<Enter>
nnoremap <Leader>oz :edit ~/.zshrc<Enter>
nnoremap <Leader>oc :edit ~/.zshrc.code42<Enter>

"buffer commands
"nnoremap <Leader>g :CtrlPBuffer<Enter>
"nnoremap <Leader>g :b " enable if no ctrlp
"delete a buffer
nnoremap <Leader>d :bp\|bd!#<Enter>
"switch to previous buffer
nnoremap <Leader>i :b#<Enter>
"tab commands
nnoremap <Leader>t :tabn<Enter>
nnoremap <Leader>ot :tabnew<Enter>
"mini macros
nnoremap <Leader>ct :call Trim()<Enter>
nnoremap <Leader>cr :%s/\r\n/\r/g<Enter>
"compile a c programs quickly
nnoremap <Leader>m :make<Enter>
"toggle between number and relativenumber
nnoremap <Leader>n :call ToggleNumbers()<Enter>
"spawn a subshell
nnoremap <Leader>sh :sh<Enter>
"toggle paste mode
nnoremap <Leader>p :setl paste!<Enter>
"undo to last write
nnoremap <Leader>oh q:
nnoremap <Leader>u :earlier 1f<Enter>
nnoremap <Leader>2 :setl shiftwidth=2 tabstop=2 softtabstop=2<Enter>
nnoremap <Leader>4 :setl shiftwidth=4 tabstop=4 softtabstop=4<Enter>
"to type a space quickly, type space space
nnoremap <Leader><Leader> <Space>
cnoremap <Leader><Leader> <Space>

"Neovim Specific keybindings
if has('nvim')
	"Use system keyboard as unnamed register
	set clipboard+=unnamedplus
	"vimrc
	nnoremap <Leader>sv :source ~/.config/nvim/init.vim<Enter>
	nnoremap <Leader>ov :edit ~/.config/nvim/init.vim<Enter>
	"Terminal mode mappings
	tnoremap jk <C-\><C-n>
	tnoremap <Esc> <C-\><C-n>
	tnoremap <C-k> <Up>
	tnoremap <C-j> <Down>
	nnoremap <Leader>om :terminal<CR>

	"Plugin keybindings
	" deoplete tab-complete
	inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

	"fuzzy settings
	nnoremap <Leader>f :PickerEdit<CR>
	nnoremap <Leader>g :PickerBuffer<CR>

endif
"end Keybindings


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
