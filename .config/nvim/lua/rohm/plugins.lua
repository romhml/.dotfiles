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
		-- LSP Support
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Autocompletion
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",

		-- Snippets
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		-- Formatting
		"stevearc/conform.nvim",
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk)
				map("n", "<leader>hr", gs.reset_hunk)
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("n", "<leader>hS", gs.stage_buffer)
				map("n", "<leader>hu", gs.undo_stage_hunk)
				map("n", "<leader>hR", gs.reset_buffer)
				map("n", "<leader>hp", gs.preview_hunk)
				map("n", "<leader>hd", gs.diffthis)
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end)
				map("n", "<leader>td", gs.toggle_deleted)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
	},
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
	"tpope/vim-fugitive",

	-- Better Undos
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<CMD> UndotreeToggle <CR>" },
		},
	},

	-- Utils
	"tpope/vim-surround",
	"tpope/vim-abolish",
	"tpope/vim-repeat",
	{ "numToStr/Comment.nvim", opts = {}, lazy = false },
	{ "chentoast/marks.nvim", opts = {} },
	{
		"vimwiki/vimwiki",
		config = function()
			vim.api.nvim_create_autocmd("FileType", { pattern = "vimwiki", command = "silent! unmap <buffer> -" })
		end,
	},

	-- Copilot
	-- {
	-- 	"github/copilot.vim",
	-- 	keys = { "i" },
	-- 	config = function()
	-- 		vim.cmd([[
	--        let g:copilot_filetypes = {
	--          \ 'TelescopePrompt': v:false,
	--          \ }
	--      ]])
	-- 	end,
	-- },

	-- Theme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "echasnovski/mini.indentscope", opts = {} },
	"rrethy/vim-illuminate",

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
}, {
	ui = { border = "rounded" },
})
