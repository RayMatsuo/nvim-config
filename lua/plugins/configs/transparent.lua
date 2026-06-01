require("transparent").setup({ -- Optional, you don't have to run setup.
  groups = { -- table: default groups
    'Normal',
    'NormalNC',
    'Comment',
    'Constant',
    'Special',
    'Identifier',
    'Statement',
    'PreProc',
    'Type',
    'Underlined',
    'Todo',
    'String',
    'Function',
    'Conditional',
    'Repeat',
    'Operator',
    'Structure',
    'LineNr',
    'NonText',
    'SignColumn',
    'CursorLine',
    'CursorLineNr',
    'EndOfBuffer'
  },
  extra_groups = {},          -- table: additional groups that should be cleared
  exclude_groups = {
    "Notify"
  } -- table: groups you don't want to clear
})

require('transparent').clear_prefix('nvimtree')
vim.cmd "TransparentEnable"
-- vim.cmd "TransparentToggle"
