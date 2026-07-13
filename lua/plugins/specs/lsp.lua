return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate | TSInstallAll",
    lazy = false
  },
  -- lsp stuff
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function ()
      return require "plugins.configs.mason"
    end,
    config = function (_, opts)
      -- dofile(vim.g.base46_cache .. "mason")
      require("mason").setup(opts)

      vim.api.nvim_create_user_command("MasonInstallAll", function ()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {}
      )

      vim.g.mason_binaries_list = opts.ensure_installed
    end
  },
  {
    "hrsh7th/nvim-cmp",
    event = "User FilePost",
    -- lazy = false,
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function (_, opts)
          require("plugins.configs.luasnip").luasnip(opts)
        end
      },
      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" }
        },
        config = function (_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
      },
      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp-signature-help"
      }
    },
    opts = function ()
      return require "plugins.configs.cmp"
    end,
    config = function (_, opts)
      require("cmp").setup(opts)
    end,
    init = function ()
    end,
    enabled = false
  },
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    init = function ()
      require("plugins.configs.lspconfig").defaults()
      require("config.utils").load_mappings "lspconfig"
      require "config.lsp"
    end
  },
  {
    "jwalton512/vim-blade",
    ft = { "blade", "php" }
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>tr",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)"
      },
      {
        "<leader>tR",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)"
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)"
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)"
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)"
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)"
      }
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
    config = function ()
      require "plugins.configs.aerial"
    end
  },
  {
    'stevearc/conform.nvim',
    config = function ()
      require "plugins.configs.conform"
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "User FilePost"
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'saghen/blink.lib',
      'rafamadriz/friendly-snippets',
      "onsails/lspkind.nvim",
      "L3MON4D3/LuaSnip"
    },
    build = function ()
      require('blink.cmp').build():pwait()
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = function ()
      return require "plugins.configs.blink"
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      'rafamadriz/friendly-snippets'
    },
    config = function ()
      require "plugins.configs.luasnip"
    end
  },
  {
    'saghen/blink.compat',
    -- use v2.* for blink.cmp v1.*
    version = '2.*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {}
  }
}
