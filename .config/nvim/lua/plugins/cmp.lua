return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts_extend = { "sources.default" },
	opts = {
		completion = {
			ghost_text = {
				enabled = false,
				show_with_menu = false,
			},
			menu = { auto_show = false, border = "rounded" },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = { border = "rounded" },
			},
		},

		signature = { window = { border = "single" } },

		keymap = {
			preset = "default",
			["<C-n>"] = {
				"show",
				"select_next",
			},
		},
	},
}
