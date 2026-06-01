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
    event = "VeryLazy",
    config = function ()
      require "plugins.configs.noneckpain"
    end
  },
  {
    "dstein64/vim-startuptime",
    cmd = { "StartupTime" }
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      -- include a picker of your choice, see picker section for more details
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim"
    },
    opts = {
      plugins = {
        non_standalone = true
      },
      lang = "javascript"
    },
    cmd = { "Leet" }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    config = function ()
      require("plugins.configs.blankline")
    end
  }
}
