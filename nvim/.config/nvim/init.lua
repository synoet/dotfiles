require('synoet.options')
require('synoet.colorscheme')
require('synoet.autocmd')
require('synoet.ui')
require('synoet.treesitter')
require('synoet.lsp')
require('synoet.coding')
require('synoet.misc')
require('synoet.keys')


return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- lsp
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  use "folke/trouble.nvim"
  use "VonHeikemen/lsp-zero.nvim"

  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    run = function()
      require("lsp_lines").setup()
    end,
  })

  use "nvim-treesitter/nvim-treesitter"
  use 'nvim-treesitter/nvim-treesitter-context'

  -- completion
  use "hrsh7th/nvim-cmp"
  use "onsails/lspkind.nvim"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-buffer"
  use {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  }
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use "j-hui/fidget.nvim"
  use {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

  -- misc
  use "lukas-reineke/indent-blankline.nvim"
  use "phaazon/hop.nvim"
  use "folke/todo-comments.nvim"
  use "tpope/vim-commentary"
  use "mhartington/formatter.nvim"
  use "ray-x/lsp_signature.nvim"

  -- ui
  use "MunifTanjim/nui.nvim"
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"
  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use "romgrk/barbar.nvim"
  use "nvim-lualine/lualine.nvim"
  use "nvim-neo-tree/neo-tree.nvim"
  use "lewis6991/gitsigns.nvim"
  use "sainnhe/gruvbox-material"
  use "sindrets/diffview.nvim" 
  use 'sbdchd/neoformat'
  use 'kassio/neoterm'
  use "NeogitOrg/neogit"
  use "tpope/vim-fugitive"
  use 'mg979/vim-visual-multi'
  use "sainnhe/everforest"
  use 'mhartington/formatter.nvim'
  use({
    "neanias/everforest-nvim",
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        background = "hard",
      })
    end,
  })
end)

