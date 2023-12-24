return {
  {
    "VonHeikemen/fine-cmdline.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "MunifTanjim/nui.nvim",
        event = "VeryLazy",
      },
    },
    init = function ()
      vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
    end
  },
  -- TODO: needs work. currently this plugin uses a custom highlight function
  -- that can only be cleared with :SearchBoxClear
  -- see https://github.com/VonHeikemen/searchbox.nvim/issues/16
  {

    "VonHeikemen/searchbox.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "MunifTanjim/nui.nvim",
        event = "VeryLazy",
      },
    },
    config = function()
      require('searchbox').setup{
        defaults = {
          clear_matches = false,
          show_matches = true,
        },
      }
    end,
    init = function ()
      vim.api.nvim_set_keymap('n', '/', '<cmd>SearchBoxMatchAll<CR>', {noremap = true})
    end
  }
}
