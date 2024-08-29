local opts = {
	noremap = true,
	silent = true,
}
-- make moving through soft line breaks better
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", ops)

-- easy escape from input mode
vim.keymap.set("i", "jk", "<esc>", opts)

-- make split navigation easier
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", opts)
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", opts)
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", opts)
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", opts)

-- turn off search highlight
vim.keymap.set("n", "<leader><leader>", ":nohlsearch<CR>", opts)
