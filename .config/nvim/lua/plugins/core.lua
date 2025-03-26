return {
	-- Tmux
	"christoomey/vim-tmux-navigator",

	-- Better Undos
	{ "mbbill/undotree", keys = { { "<leader>u", "<CMD> UndotreeToggle <CR>" } } },

	-- Utils
	"tpope/vim-surround",
	"tpope/vim-abolish",
	"tpope/vim-repeat",
	"numToStr/Comment.nvim",
	"chentoast/marks.nvim",

	{ "norcalli/nvim-colorizer.lua", config = { "css", "javascript", "html", "vue" } },

	-- FS
	{
		"stevearc/oil.nvim",
		opts = {
			skip_confirm_for_simple_edits = true,
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
			},

			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = "actions.select",
				["<C-s>"] = { "actions.select", opts = { vertical = true } },
				["<C-p>"] = "actions.preview",
				["<C-c>"] = { "actions.close", mode = "n" },
				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = "actions.open_external",
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },
			},
			-- Set to false to disable all of the above keymaps
			use_default_keymaps = false,
		},
		keys = {
			{ "-", "<CMD>Oil<CR>" },
		},
	},
}
