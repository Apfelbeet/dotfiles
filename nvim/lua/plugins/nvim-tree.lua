return {
	"kyazdani42/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	config = function()
		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
			vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
		end

		require("nvim-tree").setup({
			on_attach = on_attach,
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = false,
			hijack_cursor = false,
			update_cwd = true,
			diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
				ignore_list = {},
			},
			view = {
				width = 30,
				hide_root_folder = false,
				side = "left",
				number = false,
				relativenumber = false,
			},
			actions = {
				open_file = {
					quit_on_open = false,
					resize_window = false,
					window_picker = {
						enable = false,
					},
				},
			},
			git = {
				enable = true,
				ignore = true,
				timeout = 400,
			},
		})
	end,
}
