return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      local status_ok, mason = pcall(require, "mason")
      if not status_ok then
        return
      end
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    ft = { "bash", "sh", "css", "html", "lua", "rust", "typescript", "javascript", "vue" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local status_ok, mlsp = pcall(require, "mason-lspconfig")
      if not status_ok then
        return
      end
      mlsp.setup({
        ensure_installed = {
          "bashls",
          "cssls",
          "html",
          "lua_ls",
          "rust_analyzer",
          "tsserver",
          "volar",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },

    config = function()
      local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
      if not lspconfig_status_ok then
        return
      end

      lspconfig.bashls.setup({})

      lspconfig.cssls.setup({})

      lspconfig.html.setup({})

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      lspconfig.rust_analyzer.setup({})

      lspconfig.volar.setup({
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      })

      lspconfig.tsserver.setup({})

      local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end

      local config = {
        virtual_text = true,
        signs = {
          active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }

      vim.diagnostic.config(config)

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })
      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }

          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<space>cwa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<space>cwr", vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<space>cwl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
        end,
      })
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      local status_ok, rt = pcall(require, "rust-tools")
      if not status_ok then
        return
      end

      rt.setup({
        -- local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/"
        -- local codelldb_path = extension_path .. "adapter/codelldb"
        -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

        tools = {
          on_initialized = function()
            vim.cmd([[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]])
          end,
          inlay_hints = {
            only_current_line = true,
          },
          hover_actions = {
            auto_focus = true,
          },
        },

        server = {
          on_attach = function(_, _)
            local keymap = vim.keymap.set
            local key_opts = { silent = true }

            keymap("n", "<leader>rr", "<cmd>RustRunnables<Cr>", key_opts)
            keymap("n", "<leader>rem", "<cmd>RustExpandMacro<Cr>", key_opts)
            keymap("n", "<leader>rc", "<cmd>RustOpenCargo<Cr>", key_opts)
            keymap("n", "<leader>rp", "<cmd>RustParentModule<Cr>", key_opts)
            keymap("n", "<C-t>", "<cmd>RustHoverActions<Cr>", key_opts)
            keymap("n", "<leader>rd", "<cmd>RustDebuggables<Cr>", key_opts)
          end,

          settings = {
            ["rust-analyzer"] = {
              lens = {
                enable = true,
              },
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
        -- dap = {
        --   adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        -- },
      })
    end
  },

  {
    "folke/trouble.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons"
    },
    keys = {
      { "<leader>tt", function() require("trouble").open() end },
      { "<leader>tw", function() require("trouble").open("workspace_diagnostics") end },
      { "<leader>td", function() require("trouble").open("document_diagnostics") end }
    },

    opts = {
      cycle_results = false, -- cycle item list when reaching beginning or end of list
    },
  }
}
