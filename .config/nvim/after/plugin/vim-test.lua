vim.g["test#python#runner"] = "pytest"
vim.g["test#strategy"] = "neoterm"
vim.g["test#neovim#term_position"] = "vert botright 50"

vim.g.neoterm_default_mod = "botright vertical"
vim.g.neoterm_default_mod = "botright vertical"

vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", {})
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", {})
vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>", {})
vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", {})
vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", {})
