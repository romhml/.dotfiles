return {
	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						border = "rounded",
					},
				},
			},
			{ "williamboman/mason-lspconfig.nvim", config = function() end },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- Ensure the servers are installed
			mason_lspconfig.setup({
				ensure_installed = {
					"ts_ls",
					"volar",
					"tailwindcss",
					"lua_ls",
				},
			})

			-- LSP settings
			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set("n", "<leader>gp", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<leader>gv", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)
				vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
			end

			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts)
				opts = opts or {}
				opts.border = opts.border or "rounded"
				return orig_util_open_floating_preview(contents, syntax, opts)
			end

			-- Volar setup
			local mason_registry = require("mason-registry")
			local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server"

			-- Server-specific settings
			local servers = {
				ts_ls = {
					init_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = vue_language_server_path,
								languages = { "vue" },
							},
						},
					},
				},
				volar = {
					capabilities = cmp_nvim_lsp.default_capabilities(),
					init_options = {
						vue = {
							hybridMode = false,
						},
					},
				},
				tailwindcss = {
					settings = {
						tailwindCSS = {
							experimental = {
								classRegex = {
									{ "cva\\(((?:|\\([^()]*\\))*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
									{ "cx\\(((?:[^()]|\\([^()]*\\))*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
									{ 'ui="\\s*{([^)]*)\\s*}"', "(?:'|\"|`)([^']*)(?:'|\"|`)" },
									{ "ui:\\s*{([^)]*)\\s*}", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
								},
							},
							lint = {
								cssConflict = "warning",
								invalidApply = "error",
								invalidConfigPath = "error",
								invalidScreen = "error",
								invalidTailwindDirective = "error",
								invalidVariant = "error",
								recommendedVariantOrder = "warning",
							},
							validate = true,
						},
					},
				},
				lua_ls = {
					on_init = function(client)
						client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
							runtime = { version = "LuaJIT" },
							workspace = {
								checkThirdParty = false,
								library = { vim.env.VIMRUNTIME },
							},
						})
					end,
					settings = {
						Lua = {},
					},
				},
			}

			-- Setup the servers
			mason_lspconfig.setup_handlers({
				function(server_name)
					local server_opts = servers[server_name] or {}
					server_opts.on_attach = on_attach
					lspconfig[server_name].setup(server_opts)
				end,
			})
		end,
	},
}
