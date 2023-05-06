local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"pyright",
	"rust_analyzer",
})

-- Activate poetry virtualenv automatically
local pyright_capabilities = vim.lsp.protocol.make_client_capabilities()
pyright_capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
lsp.configure("pyright", {
	on_new_config = function(config, root_dir)
		local env = vim.trim(vim.fn.system('cd "' .. root_dir .. '"; poetry env info -p 2>/dev/null'))
		if string.len(env) > 0 then
			config.settings.python.pythonPath = env .. "/bin/python"
		end
	end,
	capabilities = pyright_capabilities,
})

-- Format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

-- Setup null-ls
local null_opts = lsp.build_options("null-ls", {
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end,
						timeout_ms = 5000,
					})
				end,
			})
		end
	end,
})

-- Prettier with local node_modules
local command_resolver = require("null-ls.helpers.command_resolver")
local prettier = null_ls.builtins.formatting.prettier.with({
	dynamic_command = command_resolver.from_node_modules(),
})

-- Setup null-ls
null_ls.setup({
	on_attach = null_opts.on_attach,
	sources = {
		null_ls.builtins.diagnostics.eslint,
		prettier,

		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort.with({
			extra_args = { "--format", "black" },
		}),

		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
	},
})

-- Setup nvim-cmp.
local cmp = require("cmp")

vim.opt.pumheight = 7

local cmp_mappings = lsp.defaults.cmp_mappings()
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil
cmp_mappings["<CR>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	performance = {
		debounce = 200,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

require("luasnip.loaders.from_snipmate").lazy_load()

-- Setup lsp_zero.
lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

-- Mappings
vim.keymap.set("n", "<leader>gp", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>gv", ":vsplit | lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
