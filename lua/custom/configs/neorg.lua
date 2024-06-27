require("neorg").setup {
  load = {
["core.qol.toc"]={
      config={
        
      }
    },
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {
      config = {
        icon_preset="varied"
      },
    },                  -- Adds pretty icons to your documents
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/notes",
        },
      },
    },
    ["core.summary"] = {
      config = {
        strategy = "by_path",
      },
    },
  },
}
