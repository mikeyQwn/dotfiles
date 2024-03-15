local ft = require("guard.filetype")

ft("lua"):fmt({ cmd = "stylua", args = { "-" }, stdin = true })
ft("typescript,javascript,typescriptreact,json,html,css"):fmt({
	cmd = "prettier",
	args = {
		"--tab-width=4",
		"--trailing-comma=es5",
	},
	fname = "true",
})
ft("python"):fmt("black")
ft("c,cpp"):fmt({
	cmd = "clang-format",
	args = {
		"-style={IndentWidth: 4, AllowShortFunctionsOnASingleLine: Empty}",
	},
})
ft("rust"):fmt({ cmd = "rustfmt", args = { "--edition", "2021", "--emit", "stdout" }, stdin = true })
ft("go"):fmt({
	cmd = "gofumpt",
	stdin = true,
})
ft("ocaml"):fmt({
	cmd = "ocamlformat",
	args = {
		"--enable-outside-detected-project",
	},
	fname = true,
})

require("guard").setup({
	-- fmt_on_save = true,
	lsp_as_default_formatter = false,
})

vim.api.nvim_create_autocmd({
	"BufWritePre",
}, {
	pattern = { "*.go" },
	callback = function()
		vim.lsp.buf.format()
	end,
})
