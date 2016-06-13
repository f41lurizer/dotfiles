#!/bin/bash
cwd=$(pwd)
bashrcPath="$cwd/../bash/.bashrc"
#remove files if they already exist
rm -rf ~/.bashrc
ln -s $bashrcPath ~/.bashrc
