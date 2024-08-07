call plug#begin('~/.local/share/nvim/site/autoload/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
call plug#end()

set background=dark
set termguicolors
colorscheme gruvbox



"set novisualbell
set number 
set relativenumber
set showmatch " highlight matching brackets/parenthesis/whatever

" fix tabs
set softtabstop=4
set shiftwidth=4
set expandtab

set numberwidth=3
set showcmd " show partially entered commands

""" CODING

" enable syntax highlighting
syntax on
set autoindent
filetype plugin indent on " auto-detect file types for indents etc.

" Python
let g:ale_fix_on_save = 1

" Rust
let g:rustfmt_autosave = 1

set wildmenu " make command completion good

set lazyredraw " update the screen only when needed

" search
set incsearch " show search matches while typing
set hlsearch " highlight search matches
set ignorecase " ignore case in search
set smartcase " override ignore when capital exists

nnoremap <space><space> :nohlsearch<CR> " turn off search highlight

" make moving through soft line breaks not horrible
nnoremap j gj
nnoremap k gk

inoremap jk <esc> " easy escape from input mode

" scroll when there are 8 lines left to margin
set scrolloff=8

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

" make split direction more natural
set splitbelow
set splitright

" make split navigation a bit easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
