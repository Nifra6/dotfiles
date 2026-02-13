local language_id_mapping = {
    bib = "bibtex",
    tex = "latex",
    text = "plaintext",
}

vim.lsp.config["ltex"] = {
    cmd = { "ltex-ls-plus" },
    filetypes = { "bib", "markdown", "tex", "text", "quarto" },
    get_language_id = function(_, filetype)
        return language_id_mapping[filetype] or filetype
    end,
}
