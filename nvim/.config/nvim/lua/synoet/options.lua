local options = {
  cmdheight = 1,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  hlsearch = false,
  ignorecase = true,
  showmode = false,
  showtabline = 0,
  smartcase = true,
  smartindent = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 100,
  updatetime = 300,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  signcolumn = "yes",
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "monospace:h18",
}

vim.diagnostic.config({ virtual_lines = true })

for k, v in pairs(options) do
  vim.opt[k] = v
end


