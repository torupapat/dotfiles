return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{
						icon = " ",
						key = "f",
						desc = "Find File",
						action = function()
							require("telescope.builtin").find_files({
								hidden = true,
								no_ignore = true,
								find_command = {
									"fd",
									"--type",
									"f",
									"--hidden",
									"--no-ignore",
									"--exclude",
									".git",
									"--exclude",
									"node_modules",
								},
							})
						end,
					},
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = function()
							require("telescope.builtin").live_grep({
								additional_args = function()
									return { "--hidden", "--no-ignore", "--glob=!node_modules" }
								end,
							})
						end,
					},
					{ icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = function()
							require("telescope.builtin").find_files({
								cwd = vim.fn.stdpath("config"),
								hidden = true,
								find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
							})
						end,
					},
					{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},
}
