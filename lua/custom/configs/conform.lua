require("conform").setup({
  formatters_by_ft = {
    blade = { "blade-formatter" },
    LaTeX = { "latexindent" },
  },
    default_format_opts = {
    lsp_format = "fallback",
  },
})
