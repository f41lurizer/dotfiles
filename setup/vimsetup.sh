#!/bin/bash
cwd=$(pwd)
vimrcPath="$cwd/../vim/init.vim"

#First, we install the neovim
sudo apt install -y curl neovim python-neovim python3-neovim python3-pip fzy

pip3 install pipenv

#create two virtualenvs
mkdir vim_python2 vim_python3
cd vim_python2
pipenv --python 2
pipenv install pynvim
python2_venv=$(pipenv --venv)
sed -i "s|PYTHON2_VENV|$python2_venv|g" $vimrcPath
cd ..

cd vim_python3
pipenv --python 3
pipenv install pynvim
python3_venv=$(pipenv --venv)
sed -i "s|PYTHON3_VENV|$python3_venv|g" $vimrcPath
cd ..

#https://github.com/neovim/neovim/wiki/Installing-Neovim

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim

#vimPath="$cwd/../vim/.vim"
#create config path
mkdir -p $HOME/.config/nvim/autoload
##remove files if they already exist
rm -rf $HOME/.config/nvim

#Install plugin manager
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s $vimrcPath $HOME/.config/nvim/init.vim
nvim +PlugInstall +UpdateRemotePlugins +qall!

#create directories for vim (undo, swap, prev)
#mkdir ~/.vim/undo
#mkdir ~/.vim/swap
