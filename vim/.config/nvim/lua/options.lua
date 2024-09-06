-- Basic
vim.opt.encoding = "utf-8"
vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a" -- allow mouse to be used

-- UI
vim.opt.background = "dark"
vim.opt.termguicolors = true

vim.opt.showmatch = true -- highlight matching brackets
vim.opt.scrolloff = 8
vim.opt.wildmenu = true
vim.opt.wildignore =
	"deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc"

vim.opt.list = false
vim.opt.foldenable = false
vim.opt.foldlevel = 4
vim.opt.foldmethod = "syntax"
vim.opt.wrap = true
vim.opt.colorcolumn = "80"
vim.opt.linebreak = true
vim.opt.eol = false
vim.opt.showbreak = "↪"

-- make split direction more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Sidebar
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.showcmd = true

-- Whitespace
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.formatoptions = "qnj1"

-- Search
vim.opt.incsearch = true -- show search matches while typing
vim.opt.hlsearch = true -- highlight search matches
vim.opt.ignorecase = true -- ignore case in search
vim.opt.smartcase = true -- override ignore when capital exists
