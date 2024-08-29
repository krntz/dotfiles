return {
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
}
