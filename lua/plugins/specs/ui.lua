return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function ()
      require "plugins.configs.transparent"
    end,
    priority = 10
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function ()
      require "plugins.configs.rainbow"
    end,
    event = "VeryLazy"
  },
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    config = function ()
      require "plugins.configs.incline"
    end
  },
  {
    "goolord/alpha-nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      require "plugins.configs.alpha"
    end
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function ()
      require "plugins.configs.notify"
    end
  },
  {
    "andymass/vim-matchup",
    init = function ()
      require "plugins.configs.matchup"
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require "plugins.configs.lualine"
    end,
    event = "VeryLazy",
    priority = 20
  },
  {
    'romgrk/barbar.nvim',
    lazy = false,
    priority = 10,
    dependencies = {
      -- 'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
    },
    opts = function ()
      return require "plugins.configs.barbar"
    end,
    init = function ()
      require("config.utils").load_mappings "barbar"
    end,
    enabled = true
  },
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    priority = 10,
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = function ()
      return { options = {} }
    end,
    config = true,
    enabled = false
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "User FilePost",
    config = function ()
      require("colorizer").setup()
    end
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function (_, opts)
      -- dofile(vim.g.base46_cache .. "devicons")
      require("nvim-web-devicons").setup(opts)
    end
  },
  {
    "tiagovla/scope.nvim",
    config = function ()
      require("scope").setup({})
    end,
    lazy = false
  }
}
