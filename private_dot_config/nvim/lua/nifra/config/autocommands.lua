-- NOTE: Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

-- NOTE: LSPs keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = args.buf, desc = desc })
        end

        -- NOTE: Symbols
        map("<leader>r", vim.lsp.buf.rename, "[R]ename symbol")

        -- NOTE: Code actions
        map("<leader>ca", vim.lsp.buf.code_action, "Code [A]ction")

        -- NOTE: Documentation
        map("K", vim.lsp.buf.hover, "Hover Documentation")
    end,
})
