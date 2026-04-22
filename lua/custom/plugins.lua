local plugins = {}

local files = {
  "custom.plugin.lsp",
  "custom.plugin.documentation",
  "custom.plugin.navigation",
  "custom.plugin.package",
  "custom.plugin.shortcut",
  "custom.plugin.ui",
  "custom.plugin.utility",
  "custom.plugin.other",
}
function tableConcat(t1, t2)
  -- loop over t2 items
  for i = 1, #t2 do
    -- append entries to t1
    t1[#t1 + 1] = t2[i]
  end
  -- return merged table
  return t1
end

for _, path in pairs(files) do
  plugins = tableConcat(plugins, require(path))
end
return plugins
