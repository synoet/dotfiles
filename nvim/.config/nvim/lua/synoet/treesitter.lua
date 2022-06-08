require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "lua",
    "rust",
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
    "latex",
    "bash",
    "json",
    "yaml"
  },
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
  },
  ident = {
    enable = true,
  }
}