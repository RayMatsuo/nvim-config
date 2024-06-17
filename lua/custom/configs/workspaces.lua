local initialized = 0
local term = require "nvterm.terminal"
-- local fidget = require("fidget")
local vert = nil
local hor = nil
local init_term = function(display, bat, command)
  initialized = initialized + 1
  local f = io.open(bat, "r")
  local inst = nil
  if f ~= nil then
    io.close(f)
    if initialized < 2 then
      inst = term.new(display)
    end
    term.send(command, display)
    term.toggle(display)
    -- fidget.notify(string.format(">>%s",bat),nil,{key=bat})
  else
    -- fidget.notify(string.format(">>%s Was not Found",bat),nil,{key=bat})
  end
  return inst
end

require("workspaces").setup {
  hooks = {
    open = {
      -- "Telescope find_files",
      function()
        vert = init_term("vertical", "serve.bat", "serve \r")
      end,
      function()
        hor = init_term("horizontal", "watch.bat", "watch \r")
      end,
    },
    --[[ open_pre = {
      function()
        if initialized >= 2 then
          term.toggle ( "vertical")
          vim.cmd("bdelete!<CR>")
          term.toggle ( "horizontal")
          vim.cmd("bdelete!<CR>")
        end
      end,
    }, ]]
  },
  cd_type = "tab",
  auto_open = true,
}

function exists(file)
  local ok, err, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  return ok, err
end

--- Check if a directory exists in this path
function isdir(path)
  -- "/" works on both Unix and Windows
  return exists(path .. "/")
end


require("telescope").load_extension "workspaces"
-- Telescope File Exclusion
require("telescope").setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "**.jpg",
      "**.png",
      "**.webp",
    },
  },
}
