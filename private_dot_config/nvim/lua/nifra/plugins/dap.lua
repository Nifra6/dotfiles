-- Debug Adapter Protocol (DAP): breakpoints, step controls, and Python support via uv.
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "mfussenegger/nvim-dap-python",
        },
        keys = {
            { "<Leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle [B]reakpoint" },
            { "<Leader>dc", "<cmd>DapContinue<cr>", desc = "[C]ontinue" },
            { "<Leader>di", "<cmd>DapStepInto<cr>", desc = "Step [I]nto" },
            { "<Leader>do", "<cmd>DapStepOver<cr>", desc = "Step [O]ver" },
            { "<Leader>dO", "<cmd>DapStepOut<cr>", desc = "Step [O]ut" },
        },
        config = function()
            local dap = require("dap")
            require("dap-python").setup("uv")

            -- Highlight groups
            vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e06c75" })
            vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#e5c07b" })
            vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef" })
            vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })
            vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#5c6370" })

            -- Icons
            vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
            vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition" })
            vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint" })
            vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped" })
            vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected" })
        end,
    },
}
