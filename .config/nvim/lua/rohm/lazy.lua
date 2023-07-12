local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/playground",

	-- Gotta go fast
	"nathom/filetype.nvim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
	},

	-- Tree
	{
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		tag = "nightly",
	},

	-- Tmux
	{ "christoomey/vim-tmux-navigator" },

	-- Vim vue
	{ "posva/vim-vue" },

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },

			-- Formatting and Diagnostics
			{ "jose-elias-alvarez/null-ls.nvim" },
		},
	},

	-- Terraform
	"hashivim/vim-terraform",

	-- Git
	{
		"tpope/vim-fugitive",
		"lewis6991/gitsigns.nvim",
	},

	-- Better Undos
	"mbbill/undotree",

	-- Utils
	"vim-test/vim-test",
	"kassio/neoterm",
	"preservim/nerdcommenter",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-projectionist",
	"lukas-reineke/indent-blankline.nvim",

	-- Copilot
	"github/copilot.vim",

	-- Theme
	"shaunsingh/nord.nvim",
	"nvim-lualine/lualine.nvim",
	"nvim-tree/nvim-web-devicons",
})
