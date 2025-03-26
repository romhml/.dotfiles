vim.o.termguicolors = true
vim.o.winborder = "rounded"

require("config.lazy")
require("config.mappings")

vim.diagnostic.config({
	virtual_lines = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

vim.cmd([[
set guifont=JetBrainsMono\ Nerd\ Font:h16
set fillchars+=vert:│
]])

-- Gotta go fast
vim.loader.enable()

vim.o.wrap = true
vim.opt.showmode = false

vim.o.linebreak = true
-- Vertical split right
vim.o.splitright = true
vim.o.splitbelow = true

-- Persistent undo's
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.vim/undodir")

-- Mouse
vim.o.mouse = "a"
vim.o.mousemodel = "extend"

-- Line numbers
vim.o.nu = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.numberwidth = 3
vim.o.scrolloff = 8

-- Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true

-- Folds
vim.o.foldmethod = "indent"
vim.o.foldenable = false

-- Hide buffers when abandoned (+confirm on quit)
vim.o.hidden = true
vim.o.confirm = true

-- Shortmess
vim.o.shortmess = vim.o.shortmess .. "A"

-- Vertical help and git buffers
vim.api.nvim_create_autocmd("FileType", { pattern = { "git", "help" }, command = "wincmd L" })

-- Change to Directory of Current File
vim.api.nvim_create_user_command("CDC", "cd %:p:h", {})
