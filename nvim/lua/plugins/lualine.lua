return {
  { "arkav/lualine-lsp-progress" },

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    depends = {
      "arkav/lualine-lsp-progress",
    },
    config = function()
      local hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end

      local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = " ", warn = " " },
        colored = false,
        update_in_insert = false,
        always_visible = true,
      }

      local diff = {
        "diff",
        colored = false,
        symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
        cond = hide_in_width,
      }

      local mode = {
        "mode",
        fmt = function(str)
          return "-- " .. str .. " --"
        end,
      }

      local filetype = {
        "filetype",
        icons_enabled = true,
        icon = nil,
      }

      local branch = {
        "branch",
        icons_enabled = true,
        icon = "",
      }

      local location = {
        "location",
        padding = 0,
      }

      -- cool function for progress
      local progress = function()
        local current_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        local chars = { "", "󰪞", "󰪟", "󰪠", "󰪢", "󰪣", "󰪤", "󰪥" }
        -- local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return chars[index]
      end

      local lsp_server = function()
        local clients = vim.lsp.buf_get_clients()
        if not clients or vim.tbl_isempty(clients) then
          return ''
        end
        local server_names = " "
        for _, client in pairs(clients) do
          server_names = server_names .. client.name .. " "
        end
        return server_names
      end

      require("lualine").setup({
        options = {
          icons_enabled = true,
          -- theme = "catppuccin",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { mode },
          lualine_b = { branch, diff },
          lualine_c = {
            {
              "lsp_progress",
              separators = {
                component = " ",
                progress = " | ",
                message = { pre = "(", post = ")" },
                percentage = { pre = "", post = "%% " },
                title = { pre = "", post = ": " },
                lsp_client_name = { pre = "[", post = "]" },
                spinner = { pre = "", post = "" },
              },
              only_show_attached = true,
              display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
              spinner_symbols = { "", "󰪞", "󰪟", "󰪠", "󰪢", "󰪣", "󰪤", "󰪥" },
              message = {
                initializing = "Initializing…",
                commenced = "In Progress",
                completed = "Completed",
              },
              max_message_length = 30,
            },
          },
          lualine_x = { lsp_server, diagnostics, filetype },
          lualine_y = { location },
          lualine_z = { progress },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      })
    end,
  },
}
