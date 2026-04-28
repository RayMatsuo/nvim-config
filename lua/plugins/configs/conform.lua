require("conform").setup({
  formatters_by_ft = {
    blade = { "blade-formatter" },
    LaTeX = { "latexindent" },
    php = { "php_cs_fixer", "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    json = { "prettier" },
    typescript = { "prettier" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
})

require("conform").formatters.prettier = {
  options = {
    ft_parsers = {
      html = "html",
      php = "html",
    },
    -- Use a specific prettier parser for a file extension
    ext_parsers = {
      -- qmd = "markdown",
    },
  }
}
