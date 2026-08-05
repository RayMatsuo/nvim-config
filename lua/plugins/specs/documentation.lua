return {
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n",          desc = "Comment toggle current line" },
      { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n",          desc = "Comment toggle current block" },
      { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" }
    },
    init = function()
      require("config.utils").load_mappings "comment"
    end,
    config = function(_, opts)
      require("Comment").setup(opts)
    end
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      }
    end,
    event = { "BufReadPost", "BufNewFile" }
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require "plugins.configs.todo-comments"
    end,
    event = { "BufReadPost", "BufNewFile" }
  },
  {
    "NFrid/due.nvim",
    config = function()
      require "plugins.configs.due"
    end,
    ft = "markdown"
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ft = "markdown",
    opts = function()
      return require "plugins.configs.render_markdown"
    end
  },
  {
    "kkoomen/vim-doge",
    cmd = { "DogeGenerate" },
    lazy = false,
    init = function()
      require("config.utils").load_mappings "doge"
    end,
    enabled = false
  },
  {
    "danymat/neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
    lazy = false,
    init = function()
      require("config.utils").load_mappings "neogen"
    end
  },
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    config = function()
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
      "BufNewFile C:/Users/matsu/docs/notes/*.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim"
    },
    opts = {
      workspaces = {
        {
          name = "sanctuary",
          path = "C:/Users/matsu/Documents/Obsidian/notes"
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

  {
    "lucaSartore/fastspell.nvim",
    -- automatically run the installation script on windows and linux)
    -- if this doesn't work for some reason, you can
    build = function()
      local base_path = vim.fn.stdpath("data") .. "/lazy/fastspell.nvim"
      local cmd = base_path .. "/lua/scripts/install." .. (vim.fn.has("win32") and "cmd" or "sh")
      vim.system({ cmd })
    end,

    config = function()
      local fastspell = require("fastspell")

      -- call setup to initialize fastspell
      fastspell.setup({
        -- Optionally put your custom configurations here
      })

      -- decide when to run the spell checking (see :help events for full list)
      vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufEnter", "WinScrolled" }, {
        callback = function(_)
          -- decide the area in your buffer that will be checked. This is the default configuration,
          -- and look for spelling mistakes ONLY in the lines of the bugger that are currently displayed
          -- for more advanced configurations see the section bellow
          local first_line = vim.fn.line('w0') - 1
          local last_line = vim.fn.line('w$')
          fastspell.sendSpellCheckRequest(first_line, last_line)
        end,
      })
    end,
    enabled = false
  },
  {
    "jjuchara/obsidian-tasks.nvim",
    opts = {
      repositories = {
        {
          name = "work",
          alias = "Work tasks",
          vault = "C:/Users/matsu/Documents/Obsidian/NewWorkNotes/New work notes",
          todo_file = "tasks.md",
          sources = { -- optional read/write task sources
            { glob = "Projects/**/*.md", tags = { "#Project" } },
          },
        },
      },
      mappings = {
        open = "<leader>to",
        create = "<leader>ta",
      },
    },
  }
}
