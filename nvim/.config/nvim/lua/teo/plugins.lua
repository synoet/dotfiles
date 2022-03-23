local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
	-- Some Random Things
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "moll/vim-bbye" -- allows for deleting buffers and windows
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

	-- Visual things
  use "Shatur/neovim-ayu" -- Color Scheme
  use "nvim-lualine/lualine.nvim" -- status line for nvim
  use "lukas-reineke/indent-blankline.nvim"
  use "kyazdani42/nvim-web-devicons" -- Icons for Neovim Tree
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

	-- snippet stuff
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- lsp stuff
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "jose-elias-alvarez/nvim-lsp-ts-utils" -- typescript stuff

  -- Telescope
  use "nvim-telescope/telescope.nvim"

	-- Fuzzy Finder
	use 'airblade/vim-rooter' -- root into base of curent files dir

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

	-- Typescript Stuff
  use "JoosepAlviste/nvim-ts-context-commentstring"

	-- Show Git Diff on side panel
  use "lewis6991/gitsigns.nvim"

  -- Github Copilot --
  use "github/copilot.vim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
