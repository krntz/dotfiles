syntax on		" enable syntax processing

colorscheme flattened_dark

" fix tabs
set softtabstop=4
set shiftwidth=4
set expandtab

set relativenumber number
set showcmd

filetype plugin indent on

set wildmenu

set lazyredraw

set showmatch

set incsearch
set hlsearch

nnoremap <space><space> :nohlsearch<CR>

nnoremap j gj
nnoremap k gk

inoremap jk <esc>
