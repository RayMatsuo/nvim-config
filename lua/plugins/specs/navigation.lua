return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  {
    "https://codeberg.org/andyg/leap.nvim",
    event = "VeryLazy",
    config = function()
      require "plugins.configs.leap"
    end,
    dependencies = { "tpope/vim-repeat", "ggandor/flit.nvim" },
  },
  {
    "phsix/faster.nvim",
    config = function()
      require "plugins.configs.faster"
    end,
    event = "VeryLazy",
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      require "plugins.configs.marks"
    end,
  },
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require "plugins.configs.workspaces"
    end,
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-tree.lua" },
    enabled = true
  },
  {
    "axkirillov/easypick.nvim",
    config = function()
      require "plugins.configs.easypick"
    end,
    event = "VeryLazy",
  },
  {
    "mfussenegger/nvim-treehopper",
    config = function()
      require "plugins.configs.treehopper"
    end,
    event = "VeryLazy",
  },
  {
    'stevearc/quicker.nvim',
    ft = "qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
}
