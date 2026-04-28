require("workspaces").setup {
  hooks = {
    open = {
      -- "Telescope find_files",
      function()
        local f = io.open("serve.bat", "r")
        if f ~= nil then
          io.close(f)
          GetVerticalTerm("./serve.bat"):spawn()
        end
      end,
      function()
        local f = io.open("watch.bat", "r")
        if f ~= nil then
          io.close(f)
          GetHorizontalTerm("./watch.bat"):spawn()
        end
      end,
    },
    open_pre = {
      function()
        ClearTerms()
      end
    }, -- run before changing directory
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
