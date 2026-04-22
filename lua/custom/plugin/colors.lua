return {
  {
    'thedenisnikulin/vim-cyberpunk',
    lazy = false,
    priority = 1000,
    enabled = false
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 2000,
    config = function()
      -- load the colorscheme here
      vim.cmd "colorscheme tokyonight"
    end,
  }
}
