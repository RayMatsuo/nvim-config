local servers = {
    "codebook",
    "cssls",
    "golangci_lint_ls",
    "gopls",
    "html",
    "jsonls",
    "laravel_ls",
    "lua_ls",
    "phpantom_lsp",
    "stylelint_lsp",
    "tailwindcss",
    "ts_ls",
}

local dir = vim.fn.stdpath("config") .. "/lua/config/"
require("config.helper").ls(dir .. "lsp", function(fname, name)
    local mod, _ = loadfile(fname)
    if mod then
        mod()
    end
end)

for _, lsp in ipairs(servers) do
    -- vim.lsp.config(lsp, {})
    vim.lsp.enable(lsp)
end
