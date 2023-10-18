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
	-- Treesiter
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/playground",

	-- Gotta go fast
	"nathom/filetype.nvim",
	"dstein64/vim-startuptime",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Tmux
	"christoomey/vim-tmux-navigator",

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",

			-- Snippets
			"L3MON4D3/LuaSnip",

			-- Formatting
			{ "stevearc/conform.nvim" },
		},
	},

	-- Git
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>gG", "<CMD> LazyGit <CR>" },
		},
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			vim.g.gitblame_delay = 1000
		end,
	},

	-- Better Undos
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<CMD> UndotreeToggle <CR>" },
		},
	},

	-- Utils
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"lukas-reineke/indent-blankline.nvim",
	{ "echasnovski/mini.comment", opts = {} },

	-- Copilot
	{
		"github/copilot.vim",
		keys = { "i" },
		config = function()
			vim.cmd([[
        let g:copilot_filetypes = {
          \ 'TelescopePrompt': v:false,
          \ }
      ]])
		end,
	},

	-- Theme
	"shaunsingh/nord.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",

	"rrethy/vim-illuminate",
	{ "echasnovski/mini.indentscope", opts = {} },

	-- FS
	{
		"stevearc/oil.nvim",
		opts = {
			skip_confirm_for_simple_edits = true,
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
			},
		},
		keys = {
			{ "<leader>b", "<CMD> Oil --float <CR>" },
			{ "-", "<CMD>Oil<CR>" },
		},
	},
})
