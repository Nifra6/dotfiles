return {
    -- Loading previous sessions
    { "persistence.nvim", 
        opts = { options = vim.opt.sessionoptions:get() } 
    },
    -- Lib
    { "plenary.nvim",
        opts = nil 
    },
}
