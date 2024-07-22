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

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

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
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      -- require "custom.configs.null-ls"
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

    "hrsh7th/nvim-cmp",
    enabled = false,
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
  --[[ {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-telescope/telescope.nvim" },
    branch = "harpoon2",
    config = function()
      require "custom.configs.harpoon"
    end,
    event = "VeryLazy",
  }, ]]
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
    event="VeryLazy"
  },
  {
"wansmer/sibling-swap.nvim",
    config = function()
      require "custom.configs.swap"
    end,

    event="VeryLazy"
  }

  --[[ {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require "custom.configs.lualine"
    end,
  } ]]
  -- { "RayMatsuo/buflist", event = "VeryLazy", },
}
return plugins
