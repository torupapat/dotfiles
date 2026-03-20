return {
	"folke/which-key.nvim",
	event = "VeryLazy",

	init = function()
		-- Your proven pattern for Arch/Stow reliability
		vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/which-key.nvim")
		vim.opt.timeout = true
		vim.opt.timeoutlen = 300 -- Popup appears after 300ms
	end,

	opts = {
		preset = "modern", -- Centered floating "Pill" look
		win = {
			border = "rounded", -- Matching your Noice/Lualine UI
			padding = { 1, 2 }, -- Extra space for that airy feel
		},
		layout = {
			align = "center",
		},
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
	},

	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- 2026 Mapping Spec: Registering your existing groups
		wk.add({
			{ "<leader>f", group = "Format/File" },
			{ "<leader>c", group = "Code/LSP" },
			{ "<leader>r", group = "Rename/Refactor" },
			{ "<leader>d", group = "Diagnostics" },
			{ "<leader>s", group = "Search (Telescope)" },
			{ "g", group = "Go To..." },
		})
	end,
}
