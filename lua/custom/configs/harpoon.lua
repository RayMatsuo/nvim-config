local harpoon = require "harpoon"

local workspaces = require "workspaces"
local Path = require "plenary.path"
-- REQUIRED
harpoon:setup {
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
  },
}
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon:list():remove() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

--[[ vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end) ]]

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<A-j>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<A-k>", function() harpoon:list():next() end)

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
      .new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table {
          results = file_paths,
        },
        previewer = conf.file_previewer {},
        sorter = conf.generic_sorter {},
      })
      :find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
