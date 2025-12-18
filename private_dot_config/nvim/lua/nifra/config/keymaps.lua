local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NOTE: Open Lazy
map("n", "<leader>lv", "<Cmd>Lazy<CR>", { desc = "Lazy[V]im" })

-- NOTE: Buffer
map("n", "<leader>q", function()
    require("mini.bufremove").delete(0, false)
end, { desc = "[Q]uit current buffer" })

-- NOTE: Use CTRL+<hjkl> to switch between windows
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Disable arrow keys in normal mode (for learning)
-- map("n", "<left>", '<cmd>echo "󰳝  is h, you moron!"<CR>', opts)
-- map("n", "<right>", '<cmd>echo "󰳟  is l, you idiot!"<CR>', opts)
-- map("n", "<up>", '<cmd>echo "󰳛  is k, you fool!"<CR>', opts)
-- map("n", "<down>", '<cmd>echo "󰳛  is j, you dummy!"<CR>', opts)

-- NOTE: Clear highlight in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- NOTE: Toggle diagnostic virtual lines
map("n", "td", function()
    local new_config = vim.diagnostic.config().virtual_lines
    new_config.current_line = not new_config.current_line
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Toggle diagnostic virtual_lines" })
