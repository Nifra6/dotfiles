local cache_dir = vim.uv.os_homedir() .. "/.cache/gitlab-ci-ls/"

vim.lsp.config("gitlab_ci_ls", {
    cmd = { "gitlab-ci-ls" },
    filetypes = { "yaml.gitlab" },
    root_markers = { ".git", ".gitlab" },
    init_options = {
        cache_path = cache_dir,
        log_path = cache_dir .. "/log/gitlab-ci-ls.log",
    },
})
