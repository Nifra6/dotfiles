local opt = vim.opt

-- NOTE: Lines
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 10
opt.signcolumn = "yes"

-- NOTE: Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- NOTE: Mouse
opt.mouse = "a"

-- NOTE: Clipboard
opt.clipboard = "unnamedplus"

-- NOTE: Indent
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.autoindent = true
opt.breakindent = true

-- NOTE: Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldenable = false

-- NOTE: Spelling
opt.spelllang = { "en", "fr" }
opt.spell = true

-- NOTE: Save undo history
opt.undofile = true

-- NOTE: Status line
opt.laststatus = 3

-- NOTE: Split windows to the right with :vs and below with :sp
opt.splitright = true
opt.splitbelow = true

-- NOTE: Preview substitutions
opt.inccommand = "split"
