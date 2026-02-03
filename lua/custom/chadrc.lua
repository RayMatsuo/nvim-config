local M = {}

M.ui = { theme = "radium" }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
require "custom.commands"
require "custom.themes.init"
require "custom.shellconfig"

vim.cmd "se relativenumber"
vim.cmd "se nowrap"
vim.cmd "se nofen"


vim.cmd "set guicursor=n-v-c:block-Cursor"
vim.cmd "set guicursor=i:ver100-iCursor"

vim.g.theme_name = "radium"

M.type = "dark"

vim.cmd ":se cocu=n"
vim.cmd "set timeoutlen=225"

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

return M
