---@type ChadrcConfig
local M = {}

M.ui = { theme = "pastel" }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
require "custom.commands"
require "custom.themes.init"
require "custom.shellconfig"

vim.cmd "language en_US"
vim.opt.foldenable = false
vim.cmd "se relativenumber"
vim.cmd "se nowrap"

vim.cmd "set guicursor=n-v-c:block-Cursor"
vim.cmd "set guicursor=i:ver100-iCursor"

vim.g.theme_name = "pastel"
--[[ vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    local theme_name = "pastel"
    Load_Theme(theme_name)
    vim.g.theme_name = "pastel"
  end,
}) ]]
local set_c = vim.api.nvim_set_hl
M.type = "dark"

vim.cmd ":se cocu=n"
vim.cmd "set timeoutlen=225"

-- vim.cmd "runtime macros/matchit.vim"
return M
