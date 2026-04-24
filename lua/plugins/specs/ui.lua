return {
  {
    "xiyaowong/transparent.nvim",
    event = "VeryLazy",
    config = function()
      require "plugins.configs.transparent"
    end,

    priority = 10,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require "plugins.configs.rainbow"
    end,
    event = "VeryLazy",
  },
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    config = function()
      require "plugins.configs.incline"
    end,
  },
  {
    "goolord/alpha-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require "plugins.configs.alpha"
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require "plugins.configs.notify"
    end,
  },
  {
    "andymass/vim-matchup",
    init = function()
      require "plugins.configs.matchup"
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require "plugins.configs.lualine"
    end,
    event = "VeryLazy",
    priority = 20,
  },
  {
    'romgrk/barbar.nvim',
    lazy = false,
    priority = 10,
    dependencies = {
      -- 'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = function()
      return require "plugins.configs.barbar"
    end
  },
}
