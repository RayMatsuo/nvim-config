---@type ChadrcConfig
--
local M = {}

M.ui = { theme = "manor" }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
require "custom.commands"
require "custom.themes.init"
require "custom.shellconfig"

vim.cmd "language en_US"
vim.opt.foldenable = false
-- vim.opt.shell="pwsh -NoLogo"
vim.cmd "se relativenumber"
vim.cmd "se nowrap"


vim.cmd "set guicursor=n-v-c:block-Cursor"
vim.cmd "set guicursor=i:ver100-iCursor"

vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    local theme_name = "manor"
    Load_Theme(theme_name)
    vim.g.theme_name = "manor"
  end,
})

local set_c = vim.api.nvim_set_hl
-- set_c(0, "@neorg.headings.2.title.norg", { fg = "#ff2020", bg = "white", bold = true })
M.type = "dark"

vim.cmd ":se cocu=n"
vim.cmd "set timeoutlen=200"
-- vim.cmd "se cycle_no_mappings=true"
-- vim.cmd "let g:grammarous#languagetool_cmd = 'LanguageTool'"
return M
