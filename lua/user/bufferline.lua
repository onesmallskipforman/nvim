-- TODO: figure out how to not switch to tabs in a documentation ":h" buffer
local M = {
  "akinsho/bufferline.nvim",
  -- commit = "c7492a76ce8218e3335f027af44930576b561013",
  event = { "BufEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
  dependencies = {
    {
      "famiu/bufdelete.nvim",
      -- commit = "8933abc09df6c381d47dc271b1ee5d266541448e",
      init = function()
        vim.keymap.set("n", "<leader>c", "<cmd>Bdelete!<CR>", { desc = "Close Buffer" })
      end
    },
  },
}

local icons = require("user.icons")

function M.config()
  require("bufferline").setup {
    options = {
      close_command = "Bdelete! %d",       -- can be a string | function, see "Mouse actions"
      -- right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
      offsets = { {
        filetype = "NvimTree",
        text = "EXPLORER",
        padding = 0,
        text_align = "left",
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
end

return M
