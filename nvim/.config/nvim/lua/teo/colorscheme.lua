vim.o.termguicolors = true
vim.g.ayucolor="mirage"

vim.cmd [[
try
  colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
