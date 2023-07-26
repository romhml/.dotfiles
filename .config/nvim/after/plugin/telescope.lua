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
			hidden = true,
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

	extensions = {
		file_browser = {
			theme = "ivy",
			previewer = false,
			hijack_netrw = true,
			auto_depth = false,
			display_stat = { size = true, mode = true },
			prompt_path = true,
			hidden = true,
			respects_gitignore = false,
		},
	},
})

local builtin = require("telescope.builtin")
require("telescope").load_extension("file_browser")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})

vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})

vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR><ESC>", { noremap = true })
