return {
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  { "nvim-lua/plenary.nvim", lazy = true },
}
