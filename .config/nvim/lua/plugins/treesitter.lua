return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},

			textobjects = {
				select = {
					enable = true,
					lookahead = true,

					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
					},
					-- You can choose the select mode (default is charwise 'v')
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * method: eg 'v' or 'o'
					-- and should return the mode ('v', 'V', or '<c-v>') or a table
					-- mapping query_strings to modes.
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
				},
			},

			sync_install = true,
			auto_install = true,

			ensure_installed = {
				"vue",
				"css",
				"scss",
				"html",
				"javascript",
				"typescript",
				"python",
				"go",
				"lua",
				"rust",
				"bash",
				"vim",
				"yaml",
				"json",
				"toml",
			},
		},
	},

	"nvim-treesitter/nvim-treesitter-textobjects",
}
