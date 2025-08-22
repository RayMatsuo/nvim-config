-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

require "custom.shellconfig"
require "custom.commands"
---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_light",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

vim.cmd "language en_US"
vim.opt.foldenable = false
vim.cmd "se relativenumber"
vim.cmd "se nowrap"

vim.cmd "set guicursor=n-v-c:block-Cursor"
vim.cmd "set guicursor=i:ver100-iCursor"
return M
