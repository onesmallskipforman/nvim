return {
  "norcalli/nvim-colorizer.lua",
  lazy = false,
  -- event = "VeryLazy",

  config = function() require("colorizer").setup({
    css = {rgb_fn = true},
  }) end,
}
