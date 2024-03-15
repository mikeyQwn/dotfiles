local base = { "options", "colorscheme", "keymaps", "setup_plugins" }
local plugins = { "autopairs", "comment", "lualine", "cmp" }
local lsp = { "mason", "lspconfig", "guard", "lspsaga" }

for _, file in ipairs(base) do
	require(file)
end

for _, file in ipairs(plugins) do
	require("plugins." .. file)
end

for _, file in ipairs(lsp) do
	require("lsp." .. file)
end
