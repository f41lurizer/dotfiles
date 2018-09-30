#!/bin/bash
cwd=$(pwd)
#tmux
#install it first
sudo apt-get install -y tmux 
sudo apt-get install vlock # for terminal locking

rm ~/.tmux.conf
ln -s $cwd/../tmux/.tmux.conf ~/.tmux.conf

#set up oh-my-tmux
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp $cwd/../tmux/.tmux.conf.local .
