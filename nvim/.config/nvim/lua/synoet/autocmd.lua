--vim.api.nvim_create_autocmd("VimEnter", {
  --o
  --command="NeoTreeShow",
--})
--
--
-- Only want lsp lines to be turned on when im done typing otherwhise it gets in the way
vim.cmd([[
  augroup ToggleCommandOnInsert
    autocmd!
    autocmd InsertEnter * let g:command_enabled = 0 | lua require('lsp_lines').toggle()
    autocmd InsertLeave * let g:command_enabled = 1 | lua require('lsp_lines').toggle()
  augroup END
]])

vim.cmd([[
  augroup AutoOrderBuffer
    autocmd!
    autocmd BufWinEnter * BufferOrderByBufferNumber
  augroup END
]])

-- vim.cmd([[
--   augroup fmt
--     autocmd!
--     autocmd BufWritePre * undojoin | Neoformat
--   augroup END
-- ]])
