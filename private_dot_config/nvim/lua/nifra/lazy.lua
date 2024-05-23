-- NOTE: Clone lazy.nvim if it's not already present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

-- NOTE: Setup lazy.nvim
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("nifra.plugins", { checker = { enabled = true, notify = false } })

-- NOTE: How plugins works :
-- `opts = {}` is the same as calling `require('fidget').setup({})`
