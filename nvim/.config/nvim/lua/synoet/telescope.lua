local telescope = require('telescope')

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    file_ignore_patterns = { "%.git/", "node_modules", "coverage/", "__pycache__", "%.0" },
  },
  pickers = {
    find_files = {
      theme = "ivy"
    },
    buffers = {
      theme = "ivy"
    },
    live_grep = {
      theme = "ivy"
    },
    current_buffer_fuzzy_find = {
      theme = "ivy"
    }
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

telescope.load_extension('fzf')

