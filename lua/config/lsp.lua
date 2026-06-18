local servers = {
  "html",
  "cssls",
  "phpantom_lsp",
  "tailwindcss",
  "jsonls",
  "ts_ls",
  "laravel_ls",
  "stylelint_lsp",
  "emmylua_ls",
  "gopls",
}

local dir = vim.fn.stdpath("config") .. "/lua/config/"
require("config.helper").ls(dir .. "lsp", function (fname, name)
  local mod, _ = loadfile(fname)
  if mod then
    mod()
  end
end)

for _, lsp in ipairs(servers) do
  -- vim.lsp.config(lsp, {})
  vim.lsp.enable(lsp)
end
