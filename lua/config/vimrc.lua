local M = {}

vim.g.barbar_auto_setup = true
M.ui = {
  theme = "void",
  tabufline = {
    enabled = false,
  }
}
M.plugins = "custom.plugins"
-- M.mappings = require "custom.mappings"
require "config.autocmds"
require "config.shell"
vim.cmd "se relativenumber"
vim.cmd "se nowrap"
vim.cmd "se nofen"
vim.cmd "se nofoldenable"
vim.opt.foldenable = false

vim.cmd "set guicursor=n-v-c:block-Cursor"
vim.cmd "set guicursor=i:ver100-iCursor"

vim.g.theme_name = "void"

vim.cmd ":se cocu=n"
vim.cmd "set timeoutlen=225"
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

return M
