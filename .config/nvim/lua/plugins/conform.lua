return {
	"stevearc/conform.nvim",
	opts = function()
		-- Format disable command for Conform
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})

		-- Format enable command for Conform
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})

		return {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettier", "eslint_d" },
				vue = { "prettier", "eslint_d" },
				html = { "prettier", "eslint_d" },
				htmldjango = { "prettier" },
				typescript = { "prettier", "eslint_d" },
				typescriptreact = { "prettier", "eslint_d" },
			},
			format_after_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { lsp_fallback = false }
			end,

			formatters = {
				prettier = {
					require_cwd = true,
					cwd = require("conform.util").root_file({
						".prettierrc",
						".prettierrc.json",
						".prettierrc.yml",
						".prettierrc.yaml",
						".prettierrc.json5",
						".prettierrc.js",
						".prettierrc.cjs",
						".prettierrc.mjs",
						".prettierrc.toml",
						"prettier.config.js",
						"prettier.config.cjs",
						"prettier.config.mjs",
					}),
				},
				eslint = {
					-- cwd means "config working directory"
					require_cwd = true,
					cwd = require("conform.util").root_file({
						"eslint.config.js",
						"eslint.config.cjs",
						"eslint.config.mjs",
					}),
				},
			},
		}
	end,
}
