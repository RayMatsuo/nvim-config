local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true
  }
})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function ()
  harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function ()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

