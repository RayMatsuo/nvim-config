return {
  {
    "propet/colorscheme-persist.nvim",
    lazy = false,  -- Required: Load on startup to set the colorscheme
    config = true, -- Required: call setup() function
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<leader>sc", -- Or your preferred keymap
        function()
          require("colorscheme-persist").picker()
        end,
        mode = "n",
        desc = "Choose colorscheme",
      },
    },
  },
  {
    'thedenisnikulin/vim-cyberpunk',
    lazy = false,
    priority = 1000,
    enabled = false
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 2000,
    opts = {
      on_highlights = function(hl, _)
        hl.BufferCurrentSign = { fg = "#3e68d7" }
        hl.BufferCurrentSignRight = { fg = "#3e68d7" }
        hl.LineNr = { fg = "#82aaff" }
        hl.LineNrAbove = { fg = "#3e68d7" }
        hl.LineNrBelow = { fg = "#3e68d7" }
        hl.Comment = { fg = "#82aaff" }
        hl.DiagnosticUnnecessary = { fg = "#3e68d7" }
      end,
    }
  },
  {
    "hyperb1iss/silkcircuit",
    lazy = false,
    priority = 2000,
    opts = {
      variant = "soft"
      -- variant = "vibrant", -- "neon" | "vibrant" | "soft" | "glow" | "dawn"
    },
    config = function(_, opts)
      require("silkcircuit").setup(opts)
      vim.cmd "colorscheme silkcircuit"
    end,
    integrations = {
      telescope = true, -- all auto-detected by default
      neotree = true,
      notify = true,
      cmp = true,
      mini = true,
      nvimtree = true
    },
    enabled = false
  },
  {
    "KabbAmine/yowish.vim",
    lazy = false,
    -- event = "VeryLazy",
    priority = 2000,
    config = function()
      -- vim.cmd "colorscheme yowish"
    end,
    enabled = false
  },
  {
    'maxmx03/fluoromachine.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local fm = require 'fluoromachine'

      fm.setup {
        glow = true,
        theme = 'fluoromachine',
        transparent = true,
      }

      vim.cmd.colorscheme 'fluoromachine'
    end,
    enabled = false
  }
}
