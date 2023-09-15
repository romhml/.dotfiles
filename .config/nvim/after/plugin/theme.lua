vim.g.nord_disable_background = true
vim.opt.cursorline = true

require("nord").set()

vim.cmd([[
highlight @tag gui=bold guifg=#81A1C1
highlight @tag.delimiter gui=bold guifg=#616E88
highlight CopilotSuggestion guifg=#616E88 gui=italic,bold

set guifont=JetBrainsMono\ Nerd\ Font:h16
set fillchars+=vert:│
]])

require("lualine").setup({
	options = {
		theme = "nord",
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
