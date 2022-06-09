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
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  }
}
