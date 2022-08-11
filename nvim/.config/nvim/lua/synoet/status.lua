local function branding()
  return [[ﬦ]]
end

require('lualine').setup {
  options = {
    icons_enabled = false,
    globalStatus = true,
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {branding},
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }

}
