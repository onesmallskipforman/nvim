return {
  {
    'brianhuster/live-preview.nvim',
    dependencies = { 'ibhagwan/fzf-lua' },
    cmd = { "LivePreview" },
  },
  {
    'jghauser/follow-md-links.nvim',
    lazy = false,
  },
  {
    "wallpants/github-preview.nvim",
    cmd = { "GithubPreviewToggle" },
    -- TODO: repeatedly calling require may be costly
    keys = {
      {"<leader>mpt", function() require("github-preview.functions").toggle() end, desc = "Toggle Github Preview"},
      {"<leader>mps", function() require("github-preview.functions").single_file_toggle() end, desc = "Toggle Single File Mode"},
      {"<leader>mpd", function() require("github-preview.functions").details_tags_toggle() end, desc = "Toggle Details Tags"},
    },
    ---@type github_preview_config
    opts = {
      cursor_line = {
        disable = true,
      },
    },
    -- config = function(_, opts)
    --   local gpreview = require("github-preview")
    --   gpreview.setup(opts)
    --
    --   local fns = gpreview.fns
    --   vim.keymap.set("n", "<leader>mpt", fns.toggle)
    --   vim.keymap.set("n", "<leader>mps", fns.single_file_toggle)
    --   vim.keymap.set("n", "<leader>mpd", fns.details_tags_toggle)
    -- end,
  }
}
