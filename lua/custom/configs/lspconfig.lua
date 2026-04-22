vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" } }
    }
  }
})


local servers = {
  "html",
  "cssls",
  -- "intelephense",
  "phpantom_lsp",
  "tailwindcss",
  "jsonjs",
  "shopify_theme_ls",
  "ts_ls",
  "laravel_ls",
  "stylelint_lsp",
  "lua_ls",
  "jsonls",
  "gopls"
}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end
