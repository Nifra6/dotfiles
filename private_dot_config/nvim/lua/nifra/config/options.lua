local opt = vim.opt

-- Lines
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 10

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Mouse
opt.mouse = "a"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Indent
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.autoindent = true
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Timing for keymaps
opt.timeoutlen = 500

-- For edgy.nvim
opt.laststatus = 3
opt.splitkeep = "screen"

-- Split windows to the right with :vs and below with :sp
opt.splitright = true
opt.splitbelow = true

-- Preview substitutions
opt.inccommand = "split"
