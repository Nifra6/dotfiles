local create_autocmd = vim.api.nvim_create_autocmd

-- NOTE: Highlight when yanking (copying) text
create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

-- NOTE: LSPs keymaps
create_autocmd("LspAttach", {
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

-- NOTE: Prefer LSP folding if client supports it
create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method("textDocument/foldingRange") then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end
    end,
})

-- NOTE: Jump in help
create_autocmd("FileType", {
    pattern = "help",
    callback = function()
        vim.keymap.set("n", "<leader>gd", "<C-]>", { buffer = true, desc = "Go to tag" })
    end,
})
