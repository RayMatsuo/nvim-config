-- custom/configs/null-ls.lua

local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.prettier,
  formatting.stylua,
  formatting.phpcbf,
  formatting.black,
  formatting.gofumpt,
  formatting.blade-formatter,
  -- lint.pyflakes
}

null_ls.setup {
  debug = true,
  sources = sources,
}
require("mason-null-ls").setup()
--[[ local sql_source=formatting.sql_formatter

sql_source.filetypes = {"php","sql"}

 null_ls.register { sql_source } ]]
