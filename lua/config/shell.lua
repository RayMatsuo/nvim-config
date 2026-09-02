if vim.fn.has("unix") == 1 then
  vim.cmd "set shell=bash"
else
  -- vim.cmd "set shell=pwsh"
  -- vim.cmd "set shellcmdflag=-command"
  -- vim.cmd 'set shellquote="'
  -- vim.cmd "set shellxquote="
  vim.cmd(
    [[
	   set noshelltemp
	   let &shell = 'pwsh'
	   let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command '
	   let &shellcmdflag .= '[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();'
	   let &shellcmdflag .= '$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
	   let &shellpipe  = '> %s 2>&1'
	   set shellquote= shellxquote=
	   let &shellcmdflag .= '$PSStyle.OutputRendering = ''PlainText'';'
	   " Workaround (may not be needed in future version of pwsh):
	   let $__SuppressAnsiEscapeSequences = 1
  ]]
  )
end

local has_value = require("config.helper").Has_value
AllTerms = {}

vim.api.nvim_create_autocmd("TabClosed", {
  pattern = "*",
  callback = function ()
    local pages = vim.api.nvim_list_tabpages()
    for k, _ in pairs(AllTerms) do
      if not has_value(pages, k) then
        ClearTerm(k)
        table.remove(AllTerms, k)
      end
    end
  end
})

local function createTerm(id)
  table.insert(AllTerms, id, { Vertical = nil, Horizontal = nil, Float = nil })
end

local function getCurrentTerms()
  local tabId = vim.api.nvim_get_current_tabpage()
  local term = AllTerms[tabId]
  if term ~= nil then
    return term
  end
  createTerm(tabId)
  return getCurrentTerms()
end

function ClearTerm(id)
  local term = AllTerms[id]
  if term ~= nil then
    if term.Vertical ~= nil then
      term.Vertical:shutdown()
      term.Vertical = nil
    end
    if term.Horizontal ~= nil then
      term.Horizontal:shutdown()
      term.Horizontal = nil
    end

    if term.Float ~= nil then
      term.Float:shutdown()
      term.Float = nil
    end
  end
end

function ClearTerms()
  local tabId = vim.api.nvim_get_current_tabpage()
  ClearTerm(tabId)
end

function GetVerticalTerm(initialCmd)
  local term = getCurrentTerms()
  if term == nil then
    return
  end
  local Terminal = require('toggleterm.terminal').Terminal
  if term.Vertical == nil then
    if initialCmd ~= nil and #initialCmd > 0 then
      term.Vertical = Terminal:new { cmd = initialCmd, direction = "vertical" }
    else
      term.Vertical = Terminal:new { direction = "vertical" }
    end
  end
  return term.Vertical
end

function GetHorizontalTerm(initialCmd)
  local term = getCurrentTerms()
  if term == nil then
    return
  end
  local Terminal = require('toggleterm.terminal').Terminal
  if term.Horizontal == nil then
    if initialCmd ~= nil and #initialCmd > 0 then
      term.Horizontal = Terminal:new { cmd = initialCmd, direction = "horizontal" }
    else
      term.Horizontal = Terminal:new { direction = "horizontal" }
    end
  end
  return term.Horizontal
end

function GetFloatTerm(initialCmd)
  local term = getCurrentTerms()
  if term == nil then
    return
  end
  local Terminal = require('toggleterm.terminal').Terminal
  if term.Float == nil then
    if initialCmd ~= nil and #initialCmd > 0 then
      term.Float = Terminal:new { cmd = initialCmd, direction = "float" }
    else
      term.Float = Terminal:new { direction = "float" }
    end
  end
  return term.Float
end
