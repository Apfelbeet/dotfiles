return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "csv",
          "lua",
          "gitignore",
          "vim",
          "query",
          "rust",
          "vue",
          "javascript",
          "typescript",
          "css",
          "html",
          "java",
          "kotlin",
          "yaml",
          "proto",
          "markdown",
          "markdown_inline"
        },
        sync_install = false,
        ignore_install = { "" },
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 5000 * 1024 -- 5 MB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize
                and lang ~= "json" and lang ~= "xml" then
              return true
            end
          end,
          additional_vim_regex_highlighting = { "markdown" },
          -- additional_vim_regex_highlighting = true,
        },
        autopairs = {
          enable = true,
        },
        indent = { enable = true, disable = { "yaml" } },
      })

      require("nvim-treesitter.configs").setup({
        playground = {
          enable = true,
          disable = {},
          updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      })

      -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      -- parser_config.prl = {
      -- 	install_info = {
      -- 		url = "~/Development/SofDCar/tree-sitter-boolerules",
      -- 		files = { "src/parser.c" },
      -- 	},
      -- 	filetype = "prl",
      -- }
    end
  },

  {
    'nvim-treesitter/playground',
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "TSPlaygroundToggle",
    config = function()
      require "nvim-treesitter.configs".setup {
        playground = {
          enable = true,
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        }
      }
    end
  }
}
