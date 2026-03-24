local map = vim.keymap.set

-- ============================================================
-- General QoL
-- ============================================================
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>fq", "<cmd>q!<cr>", { desc = "Force Quit" })
map("n", "<leader>nh", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })

-- ============================================================
-- Window Navigation
-- ============================================================
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- ============================================================
-- Buffer Management
-- ============================================================
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- ============================================================
-- Visual Mode
-- ============================================================
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("v", "<", "<gv", { desc = "Indent out" })
map("v", ">", ">gv", { desc = "Indent in" })

-- ============================================================
-- Terminal Mode
-- ============================================================
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- ============================================================
-- Search
-- ============================================================
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- ============================================================
-- Telescope
-- ============================================================
map("n", "<leader>ff", function()
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
end, { desc = "Find All Files (incl. Hidden)" })

map("n", "<leader>fg", function()
	require("telescope.builtin").live_grep({
		additional_args = function()
			return { "--hidden", "--no-ignore", "--glob=!node_modules" }
		end,
	})
end, { desc = "Live Grep (incl. Hidden)" })

map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Open Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Documentation" })

-- ============================================================
-- Claude Code (claudecode.nvim)
-- ============================================================
map("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude Code" })
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send selection to Claude" })

-- ============================================================
-- Which-key groups
-- (buffer-specific groups for gitsigns/lsp are registered in their own plugin files)
-- ============================================================
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		local ok, wk = pcall(require, "which-key")
		if not ok then
			return
		end
		wk.add({
			{ "<leader>f", group = "File/Find" },
			{ "<leader>a", group = "AI (Claude)" },
			{ "<leader>g", group = "Git" },
			{ "<leader>gh", group = "Git Hunk" },
			{ "<leader>c", group = "Code/LSP" },
			{ "<leader>r", group = "Rename/Refactor" },
			{ "<leader>d", group = "Diagnostics" },
			{ "g", group = "Go To..." },
		})
	end,
})
