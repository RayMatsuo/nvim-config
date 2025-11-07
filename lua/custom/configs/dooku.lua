require("dooku").setup(
  {
    opts = {
      project_root = { '.git', '.hg', '.svn', '.bzr', '_darcs', '_FOSSIL_', '.fslckout' },
      browser_cmd = "xdg-open",

      on_bufwrite_generate = false,
      on_generate_open = true,
      auto_setup = true,

      -- notifications
      on_generate_notification = true,
      on_open_notification = true
    }
  }
)
