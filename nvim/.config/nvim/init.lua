-- Treesitter Config
require('synoet.treesitter')

-- Keymappings
require('synoet.keymap')

-- Neorg Config
require('synoet.org')

-- Lualine Config
require('synoet.status')

-- Indentation Config
require('synoet.indent')

-- Theme Config
require('synoet.theme')


-- Git Config
require('synoet.git')

-- Telescope Config
require('synoet.telescope')


local options = {
  cmdheight = 1,
  completeopt = { "menuone",  "noselect" },
  conceallevel = 0,
  hlsearch = false,
  ignorecase = true,
  showmode = false,
  showtabline = 0,
  smartcase = true,
  smartindent = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 100,
  updatetime = 300,
  expandtab= true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  signcolumn = "yes",
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "monospace:h20",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end


return require('packer').startup(function()
  -- package manager
  use 'wbthomason/packer.nvim'

  -- tree sitter
  use 'nvim-treesitter/nvim-treesitter' 

  -- quickly comment out lines
  use 'tpope/vim-commentary'

  -- set characters for line indentations
  use 'lukas-reineke/indent-blankline.nvim'

  -- Color Scheme
  use 'projekt0n/github-nvim-theme'

  -- Git Signs
  use 'lewis6991/gitsigns.nvim'

  -- Lsp 
  use 'neovim/nvim-lspconfig'
  use "williamboman/nvim-lsp-installer"

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

  -- neorg for documentation
  use {
    'nvim-neorg/neorg',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

  -- completion engine
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-path"

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- git
  use {
    'TimUntersberger/neogit',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

end)


