local function getLen(str, start_pos)
  local byte = string.byte(str, start_pos)
  if not byte then
    return nil
  end
  return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
end

local function colorize(header, header_color_map, colors)
  for letter, color in pairs(colors) do
    local color_name = "AlphaJemuelKwelKwelWalangTatay" .. letter
    vim.api.nvim_set_hl(0, color_name, color)
    colors[letter] = color_name
  end

  local colorized = {}

  for i, line in ipairs(header_color_map) do
    local colorized_line = {}
    local pos = 0

    for j = 1, #line do
      local start = pos
      pos = pos + getLen(header[i], start + 1)

      local color_name = colors[line:sub(j, j)]
      if color_name then
        table.insert(colorized_line, { color_name, start, pos })
      end
    end

    table.insert(colorized, colorized_line)
  end

  return colorized
end

local alpha_c = function()
  local alpha = require "alpha"
  local dashboard = require "alpha.themes.dashboard"

  math.randomseed(os.clock(), os.clock() / os.clock())

  -- Load map templates
  require "custom.configs.maps"
  -- Randomization table
  local flag_list = { TRANS, TRANS_SHORT, TRANSBIAN, TRANSBIAN_DIAGONAL, TRANSBIAN_DIAGONAL_SHORT, TRANSBIAN_SHORT }
  -- local pixel_list = { ".", "■", "●", "─", "█" }
  local pixel_list = { ".", "■", "●", "─" }

  -- Random picking
  local color_map = flag_list[math.random(1, #flag_list)]
  local pixel = pixel_list[math.random(1, #pixel_list)]

  -- Set flag/pattern
  -- local color_map = transbian_short
  -- local pixel = "─"
  -- local pixel="█"

  local colors = {
    ["A"] = { fg = "#5BCEFA" },
    ["B"] = { fg = "#F5A9B8" },
    ["C"] = { fg = "#FFFFFF" },
    ["1"] = { fg = "#D52D00" },
    ["2"] = { fg = "#EF7627" },
    ["3"] = { fg = "#FF9A56" },
    ["4"] = { fg = "#FFFFFF" },
    ["5"] = { fg = "#D162A4" },
    ["6"] = { fg = "#B55690" },
    ["7"] = { fg = "#A30262" },
  }

  local header = {}
  for _, line in ipairs(color_map) do
    local header_line = [[]]
    for i = 1, #line do
      if line:sub(i, i) ~= " " then
        header_line = header_line .. pixel
        -- header_line = header_line .. "█"
      else
        header_line = header_line .. " "
      end
    end
    table.insert(header, header_line)
  end

  local header_add =
  [[                                                                🐈CATGIRL SANCTUARY🐈                                                          ]]

  table.insert(header, [[]])
  table.insert(header, header_add)

  local hl_add = {}
  for i = 1, #header_add do
    table.insert(hl_add, { "NeoBeeTitle", 1, i })
  end

  dashboard.section.header.val = header
  local colorized = colorize(header, color_map, colors)

  table.insert(colorized, hl_add)

  dashboard.section.header.opts = {
    hl = colorized,
    position = "center",
  }

  --[[ local function toNotify(msg, render)
    local base = "<Cmd>lua vim.notify('%s',nil,{render='%s'}) <CR>"
    return string.format(base, msg, render)
  end ]]
  dashboard.section.buttons.val = {
    dashboard.button("petpet", "🐈 Pet the cat", "<Cmd>Pet<CR>"),
    dashboard.button("scritchies", "🐱 Scritch the cat", "<Cmd>Scritchies<CR>"),
    dashboard.button("observe", "🐈 Observe the cat", "<Cmd>Observe<CR>"),
    dashboard.button("cuddle", "😻 Cuddle the cat", "<Cmd>Cuddle<CR>"),
    dashboard.button(
      "config",
      "⚙  Configure the cat",
      "<Cmd>e C:/Users/matsu/AppData/Local/nvim/lua/custom/configs/alpha.lua<CR>"
    ),
    dashboard.button("secret diary", "📚 Open your diary", "<F11>"),
    dashboard.button("todo", "📓 Open your todo list", "<F4>"),
  }

  for _, a in ipairs(dashboard.section.buttons.val) do
    a.opts.width = 49
    a.opts.cursor = -2
  end

  alpha.setup(dashboard.config)
  if vim.fn.expand "%" == "" then
    vim.cmd "Alpha"
  end
end

alpha_c()
