return {
  "nvim-lua/plenary.nvim",
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    init = function ()
        require("config.utils").load_mappings "toggleterm"
    end
  },
  {
    "gbprod/yanky.nvim",
    event = "BufEnter",
    config = function ()
      require "plugins.configs.yanky"
    end
  },
  {
    "mbbill/undotree",
    event = "VeryLazy",
    init = function ()
      require("config.utils").load_mappings "undotree"
    end
  },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function ()
      require "plugins.configs.splits"
    end
  },
  {
    "shortcuts/no-neck-pain.nvim",
    cmd = "NoNeckPain",
    config = function ()
      require "plugins.configs.noneckpain"
    end
  },
  {
    "dstein64/vim-startuptime",
    cmd = { "StartupTime" }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    config = function ()
      require("plugins.configs.blankline")
    end
  }
}
