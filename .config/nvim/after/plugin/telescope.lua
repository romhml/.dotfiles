require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key",
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
			theme = "dropdown",
		},

		buffers = {
			themes = "dropdown",
			previewer = false,
		},

		git_files = {
			themes = "dropdown",
			previewer = false,
		},

		git_branches = {
			themes = "dropdown",
			previewer = false,
		},

		git_commits = {
			themes = "dropdown",
			previewer = false,
		},

		git_status = {},
	},
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})

vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
