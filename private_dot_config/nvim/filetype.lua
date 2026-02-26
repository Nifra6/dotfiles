vim.filetype.add({
    pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
        [".*/kitty/.*%.conf"] = "kitty",
        [".*%.gitlab%-ci%.ya?ml"] = "yaml.gitlab",
    },
})
