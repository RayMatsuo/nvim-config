local notify = require "notify"

local messages = {
  "you are doing fine",
  "you deserve cuddling",
  "you deserve to be loved and taken care of",
  "it's going to be okay",
}

math.randomseed(os.time())

vim.notify = notify

vim.keymap.set("n", "<leader>ti", function()
  local now = os.time()
  local eow = os.time {
    year = tonumber(os.date "%Y"),
    month = tonumber(os.date "%m"),
    day = tonumber(os.date "%d"),
    hour = 19,
  }
  local diff = os.difftime(eow, now) / 60
  local hour = math.floor(diff / 60)
  local minutes = math.floor(diff % 60)
  vim.notify(os.date "%H:%M:%S", vim.log.levels.INFO, {
    title = "time",
    timeout = 200,
    render = "compact",
    on_close = function()
      -- vim.notify(messages[math.random(1, #messages)], vim.log.levels.INFO, {
      --   timeout = 10,
      --   render = "compact",
      -- })
      --
      vim.notify(string.format("%s hours %s minutes remaining", hour, minutes), vim.log.levels.INFO, {
        timeout = 10,
        render = "compact",
      })
    end,
  })
end)

notify.setup {
  background_colour = "#000000",
}
