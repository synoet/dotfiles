return {
  "smoka7/hop.nvim",
  opts = {
    highlight_keys = {
      HopNextKey = { fg = "#C96C7F", bold = true, underline = true },
      HopNextKey1 = { fg = "#60d0c0", bold = true },
      HopNextKey2 = { fg = "#a0c0f0" },
      HopUnmatched = { fg = "#6c6c6c" },
    },
  },
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["s"] = { function() require("hop").hint_words() end, desc = "Hop hint words" },
          ["<S-s>"] = { function() require("hop").hint_lines() end, desc = "Hop hint lines" },
        },
        x = {
          ["s"] = { function() require("hop").hint_words { extend_visual = true } end, desc = "Hop hint words" },
          ["<S-s>"] = {
            function() require("hop").hint_lines { extend_visual = true } end,
            desc = "Hop hint lines",
          },
        },
      },
    },
  },
}
