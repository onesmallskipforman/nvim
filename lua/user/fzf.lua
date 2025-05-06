local M = {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua"
}

M.keys = {
  {"<leader>f" , "<cmd>FzfLua files<cr>"    , desc = 'Find Files' },
  {"<leader>F" , "<cmd>FzfLua live_grep<cr>", desc = 'Find Files' },
  {"<leader>b" , "<cmd>FzfLua buffers<cr>"  , desc = 'Find Files' },
  {"<leader>sl", "<cmd>FzfLua resume<cr>", desc = "Last Search"},
}

M.opts = {
  actions = {
    files = {
      true,
      ["enter"] = function(...) FzfLua.actions.file_edit(...) end,
    },
  },
}

return M
