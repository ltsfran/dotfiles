local plugins = {
	{
		"vim-crystal/vim-crystal",
		ft = "crystal",
		config = function(_)
			vim.g.crystal_auto_format = 1
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"typescript-language-server",
				"html-lsp",
				"css-lsp",
				"tailwindcss-language-server",
				"emmet-ls",
				"yaml-language-server",
				"eslint_d",
				"prettier",
				"stylua",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
			},
			autotag = { enable = true },
			auto_install = true,
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		},
	},
	{
		"windwp/nvim-ts-autotag",
		lazy = false,
	},
}

return plugins
