require('synoet.treesitter')
require('synoet.keymap')
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

vim.diagnostic.config({virtual_lines = true})

for k, v in pairs(options) do
  vim.opt[k] = v
end


return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  --
  -- colorscheme
  use {'shaunsingh/oxocarbon.nvim', run = './install.sh'}

  use 'nvim-treesitter/nvim-treesitter' 
  use 'tpope/vim-commentary'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'navarasu/onedark.nvim'

  use 'neovim/nvim-lspconfig'
  use "williamboman/nvim-lsp-installer"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"

  use {
  "chrisbra/Colorizer",
    config = function()
      require("vim-css-color").setup{}
    end
  }

  use "github/copilot.vim"

  use {
    "folke/todo-comments.nvim",
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function()
      require("todo-comments").setup{}
    end
  }

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

  use {
    'tzachar/cmp-tabnine',
    run='./install.sh',
    requires={{'nvim-lua/plenary.nvim'}}
  }

  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })

end)
