return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function ()
      require("config.utils").load_mappings "nvimtree"
    end,
    opts = function ()
      return require "plugins.configs.nvimtree"
    end,
    config = function (_, opts)
      require("nvim-tree").setup(opts)
      vim.cmd "highlight NvimTreeIndentMarker guifg=#82aaff"
      vim.cmd "highlight NvimTreeWinSeparator guifg=#82aaff"
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope-fzf-native.nvim" },
    cmd = "Telescope",
    init = function ()
      require("config.utils").load_mappings "telescope"
    end,
    opts = function ()
      return require "plugins.configs.telescope"
    end,
    config = function (_, opts)
      -- dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end
  },
  {
    "https://codeberg.org/andyg/leap.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
      require "plugins.configs.leap"
    end,
    dependencies = { "tpope/vim-repeat", "ggandor/flit.nvim" }
  },
  {
    "phsix/faster.nvim",
    config = function ()
      require "plugins.configs.faster"
    end,
    event = { "BufReadPost", "BufNewFile" },
    enabled = false
  },
  {
    "chentoast/marks.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
      require "plugins.configs.marks"
    end
  },
  {
    "natecraddock/workspaces.nvim",
    config = function ()
      require "plugins.configs.workspaces"
      require("config.utils").load_mappings "workspaces"
    end,
    -- lazy = false,
    dependencies = {
      "nvim-tree/nvim-tree.lua",
      -- "ThePrimeagen/harpoon",
    },
    cmd = "Telescope workspaces"
  },
  {
    "axkirillov/easypick.nvim",
    config = function ()
      require "plugins.configs.easypick"
    end,
    cmd = "Easypick"
  },
  {
    "mfussenegger/nvim-treehopper",
    config = function ()
      require "plugins.configs.treehopper"
    end,
    event = { "BufReadPost", "BufNewFile" }
  },
  {
    'stevearc/quicker.nvim',
    ft = "qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {}
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
      require "plugins.configs.harpoon"
    end,
    enabled = false
  },
  {
    'zachyarbrough/anchor.nvim',
    config = function ()
      require "plugins.configs.anchor"
    end,

    event = { "BufReadPost", "BufNewFile" },
  }
}
