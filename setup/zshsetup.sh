#!/bin/bash
#install zsh
sudo apt install -y zsh fonts-powerline curl 
cwd=$(pwd)
zshrcPath="$cwd/../zsh/.zshrc"
cd $HOME
#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#install spaceship
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

#install the .zshrc
#remove files if they already exist
ln -fs $zshrcPath
