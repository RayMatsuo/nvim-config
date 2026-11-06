local M = {}

require "config.autocmds"
require "config.shell"

require("config.helper").ResetCursorBG()

vim.cmd "set guicursor=n-v-c:block-Cursor,i:ver100-iCursor,n-v-t-c-sm-a:blinkon0-blinkoff0-blinkwait0"
vim.cmd "set title"
vim.cmd "filetype plugin on"
vim.cmd "se cole=2"
vim.cmd "se linebreak"

return M
