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
  "ruby_lsp",
  "shopify_theme_ls",
  "ts_ls",
  "laravel_ls",
  "blade-formatter",
  "stylelint_lsp",
  "tombi",
  "ltex",
  "ltex_plus",
  "prismals",
  "eslint",
"lua_ls"

}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end



vim.lsp.config('html', {
  filetypes= { "html", "templ","javascript" }
})


