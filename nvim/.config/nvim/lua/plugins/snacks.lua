-- lazy.nvim
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    styles = {
      zen = {
        width = 170,
      },
    },
  },
  keys = {

    { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
  },
}
