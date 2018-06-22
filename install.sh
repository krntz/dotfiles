#!/bin/bash

#TODO:
# dynamically load names of dotfiles
# check if dotfiles exist first
# check if termux is needed

# directories
dotdir=$(pwd)

# delete existing files
rm ~/.vimrc
rm ~/.bashrc
rm ~/.gitconfig
rm ~/.ssh/config
rm -rf ~/.vim
rm -rf ~/.termux

# symlink dotfiles
ln -s $dotdir/vimrc ~/.vimrc
ln -s $dotdir/bashrc ~/.bashrc
ln -s $dotdir/gitconfig ~/.gitconfig
ln -s $dotdir/ssh/config ~/.ssh/config
ln -s $dotdir/vim ~/.vim
ln -s $dotdir/termux ~/.termux
