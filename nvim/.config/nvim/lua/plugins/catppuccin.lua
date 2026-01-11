return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      color_overrides = {
        frappe = {
          green = "#9ed576",
          yellow = "#d1b57d",
          base = "#14181F",
          mantle = "#14181F",
          crust = "#14181F",
        },
      },
    }
  end,
}
