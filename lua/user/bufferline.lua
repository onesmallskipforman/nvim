local M = {
  "akinsho/bufferline.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config(_, opts)
  require("bufferline").setup(opts)
  -- TODO: this doesn't work in init. why?
  vim.api.nvim_set_hl(0, "NvimTreeNormal", {
    bg=vim.api.nvim_get_hl(0, { name = "BufferLineFill", link = false})["bg"]
  })
end

M.opts = {
  options = {
    themable = true,
    close_command = function(bufnum) require('snacks').bufdelete.delete(bufnum) end, -- can be a string | function, see "Mouse actions"
    offsets = {
      {
        filetype = "NvimTree",
        text = "EXPLORER",
        padding = 0,
        text_align = "left",
        highlight = 'BufferLineFill',
        separator = false,
      },
    },
    separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
  },
}

return {
  require('user.snacks'),
  require('user.nvimtree'),
  M,
}
