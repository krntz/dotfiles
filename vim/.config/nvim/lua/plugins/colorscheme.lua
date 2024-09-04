return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin-frappe]])

			require("catppuccin").setup({
				integrations = {
					cmp = true,
					nvimtree = true,
					treesitter = true,
                    barbar = true,
				},
			})
		end,
	},
}
