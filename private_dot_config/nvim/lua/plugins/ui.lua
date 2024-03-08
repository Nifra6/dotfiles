return {
    -- Notifications at top right corner
    "rcarriga/nvim-notify",
    -- Tabs for multiple files
    { "akinsho/bufferline.nvim", 
        version = "*", 
        dependencies = "nvim-tree/nvim-web-devicons"
    },
    -- Close tab
    "echasnovski/mini.bufremove", 
    -- Status line
    "nvim-lualine/lualine.nvim",
    -- Show all indents
    { "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },
    -- Highlight current indent
    "echasnovski/mini.nvim",
    -- Show options when a key is pressed
    { "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    -- Welcome page
    { "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
}
