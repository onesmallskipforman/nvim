-- TODO: idea: search from the directory of the current file
-- NOTE: https://www.reddit.com/r/neovim/comments/1hhiidm/comment/m2s4p8v/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
local M = {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  cmd = "FzfLua",
  dependencies = {
    require('user.devicons')
  },
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
      ["enter"] = function(...) require('fzf-lua').actions.file_edit(...) end,
    },
  },
  winopts = {
    border = vim.o.winborder~='' and vim.o.winborder or 'rounded',
    preview = {
      border = vim.o.winborder~='' and vim.o.winborder or 'rounded',
    }
  },
  grep = {
    follow = true
  },
}

return M
