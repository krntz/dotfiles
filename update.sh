#!/bin/bash

dotdir=$(pwd)

# TODO
# check if termux is needed

# delete old .files
rm ~/.vimrc
rm ~/.bashrc
rm ~/.gitconfig
rm ~/.ssh/config
rm -rf ~/.vim
rm -rf ~/.termux

# symlink new .files
ln -s $dotdir/vimrc ~/.vimrc
ln -s $dotdir/bashrc ~/.bashrc
ln -s $dotdir/gitconfig ~/.gitconfig
ln -s $dotdir/ssh/config ~/.ssh/config
ln -s $dotdir/vim ~/.vim
ln -s $dotdir/termux ~/.termux
