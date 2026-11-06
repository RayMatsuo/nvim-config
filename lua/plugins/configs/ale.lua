-- Configuration goes here.
local g = vim.g

g.ale_ruby_rubocop_auto_correct_all = 1
g.ale_linters_explicit = 1

g.ale_php_phpstan_configuration = './phpstan.neon'

g.ale_lint_on_enter = 1
g.ale_lint_on_save = 1
g.ale_lint_on_text_changed = "always"
g.ale_linters = {
    php = { 'phpstan', 'astgrep' },
    go = { "golangci-lint" },
}
