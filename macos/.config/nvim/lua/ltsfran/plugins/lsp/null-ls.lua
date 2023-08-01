-- import null-ls plugin safely
local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- for conciseness
-- local formatting = null_ls.builtins.formatting -- to setup formatters
-- local diagnostics = null_ls.builtins.diagnostics -- to setup linters
-- -- local code_actions = null_ls.builtins.code_actions
-- --
-- local eslint_config = {
-- 	diagnostics_format = "[eslint] #{m}\n(#{c})",
-- 	-- prefer_local = "node_modules/.bin",
-- 	condition = function(utils)
-- 		-- return utils.root_has_file_matches(".eslintrc.*")
-- 		return utils.root_has_file({
-- 			".eslintrc",
-- 			".eslintrc.js",
-- 			".eslintrc.cjs",
-- 			".eslintrc.yaml",
-- 			".eslintrc.yml",
-- 			".eslintrc.json",
-- 		})
-- 	end,
-- }

-- configure null_ls
null_ls.setup({
	sources = {
		--  "formatting.prettier.with({disabled_filetypes = {}})" (see null-ls docs)
		-- formatting.prettier, -- js/ts formatter
		null_ls.builtins.formatting.stylua, -- lua formatter
		null_ls.builtins.diagnostics.eslint_d.with({
			diagnostics_format = "[eslint] #{m}\n(#{c})",
		}),
		null_ls.builtins.formatting.eslint_d,
		-- null_ls.builtins.diagnostics.eslint.with({
		-- 	diagnostics_format = "[eslint] #{m}\n(#{c})",
		-- }),
		-- null_ls.builtins.formatting.eslint,
		null_ls.builtins.diagnostics.fish,
		-- formatting.eslint_d.with(eslint_config),
		-- diagnostics.eslint_d.with(eslint_config),
		-- code_actions.eslint_d.with(eslint_config),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
	debug = true,
})

vim.api.nvim_create_user_command("DisableLspFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
