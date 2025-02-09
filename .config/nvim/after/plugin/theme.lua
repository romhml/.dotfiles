vim.opt.cursorline = true

vim.cmd([[
set guifont=JetBrainsMono\ Nerd\ Font:h16
set fillchars+=vert:│
]])

vim.cmd.colorscheme("mellow")

require("lualine").setup({
	options = {
		theme = "mellow",
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
