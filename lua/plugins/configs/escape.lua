-- lua, default settings
require("better_escape").setup {
  timeout = vim.o.timeoutlen,
  default_mappings = false,
  mappings = {
    i = {
      j = {
        -- These can all also be functions
        k = "<Esc>"
      },
      k = {
        -- These can all also be functions
        j = "<Esc>"
      }
    }
  }
}
