require('hop').setup{}
require("rust-tools").setup {}
require("copilot").setup({
  suggestion  = {
    enabled = true,
    auto_trigger = true,
  }
})

require('spectre').setup()
