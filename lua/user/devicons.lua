return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {},
    cond = false,
  },
  {
    'echasnovski/mini.icons',
    opts = {},
    -- event = "VeryLazy",
    lazy = false,
    cond = true,
    config = function(_, opts)
      require("mini.icons").setup(opts)
      require("mini.icons").mock_nvim_web_devicons()
    end,
  }
}
