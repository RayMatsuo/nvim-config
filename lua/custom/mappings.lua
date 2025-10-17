M = {}
local wrap = false

local home = os.getenv "HOME"
local cole = 2

local function file_exists(path)
  local f = io.open(home .. "/AppData/Local/nvim/lua/" .. path:gsub("%.", "/") .. ".lua", "r")
  local inst = nil
  local result = f ~= nil
  if f ~= nil then
    io.close(f)
  end
  return result
end

M.map = {
  n = {
    ["<Leader>mo"] = { "<cmd>mod<Cr>" },
    ["<Leader>xx"] = {
      function()
        require("trevj").format_at_cursor()
      end,
    },
    ["<Leader>ft"] = { "<cmd>Easypick ft<Cr>" },
    ["<Leader>en"] = { "<cmd>Easypick enc<Cr>" },
    ["<Leader>co"] = {
      function()
        if cole == 0 then
          cole = 2
        else
          cole = 0
        end
        vim.cmd(":se cole=" .. cole)
      end,
    },
    ["<A-x>"] = { "<cmd>BufOnly<Cr>" },
    ["<C-b>"] = { "<cmd>BufferNavigatorToggle<Cr>" },
    ["<A-c>"] = { "<cmd>BufferNavigatorToggle<Cr>" },
    ["<Leader>w"] = {
      function()
        if wrap == true then
          wrap = false
          vim.cmd "se nowrap"
        else
          vim.cmd "se wrap"
          wrap = true
        end
      end,
    },
    ["H"] = { "<cmd>tabprevious<Cr>" },
    ["L"] = { "<cmd>tabnext<Cr>" },
    ["<Leader>tt"] = { "<cmd>tabnew<Cr>" },
    ["<Leader>tn"] = { "<cmd>tabclose<Cr>" },
    ["x"] = { 'v"_d', "Delete character" },
    ["X"] = { 'V"_d', "Delete a whole line" },
    ["<Leader>o"] = { "a<CR><Esc>", "Insert return after cursor" },
    ["<Leader>i"] = { "a<space><Esc>", "Insert space after cursor" },
    ["<C-o>"] = { "a<CR><Esc>", "Insert return after cursor" },
    ["<C-t>"] = { "a<space><Esc>", "Insert space after cursor" },
    ["FF"] = { "<cmd>Pounce<CR>", "Start pounce" },
    ["<F4>"] = { "<cmd>e " .. home .. "\\portal\\docs\\doc.norg <CR>", "open todo" },
    ["<F10>"] = {
      function()
        local workspaces = require "workspaces"
        local name = workspaces.name()
        if name ~= nil then
          vim.cmd("e " .. home .. "\\portal\\docs\\workspace\\" .. name .. ".norg")
        else
          vim.notify "not in workspace"
        end
      end,
    },
    ["<F6>"] = {
      function()
        local path = vim.g.theme_config_path
        local absolute_path = home
            .. "/AppData/Local/nvim-data/lazy/base46/lua/base46/themes/"
            .. vim.g.theme_name
            .. ".lua"
        vim.cmd("e " .. absolute_path)
      end,
    },
    ["<F11>"] = {
      function()
        local date_txt = os.date "%Y-%m-%d"

        local dir = vim.fn.expand "%"

        if string.find(dir, "Office memo") ~= nil then
          vim.cmd("cd " .. home .. "\\Desktop\\portal\\docs\\notes\\Office memo\\diary")
        end
        vim.cmd("e " .. home .. "\\Desktop\\portal\\docs\\notes\\Office memo\\diary\\" .. date_txt .. ".md")
        -- vim.cmd "se ft=norg"
      end,
    },
    ["<Leader>d"] = {
      function()
        local dir = vim.fn.expand "%"
        if string.find(dir, "norg") then
          local line = vim.fn.getline "."
          if string.match(line, "(x)") then
            vim.cmd "s/(\\zs.\\ze)/ /e"
          elseif string.match(line, "( )") then
            vim.cmd "s/(\\zs.\\ze)/x/e"
          end
        end
        vim.cmd "noh"
      end,
    },
    ["<Leader>nn"] = {
      function()
        vim.cmd "NoNeckPain"
      end,
    }
  },

  v = {
    ["x"] = { '"_d', "Delete selected block without yanking" },
    ["FF"] = { "<cmd>Pounce<CR>", "Start pounce" },

    ["H"] = { "" },
    ["L"] = { "" },
  },

  i = {
    ["<C-a>"] = { "<Esc>", "Return to normal mode" },
  },
}
M.tabufline = {
  plugin = true,

  n = {
    ["<C-x>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<C-right>"] = { "<cmd>NvimTreeResize 50 <CR>", "Expand the tree window" },
    ["<C-left>"] = { "<cmd>NvimTreeResize 30 <CR>", "Shrink the tree window" },
  },
}
M.telescope = {
  plugin = true,
  n = {
    ["<F2>"] = { "<cmd> Telescope workspaces <CR>", "Find workspaces" },
    ["<c-p>"] = { "<cmd> Telescope yank_history <CR>", "Open yank history" },
  },
}

return M
