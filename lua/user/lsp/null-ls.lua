local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	vim.notify("null-ls not working")
	return
end

-- checkout the repo and the path
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- checkout the repo and the path
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

local sources = {
	-- javascript
	formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
	diagnostics.eslint,

	-- python
	formatting.black.with({ extra_args = { "--fast" } }),
	diagnostics.flake8,

	-- lua
	formatting.stylua,

	-- cpp
	formatting.clang_format,
	diagnostics.cppcheck,
}

null_ls.setup({
	debug = false,
	sources = sources,
})
