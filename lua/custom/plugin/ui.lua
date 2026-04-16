return {

  {
    "xiyaowong/transparent.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.transparent"
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require "custom.configs.rainbow"
    end,
    event = "VeryLazy",
  },
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.incline"
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.alpha"
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require "custom.configs.notify"
    end,
  },
  {
    "andymass/vim-matchup",
    init = function()
      require "custom.configs.matchup"
    end
  },
}
