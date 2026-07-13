local ls = require("luasnip")
ls.setup({})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").load()
require("luasnip.loaders.from_lua").load()
require("luasnip.loaders.from_snipmate").load { paths = "./snippets" }
require("luasnip.loaders.from_lua").load({ paths = "./snippets" })

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function ()
    if require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active then
      require("luasnip").unlink_current()
    end
  end
})
