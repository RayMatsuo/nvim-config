local fp = require "fold-preview"
fp.setup { default_keybindings = false }

local keymap = vim.keymap
keymap.amend = require "keymap-amend"
keymap.amend("n", "K", function(original)
  if not fp.show_preview() then
    original()
  end
end)
