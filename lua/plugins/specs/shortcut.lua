return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function ()
      require "plugins.configs.autopairs"
    end
  },
  {
    "machakann/vim-sandwich",
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
      require "plugins.configs.sandwich"
    end
  },
  {
    "max397574/better-escape.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
      require "plugins.configs.escape"
    end
  },
  {
    "acksld/nvim-trevj.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
      require "plugins.configs.trevj"
    end
  }
}
