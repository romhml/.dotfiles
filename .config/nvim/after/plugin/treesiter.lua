require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
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
	sync_install = true,
	auto_install = true,

	highlight = {
		enable = true,
	},
})
