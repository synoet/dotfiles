return require('packer').startup(function()
  -- package manager
  use 'wbthomason/packer.nvim'

  -- tree sitter
  use 'nvim-treesitter/nvim-treesitter' 

  -- quickly comment out lines
  use 'tpope/vim-commentary'

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