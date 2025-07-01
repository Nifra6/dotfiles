local language_id_mapping = { tex = "latex" }

local function get_language_id(_, filetype)
    return language_id_mapping[filetype] or filetype
end

vim.lsp.config("ltex", {
    cmd = { "ltex-ls-plus" },
    filetypes = { "tex" },
    root_markers = { ".git" },
    get_language_id = get_language_id,
    settings = {
        ltex = {
            enabled = { "latex" },
            language = "en-US",
        },
    },
})
