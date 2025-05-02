local M = {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  lazy = true,
  cmd = "FzfLua"
}

M.keys = {
  {"<leader>f", "<cmd>FzfLua files<cr>"    , desc = 'Find Files' },
  {"<leader>F", "<cmd>FzfLua live_grep<cr>", desc = 'Find Files' },
  {"<leader>b", "<cmd>FzfLua buffers<cr>"  , desc = 'Find Files' },
  {"<leader>l", "<cmd>Telescope resume<cr>", desc = "Last Search"},
}

function M.config()
  require("fzf-lua").setup({
    actions = {
      files = {
        true,
        ["enter"] = require("fzf-lua").actions.file_edit,
      },
    },
  })
end

-- M.opts = {
--   actions = {
--     files = {
--       true,
--       -- TODO: seems excessive. this means require has to be called each time we want to hit enter
--       ["enter"] = function (...) require("fzf-lua").actions.file_edit(...) end,
--     },
--   },
-- }

return M
