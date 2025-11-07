require("neorg").setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {
      config = {
        icon_preset = "varied",
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
    ["core.integrations.telescope"] = {
      config = {
        insert_file_link = {
          -- Whether to show the title preview in telescope. Affects performance with a large
          -- number of files.
          show_title_preview = true,
        },
      },
    },
    ["core.ui.calendar"] = {},
    ["core.qol.todo_items"] = {
      config = {
        create_todo_items = true,
        create_todo_parents = true,
      },
    },
    ["core.integrations.treesitter"]={},
    ["core.export"]={},
    ["core.completion"]={
      config={
        engine=
      }
    }
  },
}
