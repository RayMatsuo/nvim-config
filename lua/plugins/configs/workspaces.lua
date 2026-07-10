require("workspaces").setup {
  cd_type = "tab",
  auto_open = true,
  hooks = {
    open = {

      function ()
        if require("config.helper").Isdir("./.vim") then
          local ws = require("workspaces")
          local path = ws.path()
          if path ~= nil then
            require("luasnip.loaders.from_snipmate").lazy_load { paths = path .. "/.vim/snippets" }
          end
        end
      end,
      function ()
        -- Harpoon directory change fix
        -- Source : https://github.com/ThePrimeagen/harpoon/issues/648
        local harpoon = require("harpoon")
        harpoon.data = require("harpoon.data").Data:new(harpoon.config)
      end,
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
