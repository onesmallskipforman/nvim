require("user.options")
require("user.keymaps")
require("user.autocommands")
require("user.lazy").setup({
  require("user.alpha"),
  require("user.blink-cmp"),
  require("user.blink-pairs"),
  require("user.bufferline"),
  require("user.colorizer"),
  require("user.colorscheme"),
  require("user.conform"),
  require("user.dap"),
  require("user.devicons"),
  require("user.fzf"),
  require("user.gitblame"),
  require("user.gitlinker"),
  require("user.gitportal"),
  require("user.gitsigns"),
  require("user.lazydev"),
  require("user.lualine"),
  require("user.markdown"),
  require("user.mason-lspconfig"),
  require("user.mini-align"),
  require("user.mini-cursorword"),
  require("user.mini-pairs"),
  require("user.mini-surround"),
  -- require("user.noice"),
  require("user.nvimtree"),
  require("user.snacks"),
  require("user.todo"),
  require("user.treesitter"),
  require("user.treesitter-textobjects"),
  require("user.ts-comments"),
  require("user.whichkey"),
})
vim.cmd.colorscheme("gruvbox")
-- NOTE: This theme links mini.cursorword groups to lspreference groups
-- make sure mini.cursorword highlighting is aligned with lsp highlighting
-- vim.api.nvim_set_hl(0, "LspReferenceText"     , { underline = true })
-- vim.api.nvim_set_hl(0, "LspReferenceRead"     , { underline = true })
-- vim.api.nvim_set_hl(0, "LspReferenceWrite"    , { underline = true })
vim.api.nvim_set_hl(0, "LspReferenceText"     , { link = "CursorLine" })
vim.api.nvim_set_hl(0, "LspReferenceRead"     , { link = "CursorLine" })
vim.api.nvim_set_hl(0, "LspReferenceWrite"    , { link = "CursorLine" })
vim.api.nvim_set_hl(0, "MiniCursorWord"       , { link = "CursorLine" })
vim.api.nvim_set_hl(0, "MiniCursorWordCurrent", { link = "CursorLine" })
