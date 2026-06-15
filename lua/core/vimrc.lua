local M = {}

require "config.autocmds"
require "config.shell"

vim.cmd "set guicursor=n-v-c:block-Cursor"
vim.cmd "set guicursor=i:ver100-iCursor"
vim.cmd "set title"
return M
