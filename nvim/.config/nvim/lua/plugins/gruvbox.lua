return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "sainnhe/gruvbox-material",
    init = function()
      vim.cmd [[
        if has('termguicolors')
          set termguicolors
        endif
      ]]
      vim.cmd [[let g:gruvbox_material_background = 'hard']]
      vim.cmd.colorscheme "gruvbox-material"
      vim.cmd [[set clipboard+=unnamedplus]]
      vim.cmd [[set encoding=UTF-8]]
    end,
  },
}
