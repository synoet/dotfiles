return {
  "cormacrelf/dark-notify",
  setup = function()
    require("dark-notify").run({
      onchange = function(mode)
          -- Set gruvbox material background based on mode
          if mode == "dark" then
            vim.g.gruvbox_material_background = "hard"
          else
            vim.g.gruvbox_material_background = "soft"
          end
          -- Reapply colorscheme to use new background setting
          vim.cmd("colorscheme gruvbox-material")
        end,
    });
  end,
}
