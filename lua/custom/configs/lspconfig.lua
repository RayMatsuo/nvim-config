local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "intelephense",
  "tailwindcss",
  "jsonjs",
  -- "shopify_theme_ls",
  "ts_ls",
  -- "laravel_ls",
  "stylelint_lsp",
  "eslint",
  "lua_ls"
}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end



vim.lsp.config('html', {
  filetypes = { "html", "templ", "javascript" }
})
