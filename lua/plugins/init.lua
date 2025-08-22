return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  --

  {
    "machakann/vim-sandwich",
    event = "VeryLazy",
 config = function()
   require "custom.configs.sandwich"
 end,
  },
  {
    "gbprod/yanky.nvim",
    event = "BufEnter",
 config = function()
   require "custom.configs.yanky"
 end,
  },

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
 config = function()
   require "custom.configs.marks"
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
    "phsix/faster.nvim",
    config = function()
      require "custom.configs.faster"
    end,
    event = "VeryLazy",
  },
  {
    "j-hui/fidget.nvim",
    lazy = false,
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = function()
      require "custom.configs.fidget"
    end,
    enabled = false,
  },
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
    "folke/todo-comments.nvim",
    config = function()
      require "custom.configs.todo-comments"
    end,
    event = "VeryLazy",
  },
  {
    "mbbill/undotree",

    config = function()
      require "custom.configs.undotree"
    end,
    event = "VeryLazy",
  },
  {
    "gelguy/wilder.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.wilder"
    end,
    enabled = false,
  },
  {
    "shortcuts/no-neck-pain.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.noneckpain"
    end,
  },

  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.incline"
    end,
  },
  {
    "acksld/nvim-trevj.lua",
    event = "VeryLazy",
    config = function()
      require "custom.configs.trevj"
    end,
  },
  {
    event = "VeryLazy",
    "goolord/alpha-nvim",
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
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig",         -- optional
    },
    opts = {},                         -- your configuration
  },
 {
  "Jezda1337/nvim-html-css",
  dependencies = { "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" }, -- Use this if you're using nvim-cmp
  opts = {
    enable_on = { -- Example file types
      "html",
      "htmldjango",
      "tsx",
      "jsx",
      "erb",
      "svelte",
      "vue",
      "blade",
      "php",
      "templ",
      "astro",
    },
    handlers = {
      definition = {
        bind = "gd"
      },
      hover = {
        bind = "K",
        wrap = true,
        border = "none",
        position = "cursor",
      },
    },
    documentation = {
      auto_show = true,
    },
      
    style_sheets = {
      "D:/Active projects/csstest/css/index.css",
    }
  },
    ft={"html","php"},
},

  {
    "ggandor/leap.nvim",
    -- "ggandor/lightspeed.nvim",
    lazy = false,
    config = function()
      require "custom.configs.leap"
    end,
    dependencies = { "tpope/vim-repeat", "ggandor/flit.nvim" },
  },
  {
    "rlane/pounce.nvim",
    lazy = false,
    config = function()
      require "custom.configs.pounce"
    end,
  },

  {
    "natecraddock/workspaces.nvim",
    config = function()
      require "custom.configs.workspaces"
    end,
    lazy = false,
    dependencies = { "nvim-tree/nvim-tree.lua" },
  },

  {
    "wansmer/sibling-swap.nvim",
    config = function()
      require "custom.configs.swap"
    end,
    event = "VeryLazy",
  },

  {
    "numtostr/BufOnly.nvim",
    cmd = { "BufOnly" },
  },
}
