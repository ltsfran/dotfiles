local M = {}

M.general = {
	i = {
		["jk"] = { "<ESC>" },
	},
	n = {
		["<leader>sv"] = { "<C-w>v" },
		["<leader>sh"] = { "<C-w>s" },
		["<leader>se"] = { "<C-w>=" },
		["<leader>sx"] = { ":close<CR>" },
		["<leader>sm"] = { ":MaximizerToggle<CR>" },
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
	},
}

return M
