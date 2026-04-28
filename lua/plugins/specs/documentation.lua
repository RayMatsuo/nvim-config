return {
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n",          desc = "Comment toggle current line" },
      { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n",          desc = "Comment toggle current block" },
      { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
    },
    init = function()
      require("config.utils").load_mappings "comment"
    end,
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require "plugins.configs.todo-comments"
    end,
    event = "VeryLazy",
  },
  {
    "NFrid/due.nvim",
    event = "VeryLazy",
    config = function()
      require "plugins.configs.due"
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
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    config = function()
      require("markdown").setup({
        -- configuration here or empty for defaults
      })
    end,
  }
}
