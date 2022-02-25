local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#252631',
  fg       = '#bbc2cf',
  yellow   = '#f1fa8c',
  cyan     = '#8be9fd',
  darkblue = '#8be9fd',
  green    = '#50fa7b',
  orange   = '#ffb86c',
  violet   = '#ff79c6',
  purple   = '#bd93f9',
  magenta  = '#bd93f9',
  blue     = '#8be9fd',
  red      = '#ff5555',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = ' | ',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left({
  function()
    return '▍'
  end,
  color = { fg = colors.purple }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
  -- mode component
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.green,
      i = colors.violet,
      v = colors.yellow,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
    return ''
  end,
  color = 'LualineMode',
  padding = { right = 1 },
})



ins_left({
  'filename',
  path = 1,
  cond = conditions.buffer_not_empty,
  color = { fg = colors.purple},
})




ins_left({ 'location' })

ins_left({ 'progress', color = { fg = colors.fg} })



-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_right({
  function()
    return '%='
  end,
})

ins_right({
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.orange },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.blue },
  },
})

ins_right({
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
})

ins_right({
  -- Lsp server name .
  function()
    local msg = 'none'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  color = { fg = '#ffffff', gui = 'bold' },
})-- Add components to right sections

ins_right({
  'branch',
  icon = 'שׂ',
  color = { fg = colors.green},
})
-- Now don't forget to initialize lualine
lualine.setup(config);
