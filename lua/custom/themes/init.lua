function File_exists(path)
  local f = io.open("C:/Users/matsu/AppData/Local/nvim/lua/" .. path:gsub("%.", "/") .. ".lua", "r")
  local inst = nil
  local result = f ~= nil
  if f ~= nil then
    io.close(f)
  end
  return result
end

function Load_Theme(theme_name)
  local lua_path="custom.themes."..theme_name
  if vim.g.theme_config_exists == nil or vim.g.theme_config_exists==false or vim.g.theme_name ~= theme_name  then
    vim.g.theme_config_exists = File_exists(lua_path)
  end

  if vim.g.theme_config_exists == true then
    local f=require(lua_path)
    -- vim.notify(vim.g.theme_name)
    Init_theme()
  end
end
