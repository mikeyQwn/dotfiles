require("tokyonight").setup({
	transparent = true,
	on_highlights = function(highlights, c)
		local lineNrColor = "#90B3EC"
		local currLineNrColor = "#51B3EC"
		local commentColor = "#746DBF"

		highlights.LineNrAbove = { fg = lineNrColor }
        highlights.LineNr = { fg = currentLineNrColor, bold = true}
        highlights.LineNrBelow = { fg = lineNrColor } 
		highlights.Comment = { fg = commentColor } 
	end,
})

vim.cmd([[colorscheme tokyonight]])

