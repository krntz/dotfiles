call plug#begin('~/.local/share/nvim/site/autoload/plugged')
Plug 'junegunn/goyo.vim'
call plug#end()

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
