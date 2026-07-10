return {
  keymap = {
    preset = 'default',
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-k>"] = { "select_prev", "fallback" },
    ["<C-j>"] = { "select_next", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<CR>"] = { 'accept', 'snippet_forward', 'fallback' },
    ["<C-c>"] = { 'hide' }
  },

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 0
    },
    ghost_text = {
      enabled = false
    },
    menu = {
      draw = {
        columns = {
          { "kind_icon", "kind", gap = 1 },
          { "label", "label_description", gap = 1 },
          { "source_name", gap = 1 }
        },
        components = {
          kind_icon = {
            text = function (ctx)
              local icon = ctx.kind_icon
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                if dev_icon then
                  icon = dev_icon
                end
              else
                icon = require("lspkind").symbol_map[ctx.kind] or ""
              end

              return icon .. ctx.icon_gap
            end,
            -- Optionally, use the highlight groups from nvim-web-devicons
          -- You can also add the same function for `kind.highlight` if you want to
          -- keep the highlight groups in sync with the icons.
            highlight = function (ctx)
              local hl = ctx.kind_hl
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                if dev_icon then
                  hl = dev_hl
                end
              end
              return hl
            end
          }
        }
      }
    },
    list = {
      selection = {
        auto_insert = false
      }
    },
    trigger = {
      show_on_keyword = true,
      show_on_insert = true
    }
  },
  sources = {
    default = {
      'lsp',
      'path',
      'snippets',
      'buffer'
    },
    per_filetype = {
      markdown = {
        "lsp",
        inherit_defaults = true
      }
    },
    providers = {
      snippets = {
        opts = {
          friendly_snippets = true -- default

          --   -- see the list of frameworks in: https://github.com/rafamadriz/friendly-snippets/tree/main/snippets/frameworks
        -- -- and search for possible languages in: https://github.com/rafamadriz/friendly-snippets/blob/main/package.json
        -- -- the following is just an example, you should only enable the frameworks that you use
        --   extended_filetypes = {
        --     markdown = { 'jekyll' },
        --     sh = { 'shelldoc' },
        --     php = { 'phpdoc' },
        --     cpp = { 'unreal' }
        --   }
        }
      }
    }
  },
  snippets = { preset = 'luasnip' },
  signature = {
    enabled = true,
    trigger = {
      enabled = true,
      show_on_keyword = true,
      show_on_trigger_character = true,
      show_on_insert = true,
      show_on_insert_on_trigger_character = true
    }
  },
  cmdline = {
    enabled = true,
    keymap = {
      preset = 'inherit',
      ['<Tab>'] = { 'show', 'select_next' },
      ['<S-Tab>'] = { 'select_prev', 'fallback_to_mappings' }
    },
    completion = {
      ghost_text = { enabled = false }
    }
  },
  fuzzy = {
    sorts = {
      'exact',
      'score',
      'sort_text'
    }
  }
}
