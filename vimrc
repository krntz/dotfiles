" enable syntax highlighting
syntax on

" make comments italicized and use monochrome colorscheme
let g:monochrome_italic_comments = 1
colorscheme monochrome

" fix tabs
set softtabstop=4
set shiftwidth=4
set expandtab

set relativenumber number " current line number as well as relative line numbers
set numberwidth=3
set showcmd " show partially entered commands

filetype plugin indent on " auto-detect filetypes for indents etc.

set wildmenu " make command completion good

set lazyredraw " update the screen only when needed

set showmatch " highlight matching brackets/parenthesis/whatever


set incsearch " show search matches while typing
set hlsearch " highlight search matches

nnoremap <space><space> :nohlsearch<CR> " turn off search highlight

" make moving through soft linebreaks not horrible
nnoremap j gj
nnoremap k gk

inoremap jk <esc> " easy escape from input mode
