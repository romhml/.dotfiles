vim.g.nord_disable_background = true
vim.opt.cursorline = true

-- require("nord").set()

vim.cmd([[
highlight @tag gui=bold guifg=#81A1C1
highlight @tag.delimiter gui=bold guifg=#616E88
highlight CopilotSuggestion guifg=#616E88 gui=italic,bold
]])

vim.cmd([[
set guifont=JetBrainsMono\ Nerd\ Font:h16
set fillchars+=vert:│
]])

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	transparent_background = true, -- disables setting the background color.
	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		mini = {
			enabled = true,
		},
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")

require("lualine").setup({
	options = {
		component_separators = "",
		section_separators = { left = "", right = "" },
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
