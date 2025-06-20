-- Set project-specific shada file
local cwd = vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(cwd, ":t")
local shada_dir = vim.fn.stdpath("data") .. "/shada"
-- Create shada directory if it doesn't exist
vim.fn.mkdir(shada_dir, "p")
local shada_file = shada_dir .. "/" .. project_name .. ".shada"
vim.opt.shadafile = shada_file

-- Function to toggle mark (create or jump)local function toggle_mark()
-- Get character input from user
local function toggle_mark()
	local success, char = pcall(vim.fn.getchar)
	if not success then
		return
	end

	local input = string.char(char)
	-- Validate input is a letter (valid mark character)
	if not input:match("[a-zA-Z]") then
		vim.cmd("normal! m" .. input)
		return
	end

	-- Get mark position and check if it exists
	local mark_pos = vim.fn.getpos("'" .. input)
	local mark_exists = mark_pos[2] > 0 -- line number > 0 means mark exists

	if mark_exists then
		-- Jump to existing mark
		vim.cmd("normal! '" .. input)
	else
		-- Create new mark at current position
		vim.cmd("normal! m" .. input)
	end
end

vim.keymap.set("n", "m", toggle_mark)

return {
	"chentoast/marks.nvim",
	opts = {
		default_mappings = true,
		force_write_shada = true,
		refresh_screen_after_jump = false,
		mappings = {
			set = false,
		},
	},
}
