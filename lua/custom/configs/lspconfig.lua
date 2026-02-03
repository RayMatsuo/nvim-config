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

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" } }
    }
  }
})
