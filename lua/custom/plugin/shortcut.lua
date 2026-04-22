return {

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "custom.configs.autopairs"
    end,
  },
  {
    "machakann/vim-sandwich",
    event = "VeryLazy",
    config = function()
      require "custom.configs.sandwich"
    end,
  },
  {
    "max397574/better-escape.nvim",

    event = "VeryLazy",
    config = function()
      require "custom.configs.escape"
    end,
  },
  {
    "zef/vim-cycle",
    config = function()
      require "custom.configs.cycle"
    end,
    event = "VeryLazy",
  },
  {
    "wansmer/sibling-swap.nvim",
    config = function()
      require "custom.configs.swap"
    end,
    event = "VeryLazy",
  },
  {
    "theprimeagen/refactoring.nvim",

    config = function()
      require "custom.configs.refactoring"
    end,
    dependencies = {
      "lewis6991/async.nvim",
    },
    event = "VeryLazy",
  },
  {
    "acksld/nvim-trevj.lua",
    event = "VeryLazy",
    config = function()
      require "custom.configs.trevj"
    end,
  },
  {
    "nicolas-martin/region-folding.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      region_text = { start = "#region", ending = "#endregion" },
      fold_indicator = "▼"
    }
  },
}
