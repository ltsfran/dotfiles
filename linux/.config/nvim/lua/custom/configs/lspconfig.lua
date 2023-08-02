local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"html",
		"typescriptreact",
		"javascriptreact",
		"css",
		"sass",
		"scss",
		"less",
		"svelte",
	},
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	cmd = { "typescript-language-server", "--stdio" },
})
