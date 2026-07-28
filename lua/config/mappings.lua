-- n, v, i, t = mode names

local wrap = false

local cole = 2

local M = {}

M.general = {
  i = {
    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
    ["<C-a>"] = { "<Esc>", "Return to normal mode" }
  },
  n = {
    ["q:"] = { "<Nop>", "Clear highlights" },
    ["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },
    -- switch between windows
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "`", "Jump to mark" },
    ["<C-k>"] = { "m", "Create mark" },
    ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },
    ["<leader>n"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<leader>fm"] = {
      function ()
        require("conform").format()
      end,
      "LSP formatting"
    },
    ["<C-x>"] = { "<Cmd>BufferClose<CR>" },
    ["<Leader>mo"] = { "<cmd>mod<Cr>" },
    ["<Leader>xx"] = {
      function ()
        require("trevj").format_at_cursor()
      end
    },
    ["<Leader>ft"] = { "<cmd>Easypick ft<Cr>" },
    ["<Leader>en"] = { "<cmd>Easypick enc<Cr>" },
    ["<Leader>co"] = {
      function ()
        if cole == 0 then
          cole = 2
        else
          cole = 0
        end
        vim.cmd(":se cole=" .. cole)
      end
    },
    ["<A-x>"] = { "<cmd>BufferCloseAllButCurrent<Cr>" },
    ["<C-b>"] = { "<cmd>BufferNavigatorToggle<Cr>" },
    ["<A-c>"] = { "<cmd>BufferNavigatorToggle<Cr>" },
    ["<Leader>w"] = {
      function ()
        if wrap == true then
          wrap = false
          vim.cmd "se nowrap"
        else
          vim.cmd "se wrap"
          wrap = true
        end
      end
    },
    ["H"] = { "<cmd>tabprevious<Cr>" },
    ["L"] = { "<cmd>tabnext<Cr>" },
    ["<Leader>tt"] = { "<cmd>tabnew<Cr>" },
    ["<Leader>tn"] = { "<cmd>tabclose<Cr>" },
    ["x"] = { 'v"_d', "Delete character" },
    ["X"] = { 'V"_d', "Delete a whole line" },
    ["<Leader>o"] = { "a<CR><Esc>", "Insert return after cursor" },
    ["<Leader>i"] = { "a<space><Esc>", "Insert space after cursor" },
    ["<C-o>"] = { "a<CR><Esc>", "Insert return after cursor" },
    ["<C-t>"] = { "a<space><Esc>", "Insert space after cursor" },
    ["<F4>"] = { "<cmd>e ~/docs/doc.md <CR>", "open todo" },
    ["<Leader>nn"] = {
      function ()
        vim.cmd "NoNeckPain"
      end
    },
    -- cycle through buffers
    ["<tab>"] = { "<Cmd>BufferNext<CR>" },
    ["<S-tab>"] = { "<Cmd>BufferPrevious<CR>" },
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>" },

    ["<F8>"] = {
      function ()
        local ft = vim.bo.filetype
        local config = vim.fn.stdpath("config")
        vim.cmd("e " .. config .. "/snippets/" .. ft .. ".snippets")
      end
    }
  },
  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" }
  },
  v = {
    ["<"] = { "<gv", "Indent line" },
    [">"] = { ">gv", "Indent line" },
    ["x"] = { '"_d', "Delete selected block without yanking" },
    ["H"] = { "" },
    ["L"] = { "" }
  },
  x = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } }
  }
}

M.tabufline = {
  plugin = true,
  n = {
    ["<C-right>"] = { "<cmd>NvimTreeResize 50 <CR>", "Expand the tree window" },
    ["<C-left>"] = { "<cmd>NvimTreeResize 30 <CR>", "Shrink the tree window" }
  }
}

M.comment = {
  plugin = true,
  -- toggle comment in both modes
  n = {
    ["<leader>/"] = {
      function ()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment"
    }
  },
  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment"
    }
  }
}

M.lspconfig = {
  plugin = true,
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    ["gD"] = {
      function ()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration"
    },
    ["gd"] = {
      function ()
        vim.lsp.buf.definition()
      end,
      "LSP definition"
    },
    ["K"] = {
      function ()
        vim.lsp.buf.hover()
      end,
      "LSP hover"
    },
    ["gi"] = {
      function ()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation"
    },
    ["<leader>ls"] = {
      function ()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help"
    },
    ["<leader>D"] = {
      function ()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type"
    },
    ["<leader>ca"] = {
      function ()
        vim.lsp.buf.code_action()
      end,
      "LSP code action"
    },
    ["gr"] = {
      function ()
        vim.lsp.buf.references()
      end,
      "LSP references"
    },
    ["<leader>lf"] = {
      function ()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic"
    },
    ["[d"] = {
      function ()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev"
    },
    ["]d"] = {
      function ()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next"
    },
    ["<leader>q"] = {
      function ()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist"
    },
    ["<leader>wa"] = {
      function ()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder"
    },
    ["<leader>wr"] = {
      function ()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder"
    },
    ["<leader>wl"] = {
      function ()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders"
    }
  },
  v = {
    ["<leader>ca"] = {
      function ()
        vim.lsp.buf.code_action()
      end,
      "LSP code action"
    }
  }
}

M.nvimtree = {
  plugin = true,
  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" }
  }
}

M.telescope = {
  plugin = true,
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>bb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
    ["<c-p>"] = { "<cmd> Telescope yank_history <CR>", "Open yank history" }
  }
}

M.workspaces = {
  n = {
    ["<F2>"] = { "<cmd> Telescope workspaces <CR>", "Find workspaces" },
    ["<F5>"] = {
      function ()
        local workspaces = require "workspaces"
        local name = workspaces.name()
        if name ~= nil then
          vim.cmd("e ~/docs/workspace/" .. name .. ".md")
        else
          vim.notify "not in workspace"
        end
      end,
      "open todo"
    }
  }
}
M.toggleterm = {
  plugin = true,
  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function ()
        GetFloatTerm():toggle()
      end,
      "Toggle floating term"
    },
    ["<A-h>"] = {
      function ()
        GetHorizontalTerm():toggle()
      end,
      "Toggle horizontal term"
    },
    ["<A-v>"] = {
      function ()
        GetVerticalTerm():toggle(vim.o.columns * 0.3)
      end,
      "Toggle vertical term"
    }
  },
  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function ()
        local term = GetFloatTerm()
        if term ~= nil then
          term:toggle()
        end
      end,
      "Toggle floating term"
    },
    ["<A-h>"] = {
      function ()
        local term = GetHorizontalTerm()
        if term ~= nil then
          term:toggle()
        end
      end,
      "Toggle horizontal term"
    },
    ["<A-v>"] = {
      function ()
        local term = GetVerticalTerm()
        if term ~= nil then
          term:toggle(vim.o.columns * 0.3)
        end
      end,
      "Toggle vertical term"
    },
    -- new
    ["<leader>h"] = {
      function ()
        local term = GetHorizontalTerm()

        if term ~= nil then
          term:toggle()
        end
      end,
      "New horizontal term"
    }
  }
}

M.barbar = {
  n = {
    ["<Leader>bs"] = { "<cmd>BufferOrderByName<Cr>" }
  }
}

M.undotree = {
  n = {
    ["<A-r>"] = { "<cmd>UndotreeToggle<CR>" }
  }
}

M.doge = {
  n = {
    ["<Leader>g"] = { "<cmd>DogeGenerate<CR>" }
  }
}

M.neogen = {
  n = {
    ["<Leader>d"] = { "<cmd>Neogen<CR>" },
    ["<Leader>nt"] = { "<cmd>Neogen type<CR>" },
    ["<Leader>nc"] = { "<cmd>Neogen class<CR>" }
  }
}
return M
