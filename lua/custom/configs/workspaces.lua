local initialized = 0
local term = require "nvterm.terminal"
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
  else
  end
  return inst
end

require("workspaces").setup {
  hooks = {
    open = {
      -- "Telescope find_files",
      function()
        vert = init_term("vertical", "serve.bat", "./serve.bat \r")
      end,
      function()
        hor = init_term("horizontal", "watch.bat", "./watch.bat \r")
      end,
    },
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
  return exists(path .. "/")
end

require("telescope").load_extension "workspaces"
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
