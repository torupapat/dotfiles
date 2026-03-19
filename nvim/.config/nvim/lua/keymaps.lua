local map = vim.keymap.set

-- 1. General QoL
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>fq", "<cmd>q!<cr>", { desc = "Force Quit"})
map("n", "<leader>nh", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })

-- 2. Window Navigation (Smooth 4090 movement)
-- Move between splits using Ctrl + h/j/k/l (No more Ctrl-W first!)
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- 3. Buffer Management (Switching files)
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- 4. Visual Mode "Pro" Moves
-- Move selected lines up/down (like Alt+Up/Down in VS Code)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Stay in visual mode after indenting
map("v", "<", "<gv", { desc = "Indent out" })
map("v", ">", ">gv", { desc = "Indent in" })

-- 5. Terminal Mode
-- Easy exit from terminal mode (so you can move windows)
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- 6. Search
-- Keep search results centered on screen
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
