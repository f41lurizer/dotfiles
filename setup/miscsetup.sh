#!/bin/bash
cwd=$(pwd)
gtkpath="$cwd/../gtk/gtk.css"
sshpath="$cwd/../ssh/config"

#set up gtk config (for gnome terminal)
rm -rf ~/.config/gtk-3.0/gtk.css
ln -s $gtkpath ~/.config/gtk-3.0/gtk.css
#set up ssh config
# echo "This will overwrite the existing ssh info. Manually remove ~/.ssh to run"
# rm -rf ~/.ssh/config
# mkdir ~/.ssh
# ln -s $sshpath ~/.ssh/config
