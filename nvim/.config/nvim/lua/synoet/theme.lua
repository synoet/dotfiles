-- require('onedark').setup {
--     style = 'darker'
-- }
-- require('onedark').load()

vim.cmd [[
try
  colorscheme ayu
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry]]
