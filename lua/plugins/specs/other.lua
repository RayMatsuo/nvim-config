return {
    {
        'gisketch/triforce.nvim',
        dependencies = { 'nvzone/volt' },
        opts = {},
        event = "VeryLazy",
        config = function()
            require "plugins.configs.triforce"
        end,
        enabled = false
    },
    {
        "quentingruber/pomodoro.nvim",
        lazy = false, -- needed so the pomodoro can start at launch
        priority = 100,
        opts = {
            start_at_launch = true,
            work_duration = 25,
            break_duration = 5,
            delay_duration = 1, -- The additionnal work time you get when you delay a break
            long_break_duration = 15,
            breaks_before_long = 4,
            display_ui_on_break = true -- Disable it if you only want to see the lualine
        },
        enabled = false
    },
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
        dependencies = {
            -- include a picker of your choice, see picker section for more details
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        opts = {
            plugins = {
                non_standalone = true
            },
            lang = "javascript"
        },
        cmd = { "Leet" }
    },
}
