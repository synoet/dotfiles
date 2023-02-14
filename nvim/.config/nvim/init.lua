require('synoet.options')
require('synoet.colorscheme')
require('synoet.treesitter')
require('synoet.lsp')
require('synoet.coding')
require('synoet.misc')
require('synoet.keys')
require('synoet.ui')


return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- lsp
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  use "jose-elias-alvarez/null-ls.nvim"
  use "jay-babu/mason-null-ls.nvim"
  use "folke/trouble.nvim"
  use "VonHeikemen/lsp-zero.nvim"
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })


  use "nvim-treesitter/nvim-treesitter"
  use 'nvim-treesitter/nvim-treesitter-context'


  -- completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-buffer"
  use "github/copilot.vim"
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- misc
  use "lukas-reineke/indent-blankline.nvim"
  use "phaazon/hop.nvim"

  -- ui
  use "MunifTanjim/nui.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "akinsho/bufferline.nvim"
  use "nvim-lualine/lualine.nvim"
  use "nvim-neo-tree/neo-tree.nvim"
  use "SmiteshP/nvim-navic"
  use "lewis6991/gitsigns.nvim"
  use "sindrets/diffview.nvim"

  use "navarasu/onedark.nvim"
  use "folke/tokyonight.nvim"

end)
