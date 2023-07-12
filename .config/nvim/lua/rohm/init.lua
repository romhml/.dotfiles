local set = vim.opt

require("rohm.mappings")
require("rohm.lazy")

-- Gotta go fast
vim.loader.enable()

-- Vertical split right
set.splitright = true
set.splitbelow = true

-- Persistent undo's
set.undofile = true
set.undodir = vim.fn.expand("~/.vim/undodir")

-- Mouse
set.mouse = "a"
set.mousemodel = "extend"

-- Line numbers
set.nu = true
set.relativenumber = true
set.signcolumn = "yes"
set.numberwidth = 3
set.scrolloff = 8

-- Indentation
set.tabstop = 2
set.shiftwidth = 2
set.autoindent = true
set.smartindent = true
set.expandtab = true

-- Folds
set.foldmethod = "indent"
set.foldenable = false

-- Hide buffers when abandoned (+confirm on quit)
set.hidden = true
set.confirm = true

-- Vertical help and git buffers
vim.api.nvim_create_autocmd("FileType", { pattern = { "git", "help" }, command = "wincmd L" })

-- Change to Directory of Current File
vim.api.nvim_create_user_command("CDC", "cd %:p:h", {})
