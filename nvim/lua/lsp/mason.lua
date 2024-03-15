mason = require("mason")
mason_lspconfig = require("mason-lspconfig")

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"emmet_ls",
		"rust_analyzer",
		"gopls",
		"clangd",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

