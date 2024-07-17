local leap=require('leap')
leap.add_default_mappings(true)
leap.setup({
  ignore_case=true
})
local flit=require('flit')
flit.setup({
})

vim.keymap.del("v",'x')
    -- vim.keymap.set({'n', 'x', 'o'}, '',  '<Plug>(leap-forward)')
    --
    -- vim.keymap.set({'n', 'x', 'o'}, '{',  '<Plug>(leap-backward)')
