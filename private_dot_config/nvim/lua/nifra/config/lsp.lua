-- NOTE: Load LSP list
local lsp_configs = {
    "bashls",
    "harper",
    -- "ltex",
    "luals",
    "ruff",
    "pyright",
    "taplo",
}

-- NOTE: LSP configurations
for _, name in ipairs(lsp_configs) do
    require("nifra.lsp." .. name)
end

-- NOTE: LSP enabling
for _, name in ipairs(lsp_configs) do
    vim.lsp.enable(name)
end

-- NOTE: Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = args.buf, desc = desc })
        end

        -- NOTE: Symbols
        map("<leader>sr", vim.lsp.buf.rename, "[R]ename symbol")

        -- NOTE: Code actions
        map("<leader>ca", vim.lsp.buf.code_action, "Code [A]ction")

        -- NOTE: Documentation
        map("K", vim.lsp.buf.hover, "Hover Documentation")
    end,
})
