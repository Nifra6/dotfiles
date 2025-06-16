vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅙 ',
            [vim.diagnostic.severity.WARN] = '󱠇 ',
            [vim.diagnostic.severity.INFO] = '󰋼 ',
            [vim.diagnostic.severity.HINT] = '󰋼 ',
        },
    },
    underline = false,
    virtual_lines = {
        true,
        severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN }
    },
    virtual_text = {
        current_line = true,
        severity = { vim.diagnostic.severity.INFO, vim.diagnostic.severity.HINT }
    },
})
