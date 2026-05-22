local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_init = function(client, _)
  if client:supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

vim.lsp.config("*", { capabilities = capabilities, on_init = on_init })
-- vim.lsp.config("lua_ls", {
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim" }
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files and plugins
--         library = {
--           vim.env.VIMRUNTIME,
--         },
--         checkThirdParty = true,
--       },
--       telemetry = {
--         enable = false,
--       },
--     }
--   }
-- })

vim.lsp.config("emmylua_ls", {
    settings = {
      emmylua = {
        -- Tell the server which Lua you're using (usually LuaJIT, for Neovim).
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        -- Make the server aware of Neovim runtime files.
        workspace = {
          -- library = {
          --   vim.env.VIMRUNTIME,
          --   -- For LSP Settings Type Annotations: https://github.com/neovim/nvim-lspconfig#lsp-settings-type-annotations
          --   vim.api.nvim_get_runtime_file('lua/lspconfig', false)[1],
          -- },
          -- Or pull in all of 'runtimepath'. May be slower! https://github.com/neovim/nvim-lspconfig/issues/3189
          library = vim.api.nvim_get_runtime_file('', true),
        },
      },
    },
})


local servers = {
  "html",
  "cssls",
  -- "intelephense",
  "phpantom_lsp",
  "tailwindcss",
  "jsonjs",
  "shopify_theme_ls",
  "ts_ls",
  "laravel_ls",
  "stylelint_lsp",
  -- "lua_ls",
  "emmylua_ls",
  "jsonls",
  "gopls"
}

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {})
  vim.lsp.enable(lsp)
end
