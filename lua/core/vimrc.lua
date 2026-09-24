local M = {}

require "config.autocmds"
require "config.shell"

vim.cmd "set guicursor=n-v-c:block-Cursor"
vim.cmd "set guicursor=i:ver100-iCursor"
vim.cmd "set title"
vim.cmd "filetype plugin on"
vim.cmd "se cole=2"
vim.cmd "se linebreak"

return M
