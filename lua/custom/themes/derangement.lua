function Init_theme()
local set_c = vim.api.nvim_set_hl
 vim.cmd "highlight Cursor guibg=red  "
 vim.cmd "highlight iCursor guibg=red "

--[[ set_c(0, "@string", { fg = "#FFBB33"})
set_c(0, "Comment", { fg = "#ff66cc", italic = true, bold = true })
set_c(0, "@comment.php", { fg = "#ff66cc", italic = true, bold = true })
set_c(0, "@variable.member.python", { fg = "#FF4060" })
set_c(0, "@variable.python", { italic=false })
set_c(0, "@variable.parameter.python", { fg = "#15E6D1" })
set_c(0, "@neorg.markup.strikethrough.norg", { strikethrough=true })
set_c(0, "@neorg.lists.unordered.prefix.norg", {  fg = "#15E6D1"})
set_c(0, "@neorg.markup.italic.norg", {  fg = "#FFBB33", italic=true})
set_c(0, "@neorg.headings.1.prefix.norg", {  fg = "#6e45fb"})
set_c(0, "@neorg.todo_items.on_hold.norg", {  bg = ""})
set_c(0, "@keyword", { fg="#FF2244"}) ]]
end
