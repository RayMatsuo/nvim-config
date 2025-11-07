local plugins = {

  --#region LSP/Language
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jwalton512/vim-blade",
    ft = { "blade", "php" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "html", "css", "bash" },
    },
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
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
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
  --#endregion
  --#region Package manager
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup()
      vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end,
  },
  --#endregion
  --#region Navigation
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
    "phsix/faster.nvim",
    config = function()
      require "custom.configs.faster"
    end,
    event = "VeryLazy",
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.marks"
    end,
  },
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require "custom.configs.workspaces"
    end,
    lazy = false,
    dependencies = { "nvim-tree/nvim-tree.lua" },
    enabled = true
  },
  {
    "axkirillov/easypick.nvim",
    config = function()
      require "custom.configs.easypick"
    end,
    event = "VeryLazy",
  },
  {
    "mfussenegger/nvim-treehopper",
    config = function()
      require "custom.configs.treehopper"
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
  --#endregion Navigation
  --#region Comments/Documentation
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
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require "custom.configs.todo-comments"
    end,
    event = "VeryLazy",
  },
  {
    "NFrid/due.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.due"
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    event = "VeryLazy",
    opts = {},
    config = function()
      require("render-markdown").setup {}
    end,
  },
  {
    "kkoomen/vim-doge",
    event = "VeryLazy",
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    config = function()
      require "custom.configs.obsidian"
    end
  },
  --#endregion Comments/Documentation
  --#region UI
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
    config = function()
      require "custom.configs.matchup"
    end,
    event = "VeryLazy",
  },
  --#endregion UI
  --#region Shortcuts
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
  --#endregion Shortcuts
  --#region Utilities
  {
    "gbprod/yanky.nvim",
    event = "BufEnter",
    config = function()
      require "custom.configs.yanky"
    end,
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
    "shortcuts/no-neck-pain.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.noneckpain"
    end,
  },
  {
    "dstein64/vim-startuptime",

    cmd = { "StartupTime" },
  },
  {
    "saxon1964/neovim-tips",
    version = "*", -- Only update on tagged releases
    dependencies = {
      "MunifTanjim/nui.nvim",
      "MeanderingProgrammer/render-markdown.nvim", -- Clean rendering
    },
    opts = {
      -- OPTIONAL: Location of user defined tips (default value shown below)
      user_file = vim.fn.stdpath("config") .. "/neovim_tips/user_tips.md",
      -- OPTIONAL: Prefix for user tips to avoid conflicts (default: "[User] ")
      user_tip_prefix = "[User] ",
      -- OPTIONAL: Show warnings when user tips conflict with builtin (default: true)
      warn_on_conflicts = true,
      -- OPTIONAL: Daily tip mode (default: 1)
      -- 0 = off, 1 = once per day, 2 = every startup
      daily_tip = 2,
      -- OPTIONAL: Bookmark symbol (default: "🌟 ")
      bookmark_symbol = "🌟 ",
    },
    init = function()
      -- OPTIONAL: Change to your liking or drop completely
      -- The plugin does not provide default key mappings, only commands
      local map = vim.keymap.set
      map("n", "<leader>nto", ":NeovimTips<CR>", { desc = "Neovim tips", noremap = true, silent = true })
      map("n", "<leader>nte", ":NeovimTipsEdit<CR>", { desc = "Edit your Neovim tips", noremap = true, silent = true })
      map("n", "<leader>nta", ":NeovimTipsAdd<CR>", { desc = "Add your Neovim tip", noremap = true, silent = true })
      map("n", "<leader>nth", ":help neovim-tips<CR>", { desc = "Neovim tips help", noremap = true, silent = true })
      map("n", "<leader>ntr", ":NeovimTipsRandom<CR>", { desc = "Show random tip", noremap = true, silent = true })
      map("n", "<leader>ntp", ":NeovimTipsPdf<CR>", { desc = "Open Neovim tips PDF", noremap = true, silent = true })
    end,
    event = "VeryLazy"
  }
  --#endregion Utilities
}
return plugins
