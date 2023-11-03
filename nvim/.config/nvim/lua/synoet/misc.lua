vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("ibl").setup {}

require("todo-comments").setup{}

require("treesitter-context").setup {
  enable = true,
}

require "lsp_signature".setup()

