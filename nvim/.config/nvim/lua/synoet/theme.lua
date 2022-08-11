vim.cmd [[
try
  colorscheme oxocarbon
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry]]
