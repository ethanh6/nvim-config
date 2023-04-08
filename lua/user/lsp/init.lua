require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-tool-installer").setup({
	ensure_installed = { "stylua", "shfmt", "shellcheck", "black", "isort", "prettierd" },
	auto_update = false,
	run_on_start = true,
})

require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "rust_analyzer" },
})

require("user.lsp.null-ls")
require("user.lsp.handlers").setup()
