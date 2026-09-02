-- Reference: https://github.com/neovim/nvim-lspconfig/blob/master/lsp/intelephense.lua
vim.lsp.config('intelephense', {
    cmd = { 'intelephense', '--stdio' },
    filetypes = { 'php' },
    root_markers = { '.git', 'composer.json' },
    ---@type lspconfig.settings.intelephense
    settings = {
        intelephense = {
            telemetry = {
                enabled = false,
            },
        },
    },
    init_options = {
        -- storagePath = …, -- Optional absolute path to storage dir. Defaults to os.tmpdir().
        -- globalStoragePath = …, -- Optional absolute path to a global storage dir. Defaults to os.homedir().
        -- licenceKey = …, -- Optional licence key or absolute path to a text file containing the licence key.
        -- clearCache = true -- Optional flag to clear server state. State can also be cleared by deleting {storagePath}/intelephense
    }
})
