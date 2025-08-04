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
  "ltex",
  "ltex_plus"
}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end


local enabled_files= {"norg","bib", "context", "gitcommit",  "markdown", "org", "pandoc", "plaintex", "quarto", "mail", "mdx", "rmd", "rnoweb", "rst", "tex", "text", "typst" }

vim.lsp.config('ltex', {
  -- Server-specific settings. See `:help lsp-quickstart`
  filetypes= enabled_files,
  settings ={
    ltex = {
      enabled = enabled_files
    }
  },
})
vim.lsp.config('ltex_plus', {
  -- Server-specific settings. See `:help lsp-quickstart`
  filetypes= enabled_files,
  settings ={
    ltex_plus = {
      enabled = enabled_files
    }
  },
})
