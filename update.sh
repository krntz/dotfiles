#!/bin/bash

dotdir=$(pwd)

# delete old .files
rm ~/.vimrc
rm ~/.bashrc

# symlink new .files
ln -s $dotdir/vimrc ~/.vimrc
ln -s $dotdir/bashrc ~/.bashrc
