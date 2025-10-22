require "core"
local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

vim.cmd "let g:cycle_no_mappings = 1"
vim.opt.spell = true
vim.opt.spelllang = { "en", "tl" } -- Set languages

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!

if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
