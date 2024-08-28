-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { 'ellisonleao/gruvbox.nvim', 
            priority = 1000, 
            config = true, 
            opts = ... },
        { "L3MON4D3/LuaSnip", event = "VeryLazy",
            config = function()
                require("luasnip.loaders.from_lua").load({paths = "./snippets"})
            end
        },
        {"nvim-treesitter/nvim-treesitter", 
            build = ":TSUpdate",
            config = function()
                local configs = require("nvim-treesitter.configs")

                configs.setup({
                    ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "html", "css", "rust"},
                    auto_install = false,
                    highlight = { enable = true },
                    indent = { enable = true },
                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            init_selection = "<C-n>",
                            node_incremental = "<C-n>",
                            scope_incremental = "<C-s>",
                            node_decremental = "<C-m>",
                        }
                    }
                })
            end
        },
        { "neovim/nvim-lspconfig",
            dependencies = {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim" 
            },
            config = function()
                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

                require('mason').setup()
                local mason_lspconfig = require 'mason-lspconfig'
                mason_lspconfig.setup {
                    ensure_installed = { "pyright" }
                }
                require("lspconfig")['pyright'].setup {
                    capabilities = capabilities,
                }
            end
        },
        { "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp-signature-help",
                "hrsh7th/cmp-path"
            },
            config = function()
                local has_words_before = function()
                    unpack = unpack or table.unpack
                    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                end

                local cmp = require('cmp')
                local luasnip = require('luasnip')

                cmp.setup({
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end
                    },
                    completion = {
                        autocomplete = false
                    },
                    mapping = cmp.mapping.preset.insert ({
                        ["<Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            elseif has_words_before() then
                                cmp.complete()
                            else
                                fallback()
                            end
                        end, { "i", "s" }),
                        ["<s-Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end, { "i", "s" }),
                        ["<c-e>"] = cmp.mapping.abort(),
                        ["<CR>"] = cmp.mapping.confirm({ select=true }),
                    }),
                    sources = {
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "nvim_lsp_signature_help" },
                        { name = "path" },
                    }
                })
            end
        },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "gruvbox" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

-- Basic
vim.opt.encoding = "utf-8"
vim.opt.backspace = "indent,eol,start"

-- make moving through soft line breaks better
vim.api.nvim_set_keymap(
    "n",
    "j",
    "gj",
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "k",
    "gk",
    { noremap = true }
)

-- easy escape from input mode
vim.api.nvim_set_keymap(
    "i",
    "jk",
    "<esc>",
    { noremap = true }
)

-- Display
vim.opt.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.opt.termguicolors = true

vim.opt.showmatch = true -- highlight matching brackets
vim.opt.scrolloff = 8
vim.opt.wildmenu = true
vim.opt.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'

vim.opt.list = false
vim.opt.foldenable = false
vim.opt.foldlevel = 4
vim.opt.foldmethod = 'syntax'
vim.opt.wrap = false
vim.opt.eol = false
vim.opt.showbreak= '↪'

-- make split direction more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

-- make split navigation easier
vim.api.nvim_set_keymap(
    "n",
    "<C-J>",
    "<C-W><C-J>",
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<C-K>",
    "<C-W><C-K>",
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<C-L>",
    "<C-W><C-L>",
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<C-H>",
    "<C-W><C-H>",
    { noremap = true }
)

-- Sidebar
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.showcmd = true

-- Search
vim.opt.incsearch = true -- show search matches while typing
vim.opt.hlsearch = true -- highlight search matches
vim.opt.ignorecase = true -- ignore case in search
vim.opt.smartcase = true -- override ignore when capital exists

-- turn off search highlight
vim.api.nvim_set_keymap(
    "n",
    "<leader><leader>",
    ":nohlsearch<CR>",
    { noremap = true }
)

-- Whitespace
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.formatoptions = 'qnj1'
