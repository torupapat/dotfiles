local opt = vim.opt

-- 1. Line Numbers (The Vimmer's GPS)
opt.number = true -- Show absolute line number on current line
opt.relativenumber = true -- Show relative numbers elsewhere (makes '10j' easy)

-- 2. Tabs & Indentation (Balanced for Sonos/Sentinel-Brain)
opt.tabstop = 2 -- Number of spaces a tab counts for
opt.shiftwidth = 2 -- Number of spaces for auto-indent
opt.expandtab = true -- Turn tabs into spaces
opt.smartindent = true -- Make indenting smart

-- 3. UI & Performance
opt.termguicolors = true -- Enable 24-bit RGB colors for your 4090
opt.cursorline = true -- Highlight the text line where the cursor is
opt.signcolumn = "yes" -- Always show the column for icons/git signs
opt.scrolloff = 20 -- Keep 10 lines visible above/below cursor
opt.mouse = "a" -- Mouse support (useful for resizing splits)

-- 4. Search Behavior
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- ...unless the search has a capital letter
opt.hlsearch = false -- Don't keep search results highlighted forever

-- 5. System Integration
opt.clipboard = "unnamedplus" -- Sync with system clipboard (Copy/Paste to/from Kitty)
opt.undofile = true -- Save undo history to a file (survives restarts)

-- 6. Smoothing the Experience
opt.updatetime = 250 -- Faster completion and diagnostic updates
opt.timeoutlen = 300 -- Speed up key combo triggers
opt.splitright = true -- New vertical splits go to the right
opt.splitbelow = true -- New horizontal splits go to the bottom

opt.clipboard = "unnamedplus" -- Yank to clipboard

opt.autoread = true -- Aggressive Autoread: reload files modified by external means immediately
