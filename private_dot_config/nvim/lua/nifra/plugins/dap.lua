return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "mfussenegger/nvim-dap-python",
        },
        keys = {
            { "<Leader>eb", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle [B]reakpoint" },
            { "<Leader>ec", "<cmd>DapContinue<cr>", desc = "[C]ontinue" },
            { "<Leader>ei", "<cmd>DapStepInto<cr>", desc = "Step [I]nto" },
            { "<Leader>eo", "<cmd>DapStepOver<cr>", desc = "Step [O]ver" },
            { "<Leader>eO", "<cmd>DapStepOut<cr>", desc = "Step [O]ut" },
            { "<Leader>eO", "<cmd>DapStepOut<cr>", desc = "Step [O]ut" },
        },
        config = function()
            local dap = require("dap")

            -- Setup DAPs
            require("dap-python").setup("uv")
        end,
    },
}
