require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

local wrap = false
local cole = 2
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<C-a>", "<Esc>")

map("n", "<A-c>", "<cmd>BufferNavigatorToggle<Cr>")
map("n", "<A-x>", "<cmd>BufOnly<Cr>")
map("n", "<C-b>", "<cmd>BufferNavigatorToggle<Cr>")
map("n", "<C-left>", "<cmd>NvimTreeResize 30 <CR>")
map("n", "<C-o>", "a<CR><Esc>")
map("n", "<C-right>", "<cmd>NvimTreeResize 50 <CR>")
map("n", "<C-t>", "a<space><Esc>")
map("n", "<C-x>", function() require("nvchad.tabufline").close_buffer() end)
map("n", "<F2>", "<cmd> Telescope workspaces <CR>")
map("n", "<Leader>co", function()
  if cole == 0 then cole = 2 else cole = 0 end
  vim.cmd(":se cole=" .. cole)
end);
map("n", "<Leader>en", "<cmd>Easypick enc<Cr>")
map("n", "<Leader>ft", "<cmd>Easypick ft<Cr>")
map("n", "<Leader>i", "a<space><Esc>")
map("n", "<Leader>mo", "<cmd>mod<Cr>")
map("n", "<Leader>nn", function() vim.cmd "NoNeckPain" end)
map("n", "<Leader>o", "a<CR><Esc>")
map("n", "<Leader>tn", "<cmd>tabclose<Cr>")
map("n", "<Leader>tt", "<cmd>tabnew<Cr>")
map("n", "<Leader>w",
  function()
    if wrap == true then
      wrap = false
      vim.cmd "se nowrap"
    else
      vim.cmd "se wrap"
      wrap = true
    end
  end)
map("n", "<Leader>xx", function() require("trevj").format_at_cursor() end)
map("n", "<c-p>", "<cmd> Telescope yank_history <CR>")
map("n", "<leader>fm", function() vim.lsp.buf.format { async = true } end)
map("n", "FF", "<cmd>Pounce<CR>")
map("n", "H", "<cmd>tabprevious<Cr>")
map("n", "L", "<cmd>tabnext<Cr>")
map("n", "X", 'V"_d')
map("n", "x", 'v"_d')

map("v", "FF", "<cmd>Pounce<CR>")
map("v", "H", "")
map("v", "L", "")
map("v", "x", '"_d')
