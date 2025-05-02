return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    name = "gruvbox",
    priority = 1000,
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
      -- NOTE: This theme links vim-illuminate groups to lspreference groups
      overrides = {
          SignColumn        = { link = "Normal"     }, -- TODO: might want to do this for all themes
      },
    },
    config = function(_,opts)
        require("gruvbox").setup(opts)
        -- load the colorscheme here
        vim.cmd.colorscheme("gruvbox")
        -- vim.api.nvim_set_hl(0, "SignColumn", { link="Normal" })
    end,
  },
  { "lunarvim/colorschemes"  }, -- Multiple colorschemes to try out
  { "lunarvim/darkplus.nvim" }, -- Colorscheme
  {
    "oncomouse/lushwal.nvim",
    -- lazy = false,
    -- priority = 1000,
    dependencies = {
      { "rktjmp/lush.nvim" },
      { "rktjmp/shipwright.nvim" },
    },

    -- https://github.com/oncomouse/lushwal.nvim/issues/3
    init = function()
      vim.g.lushwal_configuration = {
        compile_to_vimscript = false,
      }
    end,

    config = function()
      require("lushwal").add_reload_hook({
        vim.cmd("LushwalCompile")
      })
    end,
    cmd = { "LushwalCompile" },
  },
  {
    "AlphaTechnolog/pywal.nvim",
    opts = {},
  },
  {
    "uZer/pywal16.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require('pywal16').setup()
      vim.cmd.colorscheme("pywal")
    end,
  },
}
