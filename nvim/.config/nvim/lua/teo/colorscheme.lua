vim.o.termguicolors = true

vim.cmd [[
try
	set background=dark
  colorscheme ayu 
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
