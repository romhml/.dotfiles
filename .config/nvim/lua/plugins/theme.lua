vim.opt.cursorline = true

local augroup = vim.api.nvim_create_augroup
local yank_group = augroup("HighlightYank", {})
local autocmd = vim.api.nvim_create_autocmd

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})

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

return {
	{
		"mellow-theme/mellow.nvim",
		priority = 1000,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			vim.g.mellow_italic_functions = true
			vim.g.mellow_transparent = true
			vim.cmd.colorscheme("mellow")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				section_separators = { left = "", right = "" },
			},
		},
	},
}
