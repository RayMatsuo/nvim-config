local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "intelephense",
  "tailwindcss",
  "ts_ls"
}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end
