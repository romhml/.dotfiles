return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			ui = { enable = false },
			workspaces = {
				{ name = "Notes", path = "~/.obsidian/Notes" },
			},
		},
		keys = {
			{ "<leader>nf", "<CMD>ObsidianQuickSwitch<CR>" },
			{ "<leader>ng", "<CMD>ObsidianSearch<CR>" },
			{ "<leader>nt", "<CMD>ObsidianTags<CR>" },
			{ "<leader>nd", "<CMD>ObsidianToday<CR>" },
		},
	},
}
