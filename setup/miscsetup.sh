#!/bin/bash
cwd=$(pwd)
gtkpath="$cwd/../gtk/gtk.css"
sshpath="$cwd/../ssh/config"

#set up tmux
rm ~/.tmux.conf
ln -s $cwd/../tmux/.tmux.conf ~/.tmux.conf

#set up gtk config (for gnome terminal)
rm -rf ~/.config/gtk-3.0/gtk.css
ln -s $gtkpath ~/.config/gtk-3.0/gtk.css
#set up ssh config
rm -rf ~/.ssh/config
ln -s $sshpath ~/.ssh/config
