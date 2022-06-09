require('telescope').setup{
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = {"%.git/", "node_modules", "coverage/", "__pycache__", "%.0"},
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy",
    }
  },
  extensions = {
    -- ...
  }
}
