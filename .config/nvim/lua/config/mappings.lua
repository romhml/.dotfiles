vim.keymap.set("n", "<ESC>", "<cmd> noh <CR>")
vim.keymap.set("n", "Y", "y$")

-- Keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Buffer control
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("n", "<leader>D", '"_D')

-- Keep cursor centered on search and J jumps
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- Undo breaking point
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")
vim.keymap.set("i", ":", ":<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "/", "/<c-g>u")

-- Move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Buffer control
vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>y", '"+y')

-- Command line mode arrows mappings
vim.keymap.set("c", "<C-l>", "<Right>")
vim.keymap.set("c", "<C-h>", "<Left>")
vim.keymap.set("c", "<C-j>", "<Down>")
vim.keymap.set("c", "<C-k>", "<Up>")

-- Remap terminal mode
vim.keymap.set("t", "<C-o>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")

-- Quickfix
vim.keymap.set("n", "]q", ":cnext<CR>")
vim.keymap.set("n", "[q", ":cprev<CR>")
