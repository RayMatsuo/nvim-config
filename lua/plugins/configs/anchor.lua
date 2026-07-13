local function anchor()
  return require('anchor')
end

vim.keymap.set('n', '<leader>a', function ()
  anchor().add()
end, { desc = 'Add a directory to the anchor list' }
)
-- vim.keymap.set('n', '<leader>ad', function() anchor().delete() end, { desc = 'Delete a directory from the anchor list' })
vim.keymap.set('n', '<C-e>', function ()
  anchor().toggle_list()
end, { desc = 'Open anchor list in a floating buffer' }
)
-- vim.keymap.set('n', '<leader>a0', function() anchor().return_to_cwd() end, { desc = 'Return back to cwd' })
--
-- vim.keymap.set('n', '<leader>a1', function() anchor().open(1) end, { desc = 'Open fuzzy finder for anchor 1' })
-- ...
-- vim.keymap.set('n', '<leader>a5', function() anchor().open(5) end, { desc = 'Open fuzzy finder for anchor 5' })
--
--
require('anchor').setup({
  -- UI options for anchor list buffer
  winopts = {
    width = 80,
    height = 15,
    border = 'rounded',
    title = 'Anchor',
    numbers = 'absolute' -- 'absolute', 'relative', 'none'
  },
  -- UI options for fuzzy finder (currently only supported by fzf-lua and telescope)
  picker_opts = {
    grep = {}, -- UI Options for live grep
    files = {} -- UI Options for file search
  },
  picker = 'telescope',                 -- 'fzf-lua', 'telescope', 'default' (netrw), 'oil', 'mini', 'snack' or 'auto'
  relative_paths = true,                -- Display relative paths in the anchor list

  show_branches = true,                 -- Show branch names when viewing git worktrees

  excluded_dirs = { '.git', '.cache' }, -- Directories to exclude in fuzzy finder search
  extended_excluded_dirs = {}           -- User specific directories to exclude in fuzzy finder search
})
