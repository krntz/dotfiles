#!/bin/bash

#TODO:
# dynamically load names of dotfiles
# check if dotfiles exist first

# directories
dotdir=$(pwd)

# delete existing files
rm ~/.vimrc
rm ~/.bashrc

# symlink dotfiles
ln -s $dotdir/vimrc ~/.vimrc
ln -s $dotdir/bashrc ~/.vimrc

# make sure vim has the correct colorscheme
mkdir -p ~/.vim/color

wget https://github.com/romainl/flattened/raw/master/colors/flattened_dark.vim
mv flattened_dark.vim ~/.vim/color
