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
