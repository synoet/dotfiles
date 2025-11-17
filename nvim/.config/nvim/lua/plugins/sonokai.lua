return {
  "sainnhe/sonokai",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.sonokai_style = 'shusia'
    vim.g.sonokai_enable_italic = true
    vim.g.sonokai_diagnostic_text_highlight = 1
    vim.g.sonokai_diagnostic_virtual_text = 'colored'
    vim.g.sonokai_better_performance = 1
  end,
}
