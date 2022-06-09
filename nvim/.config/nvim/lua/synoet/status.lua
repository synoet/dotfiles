require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    globalStatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_z = {'buffers'}
  }

}