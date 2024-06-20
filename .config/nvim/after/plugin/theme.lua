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
		mason = true,
		telescope = {
			enabled = true,
		},
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")

require("lualine").setup({
	options = {
		theme = "catppuccin",
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

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts)
	opts = opts or {}
	opts.border = opts.border or "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts)
end
require("lspconfig.ui.windows").default_options.border = "single"
