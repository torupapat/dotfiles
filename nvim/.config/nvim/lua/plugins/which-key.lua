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

	opts = function(_, opts)
		return opts
	end,
}
