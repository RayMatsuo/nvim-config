return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = { "BufReadPost", "BufNewFile" },
    priority = 1000,
    config = function ()
      require("tiny-inline-diagnostic").setup({
        options = {
          multilines = {
            enable = true
          },
          add_messages = {
            display_count = true
          },
          show_source = {
            enabled = true
          },
          show_all_diags_on_cursorline = true
        }
      })
      vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end
  }
}
