require("options")
require("keymaps")

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
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			---@module "ibl"
			---@type ibl.config
			opts = {},
			config = function()
				require("ibl").setup()
			end,
		},
		{
			"ellisonleao/gruvbox.nvim",
			priority = 1000,
			config = true,
			opts = ...,
		},
		{
			"nvim-tree/nvim-tree.lua",
			version = "*",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				vim.g.loaded_netrw = 1
				vim.g.loaded_netrwPlugin = 1

				require("nvim-tree").setup()
			end,
		},
		{
			"romgrk/barbar.nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			init = function()
				vim.g.barbar_auto_setup = false
			end,
			opts = {
				auto_hide = 1,
			},
		},
		{
			"L3MON4D3/LuaSnip",
			event = "VeryLazy",
			config = function()
				require("luasnip.loaders.from_lua").load({ paths = "./snippets" })
			end,
		},
		{
			"mfussenegger/nvim-lint",
			config = function()
				local lint = require("lint")
				lint.linters_by_ft = {
					python = { "ruff" },
				}

				vim.api.nvim_create_autocmd({ "BufWritePost" }, {
					callback = function()
						lint.try_lint()
					end,
				})
			end,
		},
		{
			"mhartington/formatter.nvim",
			config = function()
				local formatter = require("formatter")

				local python_formatters = require("formatter.filetypes.python")
				local lua_formatters = require("formatter.filetypes.lua")
				local any_formatters = require("formatter.filetypes.any")

				formatter.setup({
					filetype = {
						python = { python_formatters.ruff },
						lua = { lua_formatters.stylua },
						["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
					},
				})

				vim.api.nvim_create_augroup("__formatter__", { clear = true })
				vim.api.nvim_create_autocmd("BufWritePost", {
					group = "__formatter__",
					command = ":FormatWrite",
				})
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				local configs = require("nvim-treesitter.configs")

				configs.setup({
					ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "html", "css", "rust" },
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
						},
					},
				})
			end,
		},
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
			},
			config = function()
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

				require("mason").setup()

				local mason_lspconfig = require("mason-lspconfig")
				mason_lspconfig.setup({
					ensure_installed = { "pyright", "luau_lsp" },
				})

				require("lspconfig")["pyright"].setup({
					capabilities = capabilities,
				})

				require("lspconfig")["luau_lsp"].setup({
					capabilities = capabilities,
				})
			end,
		},
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp-signature-help",
				"hrsh7th/cmp-path",
			},
			config = function()
				local has_words_before = function()
					unpack = unpack or table.unpack
					local line, col = unpack(vim.api.nvim_win_get_cursor(0))
					return col ~= 0
						and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
				end

				local cmp = require("cmp")
				local luasnip = require("luasnip")

				cmp.setup({
					snippet = {
						expand = function(args)
							luasnip.lsp_expand(args.body)
						end,
					},
					completion = {
						autocomplete = false,
					},
					mapping = cmp.mapping.preset.insert({
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
						["<CR>"] = cmp.mapping.confirm({ select = true }),
					}),
					sources = {
						{ name = "nvim_lsp" },
						{ name = "luasnip" },
						{ name = "nvim_lsp_signature_help" },
						{ name = "path" },
					},
				})
			end,
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "gruvbox" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

vim.cmd([[colorscheme gruvbox]])
