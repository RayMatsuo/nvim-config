local eyeliner = require "eyeliner"
eyeliner.setup {
  highlight_on_key = false,
  dim = true,
}

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function(ev)
    local dir = vim.fn.expand "%"
    if string.find(dir, "norg") == nil then
      vim.cmd "EyelinerDisable"
    else
      vim.cmd "EyelinerEnable"
    end
    if string.find(dir, "Office memo") ~= nil then
      vim.cmd "se ft=norg"
    else
    end
  end,
})

-- vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#268f9f', bold = true, underline = true })
-- vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#174f4f', underline = true })
