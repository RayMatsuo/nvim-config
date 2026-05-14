local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_init = function(client, _)
  if client:supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

vim.lsp.config("*", { capabilities = capabilities, on_init = on_init })
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
      library = {
        vim.fn.expand "$VIMRUNTIME/lua",
        vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
        "${3rd}/luv/library",
      },
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
  vim.lsp.config(lsp,{})
  vim.lsp.enable(lsp)
end
