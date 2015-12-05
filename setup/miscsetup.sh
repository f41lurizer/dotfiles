#!/bin/bash
cwd=$(pwd)
gtkpath="$cwd/../gtk/gtk.css"

#remove files if they already exist
rm -rf ~/.config/gtk-3.0/gtk.css
ln -s $gtkpath ~/.config/gtk-3.0/gtk.css
