lspconfig = require("lspconfig")

cmp_nvim_lsp = require("cmp_nvim_lsp")

local km = vim.keymap

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	km.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	km.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	km.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	km.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	km.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	km.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	km.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	km.set("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	km.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	km.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	km.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	km.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local servers = { "html", "cssls", "rust_analyzer", "gopls", "tsserver", "zls" }

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		root_dir = function()
			return vim.loop.cwd()
		end,
	})
end

local capabilities_clang = cmp_nvim_lsp.default_capabilities()
capabilities_clang.offsetEncoding = "utf-8"
lspconfig["clangd"].setup({
	capabilities = capabilities_clang,
	on_attach = on_attach,
	root_dir = function()
		return vim.loop.cwd()
	end,
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = function()
		return vim.loop.cwd()
	end,
})

lspconfig["zls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = function()
		return vim.loop.cwd()
	end,
})

lspconfig["jdtls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = function()
		return vim.loop.cwd()
	end,
})

lspconfig.pylsp.settings = {
	-- Add any other settings here
	pylsp = {
		plugins = {
			pylint = {
				enabled = true,
				args = { "--disable=E203" },
			},
		},
	},
}

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
