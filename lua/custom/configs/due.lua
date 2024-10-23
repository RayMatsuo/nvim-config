require("due_nvim").setup {
  ft = "*.norg", -- filename template to apply aucmds :)
  
  use_clock_time = true,         -- display also hours and minutes
  use_clock_today = true,        -- do it instead of TODAY
  use_seconds = false,            -- if use_clock_time == true, display seconds
}
