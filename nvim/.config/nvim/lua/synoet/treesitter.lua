require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "help", "python", "rust", "javascript", "typescript" },
  sync_install = false,
  ignore_install = {"help"},

  auto_install = true,


  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
