return {
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" }
    },
    init = function ()
      require("config.utils").load_mappings "comment"
    end,
    config = function (_, opts)
      require("Comment").setup(opts)
    end
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function ()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      }
    end,
    event = { "BufReadPost", "BufNewFile" }
  },
  {
    "folke/todo-comments.nvim",
    config = function ()
      require "plugins.configs.todo-comments"
    end,
    event = { "BufReadPost", "BufNewFile" }
  },
  {
    "NFrid/due.nvim",
    config = function ()
      require "plugins.configs.due"
    end,
    ft = "markdown"
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ft = "markdown",
    opts = function ()
      return require "plugins.configs.render_markdown"
    end
  },
  {
    "kkoomen/vim-doge",
    cmd = { "DogeGenerate" },
    lazy=false,
    init=function()
      require("config.utils").load_mappings "doge"
    end,
    enabled=false
  },
  { 
    "danymat/neogen", 
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*" 
    lazy=false,
    init=function()
      vim.notify("AAA")
      require("config.utils").load_mappings "neogen"
    end
},
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    config = function ()
      require("markdown").setup({
        -- configuration here or empty for defaults
      })
    end
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
      "BufReadPre C:/Users/matsu/docs/notes/*.md",
      "BufNewFile C:/Users/matsu/docs/notes/*.md"
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim"
    },
    opts = {
      workspaces = {
        {
          name = "sanctuary",
          path = "C:/Users/matsu/docs/notes"
        }
      },
      frontmatter = {
        enabled = false,
      },
      legacy_commands = false,
      statusline = {
        enabled = false
      },
      footer = {
        enabled = false
      }
    },
    enabled = true
  },

}
