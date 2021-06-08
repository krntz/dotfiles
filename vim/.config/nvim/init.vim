call plug#begin('~/.local/share/nvim/site/autoload/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lifepillar/vim-gruvbox8'
call plug#end()

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
