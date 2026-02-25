vim.filetype.add({
    pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
        ["%.gitlab%-ci%.ya?ml"] = "yaml.gitlab",
    },
})
