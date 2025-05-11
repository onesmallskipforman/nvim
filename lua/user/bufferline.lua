-- TODO: figure out how to not switch to tabs in a documentation ":h" buffer
-- TODO: consider barbar.nvim
local M = {
  "akinsho/bufferline.nvim",
  -- event = "BufReadPre",
  event = { "BufEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

M.keys = {
  {"<leader>c", function() require('snacks').bufdelete.delete() end, desc = "Close Buffer"},
}

local icons = require("user.icons")

function M.config(_, opts)
  require("bufferline").setup(opts)
  -- TODO: this doesn't work in init. why?
  vim.api.nvim_set_hl(0, "NvimTreeOffset", {
    fg=vim.api.nvim_get_hl(0, { name = "TabLine"       , link = false})["bg"],
    bg=vim.api.nvim_get_hl(0, { name = "BufferLineFill", link = false})["bg"],
    force = true,
  })
  vim.api.nvim_set_hl(0, "NvimTreeNormal", {
    bg=vim.api.nvim_get_hl(0, { name = "BufferLineFill", link = false})["bg"]
  })
end

M.opts = {
  options = {
    close_command = function(bufnum) require('snacks').bufdelete.delete(bufnum) end, -- can be a string | function, see "Mouse actions"
    offsets = { {
      filetype = "NvimTree",
      text = "EXPLORER",
      padding = 0,
      text_align = "left",
      -- highlight = 'BufferLineFill',
      highlight = 'NvimTreeOffset',
      -- separator = " ",
      -- separator = icons.ui.BoldLineLeft,
    } },
    separator_style = "slant",            -- | "thick" | "thin" | { 'any', 'any' },
  },
  highlights = {
    fill = {
      -- fg = { attribute = "fg", highlight = "TabLine" },
      -- bg = { attribute = "bg", highlight = "TabLine" },
      -- fg = '#161616',
      -- bg = '#161616'
    },
    background = {
      -- fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    -- buffer_visible = {
    --   fg = { attribute = "fg", highlight = "Normal" },
    --   bg = { attribute = "bg", highlight = "Normal" },
    -- },
    buffer_selected = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
      -- fg = { attribute = "fg", highlight = "BufferLineTabSelected" },
      -- bg = { attribute = "bg", highlight = "BufferLineTabSelected" },
    },
    close_button = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    close_button_visible = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    modified = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    -- modified_selected = {
    --   fg = { attribute = "fg", highlight = "Normal" },
    --   bg = { attribute = "bg", highlight = "Normal" },
    -- },
    modified_visible = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    offset_separator = {
      fg = { attribute = "fg", highlight = "WinSeparator" },
      -- bg = { attribute = "bg", highlight = "WinSeparator" },
    },
  --   tab_selected = {
  --     fg = { attribute = "fg", highlight = "Normal" },
  --     bg = { attribute = "bg", highlight = "Normal" },
  --   },
  --   tab = {
  --     fg = { attribute = "fg", highlight = "TabLine" },
  --     bg = { attribute = "bg", highlight = "TabLine" },
  --   },
  --   tab_close = {
  --     -- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
  --     fg = { attribute = "fg", highlight = "TabLineSel" },
  --     bg = { attribute = "bg", highlight = "Normal" },
  --   },
    -- duplicate_selected = {
    --   fg = { attribute = "fg", highlight = "TabLine" },
    --   bg = { attribute = "bg", highlight = "Normal" },
    --   -- italic = true,
    -- },
    -- duplicate_visible = {
    --   -- fg = { attribute = "fg", highlight = "TabLine" },
    --   bg = { attribute = "bg", highlight = "TabLine" },
    --   italic = false,
    -- },
    duplicate = {
      -- fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
      italic = false,
      -- italic = true,
    },
    separator = {
      -- fg = { attribute = "bg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "Tabline" },
    },
    separator_selected = {
      -- fg = { attribute = "bg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    -- separator_visible = {
    --   -- fg = { attribute = "bg", highlight = "TabLine" },
    --   bg = { attribute = "bg", highlight = "Normal" },
    -- },
  --   indicator_selected = {
  --     fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
  --     bg = { attribute = "bg", highlight = "Normal" },
  --   },
  },
}

return {
  -- require('user.snacks'),
  {
    "folke/snacks.nvim",
    lazy = true,
    opts = {
      bufdelete = { enabled = true },
    },
  },
  M,
}
