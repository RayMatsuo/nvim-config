local spread = require "spread"
local default_options = {
  silent = true,
  noremap = true,
}

vim.keymap.set("n", "<leader>sp", spread.out, default_options)
vim.keymap.set("n", "<leader>ssc", spread.combine, default_options)



