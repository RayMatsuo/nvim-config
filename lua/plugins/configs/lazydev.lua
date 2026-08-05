
        -- local config = vim.fn.stdpath("config")
return
{
  library = {
    -- { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    "LazyVim",
    { path = "LazyVim",            words = { "LazyVim" } },
    -- config.."\\lua\\config\\lsp\\meta"
  },
  -- always enable unless `vim.g.lazydev_enabled = false`
  -- This is the default
  enabled = function(root_dir)
    return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
  end,
  -- disable when a .luarc.json file is found
  enabled = function(root_dir)
    return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
  end
}
