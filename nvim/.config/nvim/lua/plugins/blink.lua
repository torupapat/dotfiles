return {
	"Saghen/blink.cmp",
	lazy = false, -- Completion should always be ready
	dependencies = { "rafamadriz/friendly-snippets" },

	-- 2026 Rust Build: This compiles the high-performance core
	build = "cargo build --release",

	init = function()
		vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/blink.cmp")
	end,

	opts = {
		-- 'default' for mappings similar to nvim-cmp
		-- 'super-tab' for those who like Tab-based logic
		keymap = { preset = "default" },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		-- Completion Menu Aesthetics (The "Pill" look)
		completion = {
			menu = { border = "rounded" },
			documentation = { window = { border = "rounded" }, auto_show = true },
			ghost_text = { enabled = true }, -- Shows the suggestion in gray as you type
		},

		-- Logic: Where the data comes from
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		-- Experimental: Signature help (parameter hints)
		signature = { enabled = true, window = { border = "rounded" } },
	},
}
