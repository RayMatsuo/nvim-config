local actions = require 'telescope.actions'

-- https://github.com/MagicDuck/grug-far.nvim/pull/305
local is_windows = vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1
local vimfnameescape = vim.fn.fnameescape
local winfnameescape = function (path)
  local escaped_path = vimfnameescape(path)
  if is_windows then
    local need_extra_esc = path:find('[%[%]`%$~]')
    local esc = need_extra_esc and '\\\\' or '\\'
    escaped_path = escaped_path:gsub('\\[%(%)%^&;]', esc .. '%1')
    if need_extra_esc then
      escaped_path = escaped_path:gsub("\\\\['` ]", '\\%1')
    end
  end
  return escaped_path
end

local select_default = function (prompt_bufnr)
  vim.fn.fnameescape = winfnameescape
  local result = actions.select_default(prompt_bufnr, "default")
  vim.fn.fnameescape = vimfnameescape
  return result
end

local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55
      },
      vertical = {
        mirror = false
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = {
        ["q"] = require("telescope.actions").close,
        ['<cr>'] = select_default
      },
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ["<Esc>"] = require("telescope.actions").close,
        ['<cr>'] = select_default
      }
    }
  },
  extensions_list = {}
}

return options
