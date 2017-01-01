#!/bin/bash
cwd=$(pwd)
gtkpath="$cwd/../gtk/gtk.css"
sshpath="$cwd/../ssh/config"

#tmux
#install it first
sudo apt-get install -y tmux ruby
sudo apt-get install vlock # for terminal locking

rm ~/.tmux.conf
ln -s $cwd/../tmux/.tmux.conf ~/.tmux.conf

#set up tmuxinator
#TODO: confirm with user interactively
sudo gem install tmuxinator
rm -rf ~/.tmuxinator
mkdir ~/.tmuxinator
ln -s $cwd/../tmux/.tmuxinator/gen.yml ~/.tmuxinator/gen.yml

#set up gtk config (for gnome terminal)
rm -rf ~/.config/gtk-3.0/gtk.css
ln -s $gtkpath ~/.config/gtk-3.0/gtk.css
#set up ssh config
echo "This will overwrite the existing ssh info. Manually remove ~/.ssh to run"
rm -rf ~/.ssh/config
mkdir ~/.ssh
ln -s $sshpath ~/.ssh/config
