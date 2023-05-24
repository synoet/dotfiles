vim.opt.termguicolors = true

-- require("bufferline").setup{}
-- require("barbar").setup{}

require("telescope").setup{
  defaults = {
    file_ignore_patterns = {"node_modules"},
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension("refactoring")


require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}

require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = ' +', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = ' ~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = ' -', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = ' -', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = ' ~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
}

require("trouble").setup {
  position = "left",
  auto_open = false,
  auto_closer = false,
}

