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
  completeopt = { "menuone", "noselect" },
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
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  signcolumn = "yes",
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "monospace:h20",
}

vim.diagnostic.config({ virtual_lines = true })

for k, v in pairs(options) do
  vim.opt[k] = v
end


return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  -- using packer.nvim
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }

  use 'nvim-treesitter/nvim-treesitter'
  use 'tpope/vim-commentary'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'lewis6991/gitsigns.nvim'

  use 'neovim/nvim-lspconfig'
  use "williamboman/nvim-lsp-installer"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"
  --
  -- color scheme
  use "navarasu/onedark.nvim"

  use "github/copilot.vim"

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }


  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
          width = 500, -- width of the Zen window
          height = 1, -- height of the Zen window
          options = {

          },
        },
      }
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })

  use {
  "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

end)
