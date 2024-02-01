-- vim.lsp.set_log_level("debug")
require("user.options")
require("user.keymaps")
require("user.autocommands")
require("user.lazy").setup({
  require("user.alpha"),
  require("user.autopairs"),
  require("user.bufferline"),
  require("user.cmp"),
  require("user.colorscheme"),
  require("user.comment"),
  require("user.devicons"),
  require("user.dressing"),
  require("user.gitlinker"),
  require("user.gitsigns"),
  require("user.gitblame"),
  require("user.illuminate"),
  require("user.indentline"),
  require("user.lspconfig"),
  require("user.lualine"),
  require("user.mason"),
  require("user.nvimtree"),
  require("user.project"), -- TODO: doesn't seem to be working
  require("user.telescope"),
  require("user.todo"),
  require("user.toggleterm"),
  require("user.treesitter"),
  require("user.whichkey"),
  require("user.colorizer"),
  -- require("user.noice")
})

-- TODO: set nvim to recognize camel_case and SnakeCase as having distinct words
