
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

vim.api.nvim_create_user_command("EP", function()
  vim.cmd "Easypick"
end, {})
vim.api.nvim_create_user_command("W", function()
  vim.cmd "w"
end, {})
vim.api.nvim_create_user_command("Q", function()
  vim.cmd "q"
end, {})

local petMessages = {
  "meoooow mew mew",
  "nya? mrrrrpppth",
  "nyaaaaa *nuzzles against your fingers",
}
local scritchMessages = {
  "mrrp... arp.. mppp...",
  "mrrrrrp",
  "purrrrrrr.....",
}

local cuddleMessages = {
  "you feel your worries melt away",
  "the warmth of the cat embraces you back,keeping you safe from the cold",
  "the cat nuzzles its face against yours.",
  "the cat purrs against your chest",
  "you sink your fingers into the warm fluff",
  "you think you are going to have a peaceful rest tonight",
}
local observeMessaegs = {
  "🐈 <- THE CAT OBSERVED",
  "🐈 <- IT STANDIN",
  " <- WHERE DID IT GO?",
}
vim.api.nvim_create_user_command("Pet", function()
  vim.notify(petMessages[math.random(1, #petMessages)], nil, { render = "compact" })
end, {})
vim.api.nvim_create_user_command("Scritchies", function()
  vim.notify(scritchMessages[math.random(1, #scritchMessages)], nil, { render = "compact" })
end, {})
vim.api.nvim_create_user_command("Cuddle", function()
  vim.notify(cuddleMessages[math.random(1, #cuddleMessages)], nil, { render = "compact" })
end, {})
vim.api.nvim_create_user_command("Observe", function()
  vim.notify(observeMessaegs[math.random(1, #observeMessaegs)], nil, { render = "compact" })
end, {})
