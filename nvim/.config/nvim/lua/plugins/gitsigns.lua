return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },

	init = function()
		-- Maintaining your proven pattern for Arch/Stow reliability
		vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/gitsigns.nvim")
	end,

	opts = {
		-- Modern 2026 "Pill" Signs
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "┆" },
		},

		-- "The Ghost of Git Past"
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- End of line
			delay = 500, -- Show after 0.5s pause
		},

		-- UI: Rounded Preview Windows
		preview_config = {
			border = "rounded",
		},

		-- Logic: Standard keymaps that integrate with your Which-Key setup
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation: ]h and [h to jump between changes
			map("n", "]h", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Next Hunk" })

			map("n", "[h", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Prev Hunk" })

			-- Actions: <leader>gh (Git Hunk)
			map("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview Hunk" })
			map("n", "<leader>ghb", function()
				gs.blame_line({ full = true })
			end, { desc = "Blame Line" })
			map("n", "<leader>ghs", gs.stage_hunk, { desc = "Stage Hunk" })
			map("n", "<leader>ghr", gs.reset_hunk, { desc = "Reset Hunk" })
			map("n", "<leader>ghd", gs.diffthis, { desc = "Diff This" })

			local status, wk = pcall(require, "which-key")
			if status then
				wk.add({
					{ "<leader>gh", group = "Git Hunk", buffer = bufnr },
				})
			end
		end,
	},
}
