local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Run packer when saving this file
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost setup_plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim") -- For plugins to work

	-- No setup --
	use("tpope/vim-surround") -- Surround with ys, ds, cs
	use("folke/tokyonight.nvim") -- Colorscheme
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.5" }) -- Telescope

	-- Setup --
	use("numToStr/Comment.nvim") -- Gc to comment
	use("windwp/nvim-autopairs") -- Bracket autopairs
	use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } })

	use({
		"hrsh7th/nvim-cmp",
		-- config = [[require('config.nvim-cmp')]],
		requires = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-omni",
		},
	})
	use("onsails/lspkind.nvim")
	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
		run = "make install_jsregexp",
	}) -- Snippet engine
	use("saadparwaiz1/cmp_luasnip") -- For autocompletion
	use("rafamadriz/friendly-snippets")

	-- Lsp --
	use("neovim/nvim-lspconfig") -- For easy lsp configs
	use("williamboman/mason.nvim") -- For easy lsp installs
	use("williamboman/mason-lspconfig.nvim") -- Bridges gap b/w mason & lspconfig
	use({
		"nvimdev/guard.nvim",
		requires = {
			"nvimdev/guard-collection",
		},
	})
	use("instant-markdown/vim-instant-markdown")
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
