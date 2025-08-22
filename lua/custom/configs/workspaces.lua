
require("workspaces").setup {
  cd_type = "tab",
  auto_open = true,
}


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
