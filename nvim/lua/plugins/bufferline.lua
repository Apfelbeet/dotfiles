return {
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        options = {
          mode = "buffers", -- set to "tabs" to only show tabpages instead
          themable = true,  -- allows highlight groups to be overriden i.e. sets highlights as default
          numbers = "ordinal",
          indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            -- style = 'icon' | 'underline' | 'none',
            style = 'none',
          },
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 18,
          max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
          truncate_names = true,  -- whether or not tab names should be truncated
          tab_size = 18,
          offsets = { { filetype = "NvimTree", text = "", padding = 1 } },

          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level, _, _)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,

          color_icons = false,      -- whether or not to add the filetype icon highlights
          show_buffer_icons = true, -- disable filetype icons for buffers
          show_buffer_close_icons = false,
          show_close_icon = false,
          show_tab_indicators = true,
          show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
          persist_buffer_sort = true,   -- whether or not custom sorted buffers should persist
          move_wraps_at_ends = false,   -- whether or not the move command "wraps" at the first or last position
          separator_style = "thin",     -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          hover = { enabled = false, },
          sort_by = 'insert_at_end', -- |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' |
        }
      }
    end
  }
}
