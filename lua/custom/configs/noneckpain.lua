require("no-neck-pain").setup {
  buffers = {
    right={
      enabled=false
    },
  }
}

--[[ function WS()
  local workspaces = require "workspaces"
  local home = os.getenv "HOME"
  local name = workspaces.name()
  if name ~= nil then
    return home .. "\\portal\\docs\\workspace\\" .. name .. ".norg"
  else
    return "~/Documents/"
  end
end

require("no-neck-pain").setup {
  buffers = {
    left={
      enabled=false
    },
    scratchPad = {
      enabled = true,
      pathToFile = WS(),
    },
    bo = {
      -- filetype = "norg"
    },
  },
} ]]
