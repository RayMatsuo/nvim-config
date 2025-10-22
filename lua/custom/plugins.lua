local plugins = {

  {
    "folke/which-key.nvim",
    enabled = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "html", "css", "bash" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = function()
      local conf = require "plugins.configs.telescope"
      conf.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ["<Esc>"] = require("telescope.actions").close,
      }

      return conf
    end,
  },
  {
    "neovim/nvim-lspconfig",


    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "neoclide/coc.nvim",
    config = function()
      require "custom.configs.coc"
    end,
    lazy = false,
    build = "npm ci",
    enabled = false,
  },
  {
    "jwalton512/vim-blade",
    ft = { "blade", "php" },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    lazy = false,
  },
  
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require "custom.configs.workspaces"
    end,
    lazy = false,
    dependencies = { "nvim-tree/nvim-tree.lua" },
    enabled=true
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "custom.configs.autopairs"
    end,
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
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim", { "nvim-neorg/neorg-telescope" } },
    ft = "norg",
    version = "*",
    config = function()
      require "custom.configs.neorg"
      vim.cmd ":se cole=2"
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
  --[[ {
    "jinh0/eyeliner.nvim",
    config = function()
      require "custom.configs.eyeliner"
    end,
    ft = "norg",
    enabled = true,
  }, ]]
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
    "axkirillov/easypick.nvim",
    config = function()
      require "custom.configs.easypick"
    end,
    event = "VeryLazy",
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
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
      require "custom.configs.splits"
    end,
  },
  {
    "numtostr/BufOnly.nvim",
    cmd = { "BufOnly" },
  },
  {
    "tklepzig/vim-buffer-navigator",
    event = "VeryLazy",
    config = function()
      vim.api.nvim_set_hl(0, "BufferNavigatorFile", { fg = "#dfdf06" })
      vim.api.nvim_set_hl(0, "BufferNavigatorFileMarker", { fg = "#dfdf06" })
      vim.cmd "highlight BufferNavigatorFile ctermbg=NONE ctermfg=75 guibg=NONE guifg=Yellow"
    end,
  },
  {
    "mechatroner/rainbow_csv",
    ft = { "csv" },
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
    event = "VeryLazy",
  },
  --[[ {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require "custom.configs.lualine"
    end,
  } ]]
  -- { "RayMatsuo/buflist", event = "VeryLazy", },
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
    "metakirby5/codi.vim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.codi"
    end,
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
    "NFrid/due.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.due"
    end,
  },
  -- {
  --   dir = "D:/Active projects/tjump",
  --   event = "VeryLazy",
  --   config = function()
  --     require("tjump").setup()
  --   end,
  --   enabled=false
  -- },
  {
    "andymass/vim-matchup",
    config = function()
      require "custom.configs.matchup"
    end,
    event = "VeryLazy",
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    event = "VeryLazy",
    opts = {},
    config = function()
      require("render-markdown").setup {}
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
--  {
--   "Jezda1337/nvim-html-css",
--   dependencies = { "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" }, -- Use this if you're using nvim-cmp
--   opts = {
--     enable_on = { -- Example file types
--       "html",
--       "htmldjango",
--       "tsx",
--       "jsx",
--       "erb",
--       "svelte",
--       "vue",
--       "blade",
--       "php",
--       "templ",
--       "astro",
--     },
--     handlers = {
--       definition = {
--         bind = "gd"
--       },
--       hover = {
--         bind = "K",
--         wrap = true,
--         border = "none",
--         position = "cursor",
--       },
--     },
--     documentation = {
--       auto_show = true,
--     },
--       
--     style_sheets = {
--       "D:/Active projects/csstest/css/index.css",
--     }
--   },
--     ft={"html","php"},
-- },
{
  "nicolas-martin/region-folding.nvim", 
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    region_text = { start = "#region", ending = "#endregion" },
    fold_indicator = "▼"
  }
},
  {
      "folke/trouble.nvim",
    opts={},
    cmd="Trouble",
    keys={
      {
      "<leader>tr",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>tR",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
    }
  },
  {
    'stevearc/aerial.nvim',
    event = "VeryLazy",
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
      config = function()
        require "custom.configs.aerial"
      end,
  },
  {
    "dstein64/vim-startuptime",

    cmd = { "StartupTime" },
  }
}
return plugins
