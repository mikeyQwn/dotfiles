require("nvim-autopairs").setup({
    check_ts = true,
    ts_config = {
        lua = { "string" },
        javascipt = { "template_string" },
        java = false,
    },
})
