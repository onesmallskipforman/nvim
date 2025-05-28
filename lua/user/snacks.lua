-- TODO: try snacks file explorer
-- TODO: split into multiple specs for different lazy loading settings
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- bigfile      = { enabled = true },
    -- dashboard    = { enabled = true },
    -- explorer     = { enabled = true }, -- TODO: try this out
    indent    = {
      enabled = true,
      animate = {
        enabled = false,
      },
    },
    bufdelete = { enabled = true },
    input     = { enabled = true },
    terminal     = {
      enabled = true,
      win = {
        style = "terminal",
        wo = {
          winbar = "",
        },
      },
    },
    words     = {
      enabled  = false,
      debounce = 100,
    },
    -- gitbrowse = { enabled = true },
    -- git       = { enabled = true },
    -- picker       = { enabled = true },
    -- notifier     = { enabled = true },
    -- quickfile    = { enabled = true },
    -- scope        = { enabled = true },
    -- scroll       = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words        = { enabled = true },
  },
}
