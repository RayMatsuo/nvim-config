function Init_theme()
local set_c = vim.api.nvim_set_hl
--
-- set_c(0, "@Comment", { fg = "#8785ff", italic = true, bold = true })
-- set_c(0, "@variable", { fg = "#15E6D1" })
-- set_c(0, "@keyword", { fg="#d2db06"})
-- set_c(0, "TelescopeBorder", { fg="#d2db06"})
-- set_c(0, "TelescopeSelection", { fg="#d2db06"})
-- set_c(0, "TelescopePrompt", { fg="#d2db06"})
-- set_c(0, "TelescopePromptTitle", { fg="#d2db06"})
-- set_c(0, "TelescopePromptNormal", { fg="#d2db06"})
-- set_c(0, "TelescopeResultsTitle", { fg="#d2db06"})
-- set_c(0, "@neorg.todo_items.undone", { fg="#ff0000"})

    vim.api.nvim_set_hl(0, "@neorg.todo_items.undone", { fg = "#ff0000" })
end
