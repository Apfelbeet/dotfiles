local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = { "menuone" },
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	showmatch = true,
	showmode = true,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	softtabstop = 2,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 2,
	termguicolors = true,
	timeoutlen = 300,
	undofile = true,
	updatetime = 100,
	writebackup = false,
	expandtab = true,
	shiftwidth = 2,
	cursorline = true,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = true,
	scrolloff = 8,
	sidescrolloff = 8,
	guifont = "BlexMono NF:h18",
  synmaxcol = 8096,
  ve = "all"
}

vim.opt.shortmess:append("I")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])
vim.cmd([[let $LANG='en_US.UTF-8']])
vim.cmd([[let $NVIM_TUI_ENABLE_TRUE_COLOR=1]])

vim.g.extra_whitespace_ignored_filetypes = { "alpha", "TelescopePrompt" }

vim.g.neovide_transparency = 1.0
vim.g.neovide_remember_window_size = true

vim.g.symbols_outline = { auto_close = true, }
