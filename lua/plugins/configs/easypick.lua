local easypick = require "easypick"

local config = vim.fn.stdpath("config")

easypick.setup {
  pickers = {
    {
      name = "enc",
      command = "cat " .. config .. "/.encodings",
      action = easypick.actions.nvim_commandf "e ++enc=%s",
      previewer = easypick.previewers.default(),
    },
    {
      name = "ft",
      command = "cat " .. config .. "/.filetypes",
      action = easypick.actions.nvim_commandf "se ft=%s",
      previewer = easypick.previewers.default(),
    },
  },
}
