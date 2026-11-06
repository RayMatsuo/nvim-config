local M = {}

M.ui = {
    cursor = {
        cursor_bg = "#8ba7a7",
        cursor_fg = "#282a36",
        cursor_recording_bg = "red",
        cursor_recording_fg = "red",
    }
}

M.plugins = ""                                    -- path i.e "custom.plugins", so make custom/plugins.lua file

M.lazy_nvim = require "plugins.configs.lazy_nvim" -- config for lazy.nvim startup options

M.mappings = require "config.mappings"

return M
