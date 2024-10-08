require("incline").setup {

  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
    local modified = vim.bo[props.buf].modified
    return {
      " ",
      filename,
      modified and { " *", guifg = "#888888", gui = "bold" } or "",
      " ",
      guibg = "#111111",
      guifg = "#eeeeee",
    }
  end,
}
