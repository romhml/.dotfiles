return {
	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = { ui = { border = "rounded" } } },
			{ "williamboman/mason-lspconfig.nvim", config = function() end },
		},

		opts = {
			servers = {
				ts_ls = {
					filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
			},
		},

		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			-- Ensure the servers are installed
			mason_lspconfig.setup({
				ensure_installed = {
					"ts_ls",
					"volar",
					"tailwindcss",
					"lua_ls",
				},
			})

			-- Volar setup
			local mason_registry = require("mason-registry")
			local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server"

			opts.servers.ts_ls.init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = vue_language_server_path,
						languages = { "vue" },
					},
				},
			}

			-- Setup the servers
			mason_lspconfig.setup_handlers({
				function(server_name)
					local config = opts.servers[server_name] or {}
					lspconfig[server_name].setup(config)
				end,
			})
		end,
	},
}
