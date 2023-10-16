local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"volar",
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

-- lsp.configure("volar", {
-- 	default_config = {
-- 		filetypes = { "javascript", "typescript", "vue" }, -- Take over mode
-- 	},
-- })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettier" },
		vue = { "prettier" },
	},
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_fallback = true }
	end,
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

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

-- CVA
lsp.configure("tailwindcss", {
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
				},
			},
		},
	},
})
