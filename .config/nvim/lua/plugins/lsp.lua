vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set("n", "grp", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "grd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "grv", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)

		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = args.buf, -- Scope to this buffer
				callback = function()
					vim.lsp.buf.document_highlight()
				end,
			})

			vim.api.nvim_create_autocmd("CursorMoved", {
				buffer = args.buf, -- Scope to this buffer
				callback = function()
					vim.lsp.buf.clear_references()
				end,
			})
		end
	end,
})

vim.opt.updatetime = 500

return {
	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = { border = "rounded" },
				},
			},
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					automatic_enable = true,
					ensure_installed = {
						"ts_ls",
						"vue_ls",
						"lua_ls",
						"rust_analyzer",
						"pyright",
						"bashls",
						"jsonls",
						"yamlls",
					},
				},
			},
		},
		lazy = false,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
		},
	},
}
