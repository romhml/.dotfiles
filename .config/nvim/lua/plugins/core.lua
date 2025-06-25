return {
	"takac/vim-hardtime",

	-- Tmux
	"christoomey/vim-tmux-navigator",

	-- Better Undos
	{ "mbbill/undotree", keys = { { "<leader>u", "<CMD> UndotreeToggle <CR>" } } },

	-- Utils
	"tpope/vim-abolish",
	"tpope/vim-repeat",

	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
		},
	},
	"numToStr/Comment.nvim",

	{ "norcalli/nvim-colorizer.lua", opts = { "css", "javascript", "html", "vue" } },

	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		dependencies = {
			"saghen/blink.cmp",
		},
		opts = {
			preview = {
				enable = true,
				filetypes = { "markdown", "codecompanion" },
			},
		},
	},

	{
		"stevearc/quicker.nvim",
		event = "FileType qf",
		opts = {},
	},

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

	{
		"3rd/image.nvim",
		build = false,
		opts = {
			backend = "kitty",
			processor = "magick_cli", -- or "magick_rock"
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
				},
			},
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
