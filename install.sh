#!/bin/bash

#TODO:
# dynamically load names of dotfiles
# check if dotfiles exist first

# directories
dotdir=$(pwd)

# delete existing files
rm -rf ~/.vimrc
rm -rf ~/.bashrc

# symlink dotfiles
ln -s $dotdir/vimrc ~/.vimrc
ln -s $dotdir/bashrc ~/.vimrc
