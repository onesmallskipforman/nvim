local M = {
  "nvim-lualine/lualine.nvim",
  -- commit = "7533b0ead663d80452210c0c089e5105089697e5",
  lazy = false,
}

function M.config()
  local icons = require "user.icons"
  local diff = {
    "diff",
    colored = true,
    symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
  }

-- local diagnostics = {
--   "diagnostics",
--   sources = { "nvim_diagnostic" },
--   sections = { "error", "warn" },
--   symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
--   colored = false,
--   update_in_insert = false,
--   always_visible = true,
-- }
--
-- local spaces = function()
--   return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },

      ignore_focus = { "NvimTree" },


      -- theme = 'pywal16-nvim',

    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" }, --, icon =""} },
      lualine_c = { diff },
--     lualine_x = { diff, spaces, "encoding", filetype },
      lualine_x = { "diagnostics" }, -- { diagnostics },
      lualine_y = { "filetype" },
      lualine_z = { "progress" },
      -- lualine_z = { "location", padding = { left = 0, right = 1 } },
    },
    extensions = { "quickfix", "man", "fugitive", "nvim-tree", "toggleterm" },
  }
end

return M
