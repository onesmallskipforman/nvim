return {
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    cmd = {
      "TodoLocList",
      "TodoFzfLua",
    },
  },
  { "nvim-lua/plenary.nvim", lazy = true },
}
