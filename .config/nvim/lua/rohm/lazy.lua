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
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- Tmux
	{ "christoomey/vim-tmux-navigator" },

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
	{ "hashivim/vim-terraform", ft = "terraform" },

	-- Git
	{
		"tpope/vim-fugitive",
		"lewis6991/gitsigns.nvim",
	},

	-- Better Undos
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", "<cmd> UndotreeToggle <CR>")
		end,
	},

	-- Utils
	{ "vim-test/vim-test", keys = { "<leader>tn", "<leader>ts", "<leader>tf" } },
	{ "kassio/neoterm" },
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"lukas-reineke/indent-blankline.nvim",
	"echasnovski/mini.comment",

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
	"nvim-lualine/lualine.nvim",
	"rrethy/vim-illuminate",
	{ "echasnovski/mini.indentscope", opts = {} },

	-- Tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			filesystem = {
				list = {
					follow_current_file = {
						enable = true,
					},
				},
			},
		},
	},

	-- Trying out

	{ "echasnovski/mini.surround", opts = {} },
	{ "echasnovski/mini.ai", opts = {} },
})
