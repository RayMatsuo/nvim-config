local M = {}
function M.Dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      s = s .. '[' .. k .. '] = ' .. M.Dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

function M.Has_value(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

function M.Exists(file)
  local ok, err, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  return ok, err
end

--- Check if a directory exists in this path
function M.Isdir(path)
  return M.Exists(path .. "/")
end
return M
