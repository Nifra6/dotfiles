-- NOTE: Load LSP list
local lsp_configs = {
    "bashls",
    -- "harper",
    -- "ltex",
    "luals",
    "ruff",
    "tombi",
    "ty", -- best Python type checker
    "basedpyright", -- best Python editor features
    -- "pyrefly", -- Python, seems memory hungry
    -- "zuban", -- Python, more promising tc but do not stop with nvim for now
    -- "pyright", -- Python, support close source, bla bla bla
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
        map("<leader>r", vim.lsp.buf.rename, "[R]ename symbol")

        -- NOTE: Code actions
        map("<leader>ca", vim.lsp.buf.code_action, "Code [A]ction")

        -- NOTE: Documentation
        map("K", vim.lsp.buf.hover, "Hover Documentation")
    end,
})
