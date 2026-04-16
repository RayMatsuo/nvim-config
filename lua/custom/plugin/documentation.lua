return {
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim", { "nvim-neorg/neorg-telescope" } },
    ft = "norg",
    version = "*",
    config = function()
      require "custom.configs.neorg"
      vim.cmd ":se cole=2"
    end,
    enabled = false
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    lazy = false,
    enabled = false
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
    event = "VeryLazy",
    opts = {},
    config = function()
      require("render-markdown").setup {
        anti_conceal = {
          enabled = true
        },
        bullet = {
          left_pad = 2,
        },
        checkbox = {
          bullet = true,
        },
        heading = {
          width = 'block',
          right_pad = 1,
          min_width = 30,
        },
        indent = {
            enabled = true,
        }
      }
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
    enabled = false,
    opts = {
      legacy_commands = false, -- this will be removed in the next major release
      workspaces = {
        {
          name = "personal",
          path = "~/obsidian",
        }
      },
    },
  },
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    config = function()
      require("markdown").setup({
        -- configuration here or empty for defaults
      })
    end,
  }
}
