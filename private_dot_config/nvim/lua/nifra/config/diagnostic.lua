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
        severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN }
    },
    virtual_text = {
        current_line = true,
        severity = { vim.diagnostic.severity.INFO, vim.diagnostic.severity.HINT }
    },
})

vim.keymap.set('n', 'td', function()
    local new_config = vim.diagnostic.config().virtual_lines
    new_config.current_line = not new_config.current_line
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })
