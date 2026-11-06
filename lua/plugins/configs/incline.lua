-- This plugin modifies the file name popup ar right top of the split
local devicons = require("nvim-web-devicons")
local helpers = require 'incline.helpers'
require("incline").setup {
    window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 0 },
    },
    render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        if filename == '' then
            filename = '[No Name]'
        end
        local modified = vim.bo[props.buf].modified

        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local leftCircle = ""
        local rightCircle = ""
        local bg = "#313131"
        local fg = "#aaaaaa"
        local icon = ft_icon or ""
        local iconBg = ft_color or bg
        return {
            { leftCircle,  guibg = bg, guifg = iconBg },
            { "",          icon,       " ",           guifg = helpers.contrast_color(iconBg), guibg = iconBg },
            { rightCircle, guibg = bg, guifg = iconBg },
            " ",
            { filename,    guifg = helpers.contrast_color(bg) },
            modified and { " *", guifg = fg, gui = "bold" } or "",
            " ",
            guibg = bg,
            guifg = fg
        }
    end
}
