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
		"nvim-telescope/telescope-live-grep-args.nvim",
	},

	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-h>"] = "which_key",
				},
			},
		},

		extensions = {
			live_grep_args = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob",
					"!**/.git/*",
					"--ignore-file",
					"**/.env*",
				},
			},
		},

		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false,
				find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
			},
			live_grep = {
				previewer = false,
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob",
					"!**/.git/*",
				},
			},
			buffers = { themes = "dropdown", previewer = false },
			git_files = { themes = "dropdown", previewer = false },
			-- git_branches = { themes = "dropdown", previewer = false },
		},
	},

	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("live_grep_args")
	end,

	keys = {
		{ "<leader>ff", "<CMD>Telescope find_files<CR>", mode = "n" },
		{ "<leader>fr", "<CMD>Telescope resume<CR>", mode = "n" },
		{ "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", mode = "n" },
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
