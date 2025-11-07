local leap = require('leap')
leap.setup({
  ignore_case = true
})

vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-backward)')

local flit = require('flit')
flit.setup({
})

-- vim.keymap.del("v", 'x')
-- vim.keymap.set({'n', 'x', 'o'}, '',  '<Plug>(leap-forward)')
--
-- vim.keymap.set({'n', 'x', 'o'}, '{',  '<Plug>(leap-backward)')
