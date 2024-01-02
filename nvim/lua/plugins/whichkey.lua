return {
  "folke/which-key.nvim",
  keys = { "<leader>", '"', "'", "`", "<C>-w" },
  config = function()
    local which_key = require("which-key")

    local setup = {
      plugins = {
        presets = {
          operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = false,      --adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = true,       -- default bindings on <c-w>
          nav = true,           -- misc bindings to work with windows
          z = true,             -- bindings for folds, spelling and others prefixed with z
          g = true,             -- bindings for prefixed with g
        },
      },
      window = {
        border = "rounded",       -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 0, 0, 0, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    }

    local opts = {
      mode = "n",     -- NORMAL mode
      prefix = "<leader>",
      buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true,  -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true,  -- use `nowait` when creating keymaps
    }

    local mappings = {
      -- New File
      ["a"] = { "<cmd>enew<cr>", "New File"},
      ["b"] = {
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Buffers",
      },
      ["d"] = { "<cmd>Bdelete!<cr>", "Delete Buffer" },
      ["e"] = { "<cmd>NvimTreeToggle<cr>", "Toggle Explorer" },
      ["f"] = {
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Find files",
      },
      ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
      ["h"] = { "<cmd>nohlsearch<cr>", "No Highlight" },
      ["p"] = { "<cmd>Lazy<cr>", "Lazy" },
      ["q"] = { "<cmd>q!<cr>", "Quit" },
      ["w"] = { "<cmd>w!<cr>", "Save" },

      g = {
        name = "Git",
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        a = { "<cmd>Gitsigns setqflist<cr>", "Reset Buffer" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
        g = { "<cmd>Git<cr>", "Vim Fugitive" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
      },

      i = {
        name = "Wiki",
        w = { "<cmd>VimwikiIndex<cr>", "Open Index" },
        d = { "<cmd>VimwikiDeleteFile<cr>", "Delete current page" },
        r = { "<cmd>VimwikiRenameFile<cr>", "Rename current page" },
      },

      c = {
        name = "Code",
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        L = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        c = { "<cmd>Lazy load copilot.vim<cr>", "Load Copilot" },
        d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
        f = { "<cmd>lua vim.lsp.buf.format { async=true }<cr>", "Format" },
        h = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
        k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
        l = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics" },
        o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
      },

      o = {
        name = "Obsidian",
        b = {"<cmd>:ObsidianBacklinks<cr>", "Backlinks to this Note"},
        c = {"<cmd>:ObsidianLinkNew<cr>", "Create And Link Selection"},
        f = {"<cmd>:ObsidianFollowLink<cr>", "Follow Link"},
        l = {"<cmd>:ObsidianLink<cr>", "Link Selection"},
        n = {"<cmd>:ObsidianNew<cr>", "Create New Note"},
        o = {"<cmd>:ObsidianOpen<cr>", "Open in Obsidian"},
        q = {"<cmd>:ObsidianQuickSwitch<cr>", "Quick Switch Note"},
        s = {"<cmd>:ObsidianSearch<cr>", "Search Note"},
      },

      t = {
        name = "Terminal",
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
      },

      x = {
        name = "Little Helpers",
        U = { "<cmd>t.|s/./=/g|:nohls<cr>", "Underline with =" },
        c = { "<cmd>:e ~/.config/nvim/init.lua<cr>", "Configure VIM" },
        d = { "<cmd>:%s/ //g<cr>", "Delete Whitespaces" },
        f = { "<cmd>lua MiniTrailspace.trim()<cr>", "Fix Whitespaces" },
        j = { "<cmd>%!jq .<cr>", "Format JSON" },
        t = { "<cmd>TableModeToggle<cr>", "Table Mode" },
        u = { "<cmd>t.|s/./-/g|:nohls<cr>", "Underline with -" },
        x = { "<cmd>px :%!xmllint % --format<cr>", "Format XML" },
      },
    }

    which_key.setup(setup)
    which_key.register(mappings, opts)
  end,
}
