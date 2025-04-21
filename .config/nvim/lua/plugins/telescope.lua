vim.api.nvim_create_autocmd("User", {
	pattern = "TelescopeFindPre",
	callback = function()
		vim.opt_local.winborder = "none"
		vim.api.nvim_create_autocmd("WinLeave", {
			once = true,
			callback = function()
				vim.opt_local.winborder = "rounded"
			end,
		})
	end,
})

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-h>"] = "which_key",
				},
			},
		},

		pickers = {
			find_files = { theme = "dropdown", previewer = false },
			buffers = { themes = "dropdown", previewer = false },
			git_files = { themes = "dropdown", previewer = false },
			-- git_branches = { themes = "dropdown", previewer = false },
		},
	},

	keys = {
		{ "<leader>ff", "<CMD>Telescope find_files<CR>", mode = "n" },
		{ "<leader>fg", "<CMD>Telescope live_grep<CR>", mode = "n" },
		{ "<leader>fh", "<CMD>Telescope help_tags<CR>", mode = "n" },
		{ "<leader>fm", "<CMD>Telescope marks<CR>", mode = "n" },
		{ "<leader>fd", "<CMD>Telescope diagnostics<CR>", mode = "n" },
		{ "<leader>fo", "<CMD>Telescope oldfiles<CR>", mode = "n" },
		{ "<leader>fk", "<CMD>Telescope keymaps<CR>", mode = "n" },
		{ "<leader>gs", "<CMD>Telescope git_status<CR>", mode = "n" },
		{ "<leader>gc", "<CMD>Telescope git_commits<CR>", mode = "n" },
		{ "<leader>gb", "<CMD>Telescope git_branches<CR>", mode = "n" },
		{ "<leader>gf", "<CMD>Telescope git_files<CR>", mode = "n" },
	},
}
