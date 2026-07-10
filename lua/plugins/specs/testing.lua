return {
  {
    "yanskun/gotests.nvim",
    ft = "go",
    config = function ()
      require("gotests").setup()
    end
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      'V13Axel/neotest-pest'
    },
    opts = function ()
      return require("plugins.configs.neotest")
    end
  }
}
