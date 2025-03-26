return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = "*",
		opts = {
			provider = "mistral", -- "claude" or "openai" or "azure"
			hints = { enabled = false },
			vendors = {
				mistral = {
					api_key_name = "MISTRAL_API_KEY",
					endpoint = "https://api.mistral.ai/v1/",
					model = "mistral-large-latest",
					__inherited_from = "openai",
				},
			},
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		-- Make sure to set this up properly if you have lazy=true
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			file_types = { "markdown", "Avante" },
		},
		ft = { "markdown", "Avante" },
	},
}
