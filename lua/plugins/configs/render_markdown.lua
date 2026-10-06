return {
    anti_conceal = {
        enabled = true,
        disabled_modes = { "n" },

        ignore = {
            code_background = true,
            indent = true,
            bullet = true,
               dash=true
        },
    },
    bullet = {
        left_pad = 2
    },
    checkbox = {
        bullet = true,
        custom = {
            todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
            question = { raw = '[?]', rendered = ' ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
            alert = { raw = '[!]', rendered = '󰀦 ', highlight = 'RenderMarkdownError', scope_highlight = nil },
        }
    },
    heading = {
        width = 'block',
        right_pad = 1,
        min_width = 30,
        render_modes = { "n" }
    },
    indent = {
        enabled = true,
        skip_level = 1
    },
    latex = { enabled = false },

    paragraph = {
        indent = 0
    },
    code = {
        conceal_delimiters = false,
        render_modes = { 'n', 'i' },
    }
}
