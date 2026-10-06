return {

    {
        'maxmx03/fluoromachine.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            local fm = require 'fluoromachine'

            fm.setup {
                glow = true,
                theme = 'fluoromachine',
                transparent = true,
                overrides = function(c, color)
                    return {
                        ["BufferCurrentSign"] = { fg = "#4e88c7" },
                        ["BufferCurrentSignRight"] = { fg = "#4e88c7" },
                        ["LineNr"] = { fg = "#f2caff" },
                        ["LineNrAbove"] = { fg = "#c2caff" },
                        ["LineNrBelow"] = { fg = "#c2caff" },
                        ["Comment"] = { fg = "#a2caff" },
                        ["DiagnosticUnnecessary"] = { fg = "#4e88c7" },
                        ["BufferInactive"] = { fg = "#B3B3B3" },
                        ["BufferCurrent"] = { fg = "#FFA626" },
                        ["@spell"] = { fg = "#fafafa" },
                        ["TelescopeSelection"] = { bg = "#108040" },
                        ["TelescopeNormal"] = { fg = "#fafafa" },
                        ["TelescopeBorder"] = { fg = "#FFA626" },
                        ["@tag"] = { bg = "", fg = c.blue },
                        ["@tag.blade"] = { bg = "", fg = c.cyan },
                        ["@tag.attribute"] = { bg = "", fg = color.lighten(c.green, 3) },
                        ["@tag.delimiter"] = { bg = "" },
                        ["@keyword"] = { bg = "" },
                        ["Keyword"] = { bg = "" },
                        ["String"] = { fg = c.orange },
                        ["Search"] = { bg = "#BF41CC" },
                        ["IncSearch"] = { bg = "#BF41CC" },
                        ["CurSearch"] = { bg = "#BF41CC" },
                        ["BlinkCmpMenuSelection"] = { bg = "#9D37AD" },
                        ["LeapLabel"] = { bg = "#9D37AD", fg = "#ffffff" },
                        ["RenderMarkdownCodeInline"] = { bg = "#5B1966", fg = "#ffffff" },

                    }
                end
            }

            vim.cmd.colorscheme 'fluoromachine'
        end,
        enabled = true
    },
    {
        "propet/colorscheme-persist.nvim",
        lazy = false,  -- Required: Load on startup to set the colorscheme
        config = true, -- Required: call setup() function
        dependencies = {
            "nvim-telescope/telescope.nvim"
        },
        keys = {
            {
                "<leader>sc", -- Or your preferred keymap
                function()
                    require("colorscheme-persist").picker()
                end,
                mode = "n",
                desc = "Choose colorscheme"
            }
        }
    },
    --- NOTE: Below unused
    {
        'thedenisnikulin/vim-cyberpunk',
        lazy = false,
        priority = 1000,
        enabled = false
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 2000,
        opts = {
            on_highlights = function(hl, _)
                hl.BufferCurrentSign = { fg = "#4e88c7" }
                hl.BufferCurrentSignRight = { fg = "#4e88c7" }
                hl.LineNr = { fg = "#a2caff" }
                hl.LineNrAbove = { fg = "#a2caff" }
                hl.LineNrBelow = { fg = "#a2caff" }
                hl.Comment = { fg = "#a2caff" }
                hl.DiagnosticUnnecessary = { fg = "#4e88c7" }
                hl.BufferInactive = { fg = "#B3B3B3" }
                hl.BufferCurrent = { fg = "#FFA626" }
            end
        },
        enabled = false
    },
    {
        "hyperb1iss/silkcircuit",
        lazy = false,
        priority = 2000,
        opts = {
            variant = "glow"
            -- variant = "vibrant", -- "neon" | "vibrant" | "soft" | "glow" | "dawn"
        },
        config = function(_, opts)
            require("silkcircuit").setup(opts)
            vim.cmd "colorscheme silkcircuit"
        end,
        integrations = {
            telescope = true, -- all auto-detected by default
            neotree = true,
            notify = true,
            cmp = true,
            mini = true,
            nvimtree = true
        },
        enabled = false
    },
    {
        "KabbAmine/yowish.vim",
        lazy = false,
        -- event = "VeryLazy",
        priority = 2000,
        config = function()
            -- vim.cmd "colorscheme yowish"
        end,
        enabled = false
    },
    {
        "uga-rosa/ccc.nvim",
        config = function()
            return require("plugins.configs.ccc")
        end,
        event = "VeryLazy"
    }
}
