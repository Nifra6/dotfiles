-- NOTE: Load LSP list
local lsp_configs = {
    "bashls",
    "gitlab_ci_ls",
    -- "harper",
    -- "ltex",
    "luals",
    "ruff", -- Python formatter + linter
    "tombi",
    "ty", -- Python type checker + LSP
    "yamlls",
}

-- NOTE: LSP configurations
for _, name in ipairs(lsp_configs) do
    require("nifra.lsp." .. name)
end

-- NOTE: LSP enabling
for _, name in ipairs(lsp_configs) do
    vim.lsp.enable(name)
end
