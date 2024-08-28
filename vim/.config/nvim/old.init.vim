call plug#begin('~/.local/share/nvim/site/autoload/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'dense-analysis/ale'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

colorscheme gruvbox



"set novisualbell

set showcmd " show partially entered commands

filetype plugin indent on " auto-detect file types for indents etc.

" for writing LaTeX on MacOS
command! -nargs=? Silent
            \ execute 'silent ! <args>'
            \ | redraw!

map <F4> :Silent xelatex % && open -a Preview && open -a iTerm

" spell check settings
map <F5> :setlocal spell<CR>
set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add

" copy selected text to system clipboard
vnoremap <C-c> "*Y :let @+=@*<CR>
nnoremap <C-p> "+P

" Goyo and Limelight
map <F6> :Goyo<CR>
autocmd! User GoyoEnter Limelight
"autocmd! User GoyoEnter :setlocal spell
autocmd! User GoyoLeave Limelight!
