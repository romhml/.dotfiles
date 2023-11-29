vim.opt.cursorline = true

vim.cmd([[
set guifont=JetBrainsMono\ Nerd\ Font:h16
set fillchars+=vert:│
]])

require("catppuccin").setup({
	flavour = "macchiato",
	transparent_background = true,
	show_end_of_buffer = true,

	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		mini = {
			enabled = true,
		},
		indent_blankline = {
			enabled = true,
		},
		mason = true,
		telescope = {
			enabled = true,
		},
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")

require("lualine").setup({
	options = {
		theme = "catppuccin",
		-- Hidding since it breaks intro screen
		-- Follow this issue for updates: https://github.com/nvim-lualine/lualine.nvim/issues/773
		-- section_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
})

local augroup = vim.api.nvim_create_augroup

local yank_group = augroup("HighlightYank", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 80,
		})
	end,
})
