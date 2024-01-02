-- Autoformat some code when saving
vim.cmd([[
  augroup _rust
    autocmd!
    autocmd FileType rust,vue,typescript,javascript autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
  augroup end
]])

-- Close Vim if NvimTree is the last open window
vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
  end,
})

-- Fix gruvbox transparent background
-- vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")

