return {
	{
		"olimorris/codecompanion.nvim",
		lazy = false,
		opts = {
			strategies = {
				chat = { adapter = "anthropic" },
				inline = { adapter = "anthropic" },
				cmd = { adapter = "anthropic" },
			},
			display = {
				action_palette = {
					provider = "telescope",
				},
			},
			extensions = {
				mcphub = {
					callback = "mcphub.extensions.codecompanion",
					opts = {
						make_vars = true,
						make_slash_commands = true,
						show_result_in_chat = true,
					},
				},
			},
		},

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			{
				"ravitemer/mcphub.nvim",
				build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
				opts = {},
			},
		},

		keys = {
			{ "<leader>ai", "<CMD>CodeCompanionChat<CR>", mode = "n" },
			{ "<leader>ai", "<CMD>CodeCompanion<CR>", mode = "v" },
			{ "<leader>ag", "<CMD>Telescope codecompanion theme=dropdown previewer=false<CR>", mode = "n" },
		},
	},
}
