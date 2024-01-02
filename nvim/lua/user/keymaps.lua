local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Normal mode --
-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better inserting and deleting
keymap("n", "<leader>p", "\"_dp", opts)
keymap("n", "<leader>P", "\"_dP", opts)
keymap("v", "<leader>d", "\"_d", opts)

-- better <C-d> and <C-u> movement
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Better window navigation (including tmux)
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts)
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts)
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts)
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts)
keymap("n", "<C-p>", "<cmd>close!<cr>", opts)

-- Resize with arrows
keymap("n", "<Up>", "<cmd>resize -2<cr>", opts)
keymap("n", "<Down>", "<cmd>resize +2<cr>", opts)
keymap("n", "<Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<Right>", "<cmd>vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "]b", ":bnext<cr>", opts)
keymap("n", "[b", ":bprevious<cr>", opts)

-- Move single lines
keymap("n", "‹", ":m .-2<cr>==", opts)
keymap("n", "›", ":m .+1<cr>==", opts)

-- Visual mode --
-- Indent & stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "›", ":m '>+1<cr>gv=gv", opts)
keymap("v", "‹", ":m '>-2<cr>gv=gv", opts)

-- Pasting without yanking
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<cr>gv-gv", opts)
keymap("x", "K", ":move '<-2<cr>gv-gv", opts)
keymap("x", "›", ":move '>+1<cr>gv-gv", opts)
keymap("x", "‹", ":move '<-2<cr>gv-gv", opts)

-- Plugins --
-- Gitsigns
keymap("n", "[g", "<cmd>Gitsigns prev_hunk<cr>", opts)
keymap("n", "]g", "<cmd>Gitsigns next_hunk<cr>", opts)

-- Bufferline
keymap("n", "ξ", "<cmd>BufferLineCycleNext<cr>", opts)
keymap("n", "υ", "<cmd>BufferLineCyclePrev<cr>", opts)

for i = 1, 9 do
  keymap("n", "<leader>" .. i, '<cmd>lua require("bufferline").go_to(' .. i .. ", true)<cr>", opts)
end

-- Nvim Tree
keymap("n", "&", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "=", "<cmd>NvimTreeFocus<cr>", opts)

-- Bbye
keymap("n", "<Leader>Q", "<cmd>Bdelete<cr>", opts)
