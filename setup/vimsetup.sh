#!/bin/bash
cwd=$(pwd)

#First, we install the neovim
sudo apt update
sudo apt install curl neovim python-neovim python3-neovim python3-pip
#TODO: use virtualenvs for the python setups
pip3 install neovim

#https://github.com/neovim/neovim/wiki/Installing-Neovim
#vimPath="$cwd/../vim/.vim"
vimrcPath="$cwd/../vim/init.vim"
##remove files if they already exist
rm -rf $HOME/.config/nvim

#Install plugin manager
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s $vimrcPath $HOME/config/nvim/init.vim
nvim +PlugInstall +UpdateRemotePlugins +qall!
#create directories for vim (undo, swap, prev)
#mkdir ~/.vim/undo
#mkdir ~/.vim/swap
