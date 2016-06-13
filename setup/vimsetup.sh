#!/bin/bash
cwd=$(pwd)
vimPath="$cwd/../vim/.vim"
vimrcPath="$cwd/../vim/.vimrc"
#remove files if they already exist
rm -rf ~/.vim ~/.vimrc
ln -s $vimPath ~/.vim
ln -s $vimrcPath ~/.vimrc
#create directories for vim (undo, swap, prev)
mkdir ~/.vim/undo
mkdir ~/.vim/swap
