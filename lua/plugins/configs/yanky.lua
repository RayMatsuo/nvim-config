local utils = require("yanky.utils")
local mapping = require("yanky.telescope.mapping")

require("yanky").setup({
  ring = {
    history_length = 100,
    storage = "shada",
    sync_with_numbered_registers = true,
    cancel_event = "update",
    ignore_registers = { "_" },
    update_register_on_cycle = false
  },
  system_clipboard = {
    sync_with_ring = true
  },
  highlight = {
    on_put = false,
    on_yank = true,
    timer = 200
  },
  preserve_cursor_position = {
    enabled = true
  },

  picker = {
    telescope = {
      use_default_mappings = false,
      mappings = {
        default = mapping.put("p"),
        i = {
          ["<c-r>"] = mapping.set_register(utils.get_default_register())
        },
        n = {
          p = mapping.put("p"),
          P = mapping.put("P"),
          d = mapping.delete(),
          r = mapping.set_register(utils.get_default_register())
        }
      }
    }
  }
})

vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

require("telescope").load_extension("yank_history")
