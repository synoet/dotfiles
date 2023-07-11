vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_end_of_line = false,
    show_current_context_start = true,
}

require("todo-comments").setup{}

require("treesitter-context").setup {
  enable = true,
}

require "lsp_signature".setup()

