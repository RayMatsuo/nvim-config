require("workspaces").setup {
  cd_type = "tab",
  auto_open = true,
  hooks = {
    open = {
      -- "Telescope find_files",
      function ()
        local f = io.open("serve.bat", "r")
        if f ~= nil then
          io.close(f)
          GetVerticalTerm("./serve.bat"):spawn()
        end
      end,
      function ()
        local f = io.open("watch.bat", "r")
        if f ~= nil then
          io.close(f)
          GetHorizontalTerm("./watch.bat"):spawn()
        end
      end
    },
    open_pre = {
      function ()
        ClearTerms()
      end
    } -- run before changing directory
  }
}

require("telescope").load_extension "workspaces"
require("telescope").setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "**.jpg",
      "**.png",
      "**.webp"
    }
  }
}
