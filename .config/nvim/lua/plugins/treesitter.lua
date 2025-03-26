return {
	"nvim-treesitter/nvim-treesitter-textobjects",

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
					init_selection = "<cr>",
					node_incremental = "<leader>ti",
					scope_incremental = "<leader>ts",
					node_decremental = "<leader>td",
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
}
