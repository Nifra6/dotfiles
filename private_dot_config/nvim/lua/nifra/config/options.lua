local opt = vim.opt

-- Lines
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 10
opt.signcolumn = "yes"

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

-- Status line
opt.laststatus = 3

-- Split windows to the right with :vs and below with :sp
opt.splitright = true
opt.splitbelow = true

-- Preview substitutions
opt.inccommand = "split"
