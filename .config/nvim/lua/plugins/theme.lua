vim.opt.cursorline = true

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

return {
	{
		"mellow-theme/mellow.nvim",
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

	"rrethy/vim-illuminate",
}
