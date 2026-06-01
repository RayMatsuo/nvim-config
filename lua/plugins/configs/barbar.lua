return {
  icons = {
    button = '',
    separator = { left = '▎', right = '▎' },
    separator_at_end = true,
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true },
      [vim.diagnostic.severity.WARN] = { enabled = true },
      [vim.diagnostic.severity.INFO] = { enabled = true }
    }
  },
  sidebar_filetypes = {
    NvimTree = { text = "NvimTree" },
    undotree = { text = 'UndoTree' },
    ["no-neck-pain"] = { text = 'No neck pain' },
    Aerial = { text = 'Aerial' }
  }
}
