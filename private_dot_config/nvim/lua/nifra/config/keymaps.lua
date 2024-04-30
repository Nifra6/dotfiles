-- NOTE: Open Lazy
vim.keymap.set("n", "<leader>l", "<Cmd>Lazy<CR>", { desc = "[L]azy" })

-- NOTE: Buffer
vim.keymap.set("n", "<leader>q", "<Cmd>bd<CR>", { desc = "[Q]uit current buffer" })
vim.keymap.set("n", "<leader>p", "<Cmd>bprev<CR>", { desc = "[P]revious buffer" })
vim.keymap.set("n", "<leader>n", "<Cmd>bnext<CR>", { desc = "[N]ext buffer" })

-- NOTE: Remapping AZERTY &,é...,à to 1,2,...,0 in normal mode
vim.keymap.set("n", "&", "1", { noremap = true, silent = true })
vim.keymap.set("n", "é", "2", { noremap = true, silent = true })
vim.keymap.set("n", '"', "3", { noremap = true, silent = true })
vim.keymap.set("n", "'", "4", { noremap = true, silent = true })
vim.keymap.set("n", "(", "5", { noremap = true, silent = true })
vim.keymap.set("n", "-", "6", { noremap = true, silent = true })
vim.keymap.set("n", "è", "7", { noremap = true, silent = true })
vim.keymap.set("n", "_", "8", { noremap = true, silent = true })
vim.keymap.set("n", "ç", "9", { noremap = true, silent = true })
vim.keymap.set("n", "à", "0", { noremap = true, silent = true })

-- NOTE: Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "󰳝  is h, you moron !"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "󰳟  is l, you idiot !"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "󰳛  is k, you fool !"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "󰳛  is j, you dumb !"<CR>')

-- NOTE: Clear highlight in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
