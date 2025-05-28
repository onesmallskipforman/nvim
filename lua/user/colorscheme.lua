-- NOTE: priority = 1000, lazy = false are omitted in favor of just calling
-- vim.cmd.colorscheme in init.lua, which appears to provide the same priority
return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string
      overrides = {
          SignColumn = { link = "Normal" }, -- TODO: might want to do this for all themes
      },
    },
  },
  {
    "RedsXDD/neopywal.nvim",
    opts = {},
  },
  {
    "lunarvim/darkplus.nvim",
    opts = {},
  },
  {
    "loctvl842/monokai-pro.nvim",
    opts = {},
  },
  {
    "ofirgall/ofirkai.nvim",
    opts = {},
  },
}
