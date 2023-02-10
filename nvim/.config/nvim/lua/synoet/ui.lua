vim.opt.termguicolors = true

require("bufferline").setup{}

require("telescope").setup{
  pickers = {
    current_buffer_fuzzy_find = {
      theme = "ivy",
    },
    find_files = {
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy",
    },
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


require("lualine").setup{}

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

