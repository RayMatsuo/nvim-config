local servers = {
  "html",
  "cssls",
  "intelephense",
  "tailwindcss",
  "jsonjs",
  "shopify_theme_ls",
  "ts_ls",
  "laravel_ls",
  "stylelint_lsp",
  "lua_ls",
  "jsonls",
  "gopls",
  "ltex_plus"
}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end




--[[
vim.lsp.config('ts_ls', {
  compilerOptions = {
    module = "commonjs",
    target = "es6",
    checkJs = false
  },
  exclude = {
    "node_modules"
  }
}) ]]
