require('synoet.treesitter')
require('synoet.keymap')
require('synoet.org')
require('synoet.status')
require('synoet.indent')
require('synoet.theme')
require('synoet.git')
require('synoet.telescope')
require('synoet.cmp')
require('synoet.lsp')

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
  use 'wbthomason/packer.nvim'

  use 'nvim-treesitter/nvim-treesitter' 
  use 'tpope/vim-commentary'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'lewis6991/gitsigns.nvim'

  use 'neovim/nvim-lspconfig'
  use "williamboman/nvim-lsp-installer"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

  use {
    'nvim-neorg/neorg',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'TimUntersberger/neogit',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

end)
