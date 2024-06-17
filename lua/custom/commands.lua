-- Connamd name
-- Preview OPEn
--
-- function
-- locate root_dir/.vim/.preview
-- file and opens up the url written inside
--
-- Requires workspace to be set up
--
vim.api.nvim_create_user_command("Pope", function()
  local ws = require "workspaces"
  local root = ws.path()

  if root ~= nil then
    local vimpath = root .. ".vim\\"
    local filepath = vimpath .. ".preview"

    -- generate .vim directory if it doesnt exist
    if not isdir(vimpath) then
      os.execute(string.format('mkdir "%s"', vimpath))
    end

    -- if .preview exists, open browser
    local f = io.open(filepath, "r")
    local inst = nil
    if f ~= nil then
      local contents = f.read(f, "a")
      io.close(f)
      os.execute(string.format('firefox -new-tab "%s"', contents))
    else
      -- if not then open .preview file to be edited
      vim.cmd("e " .. filepath)
    end
  end
end, {})
