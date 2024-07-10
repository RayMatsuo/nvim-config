-- lua, default settings
require("better_escape").setup {
    timeout = vim.o.timeoutlen,
    mappings = {
        i = {
            j = {
                -- These can all also be functions
                k = "<Esc>",
            },
            k = {
                -- These can all also be functions
                j = "<Esc>",
            },
        },
        c = {
            j = {
                -- These can all also be functions
                k = "<Esc>",
            },
            k = {
                -- These can all also be functions
                j = "<Esc>",
            },
        },
        t = {
            j = {
                -- These can all also be functions
                k = "<Esc>",
            },
            k = {
                -- These can all also be functions
                j = "<Esc>",
            },
        },
        s = {
            j = {
                -- These can all also be functions
                k = "<Esc>",
            },
            k = {
                -- These can all also be functions
                j = "<Esc>",
            },
        },
    },
}
