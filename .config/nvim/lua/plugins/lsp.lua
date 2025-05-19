return {
	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = { ui = { border = "rounded" } } },
			{ "williamboman/mason-lspconfig.nvim", opts = { automatic_enable = true } },
		},
	},
}
