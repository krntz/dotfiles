call plug#begin('~/.local/share/nvim/site/autoload/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'dense-analysis/ale'
Plug 'fladson/vim-kitty'
call plug#end()

set background=dark
colorscheme gruvbox

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
