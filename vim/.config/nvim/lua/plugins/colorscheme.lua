return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				integrations = {
					cmp = true,
					nvimtree = true,
					treesitter = true,
					barbar = true,
                    mason = true,
				},
			})
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}
