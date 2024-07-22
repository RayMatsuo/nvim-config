require("sibling-swap").setup {
  allowed_separators = {
    ",",
    ";",
    "and",
    "or",
    "&&",
    "&",
    "||",
    "|",
    "==",
    "===",
    "!=",
    "!==",
    "-",
    "+",
    ["<"] = ">",
    ["<="] = ">=",
    [">"] = "<",
    [">="] = "<=",
  },
  use_default_keymaps = false,
  -- Highlight recently swapped node. Can be boolean or table
  -- If table: { ms = 500, hl_opts = { link = 'IncSearch' } }
  -- `hl_opts` is a `val` from `nvim_set_hl()`
  highlight_node_at_cursor = true,
  -- keybinding for movements to right or left (and up or down, if `allow_interline_swaps` is true)
  -- (`<C-,>` and `<C-.>` may not map to control chars at system level, so are sent by certain terminals as just `,` and `.`. In this case, just add the mappings you want.)
  keymaps = {
    ["<C-e>"] = "swap_with_right",
    ["<C-q>"] = "swap_with_left",
    ["<space>e"] = "swap_with_right_with_opp",
    ["<space>q"] = "swap_with_left_with_opp",
  },
  ignore_injected_langs = false,
  -- allow swaps across lines
  allow_interline_swaps = true,
  -- swaps interline siblings without separators (no recommended, helpful for swaps html-like attributes)
  interline_swaps_without_separator = false,
  -- Fallbacs for tiny settings for langs and nodes. See #fallback
  fallback = {},
}
vim.api.nvim_set_keymap("n", "<C-e>", "<cmd>lua require('sibling-swap').swap_with_right()<CR>",{noremap=false, silent=true})
vim.api.nvim_set_keymap("n", "<C-q>", "<cmd>lua require('sibling-swap').swap_with_left()<CR>",{noremap=false, silent=true})
