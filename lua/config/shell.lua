if vim.fn.has("unix") == 1 then
  vim.cmd "set shell=bash"
else
  vim.cmd "set shell=pwsh"
  vim.cmd "set shellcmdflag=-command"
  vim.cmd 'set shellquote="'
  vim.cmd "set shellxquote="
end


Terms = {
  Vertical = nil,
  Horizontal = nil,
  Float = nil,
}
function GetVerticalTerm(initialCmd)
  local Terminal = require('toggleterm.terminal').Terminal
  if Terms.Vertical == nil then
    if initialCmd ~= nil and #initialCmd>0 then
      Terms.Vertical = Terminal:new {
        cmd = initialCmd,
        direction = "vertical",
      }
    else
      Terms.Vertical = Terminal:new {
        direction = "vertical",
      }
    end
  end
  return Terms.Vertical
end

function GetHorizontalTerm(initialCmd)
  local Terminal = require('toggleterm.terminal').Terminal
  if Terms.Horizontal == nil then
    if initialCmd ~= nil and #initialCmd>0 then
      Terms.Horizontal = Terminal:new {
        cmd = initialCmd,
        direction = "horizontal"
      }
    else
      Terms.Horizontal = Terminal:new {
        direction = "horizontal"
      }
    end
  end
  return Terms.Horizontal
end

function GetFloatTerm(initialCmd)
  local Terminal = require('toggleterm.terminal').Terminal
  if Terms.Float == nil then
    if initialCmd ~= nil and #initialCmd>0 then
      Terms.Float = Terminal:new {
        cmd = initialCmd,
        direction = "float"
      }
    else
      Terms.Float = Terminal:new {
        direction = "float"
      }
    end
  end
  return Terms.Float
end
