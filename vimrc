syntax on		" enable syntax processing

colorscheme flattened_dark

set tabstop=4		" number of visual spaces per TAB
set softtabstop=4	" number of spaces in tab when editing
set expandtab

set relativenumber
set showcmd

filetype indent on

set wildmenu

set lazyredraw

set showmatch

set incsearch
set hlsearch

nnoremap <leader><space> :nohlsearch<CR>

nnoremap j gj
nnoremap k gk

inoremap jk <esc>
