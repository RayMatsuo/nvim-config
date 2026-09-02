-- Configuration goes here.
local g = vim.g

g.ale_ruby_rubocop_auto_correct_all = 1
g.ale_linters_explicit = 1
g.ale_linters = {
    php = { 'phpstan' ,'astgrep'},
    go = { "golangci-lint" }
}
