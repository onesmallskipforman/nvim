vim.loader.enable()
-- vim.lsp.set_log_level("debug")
require("user.options")
require("user.keymaps")
require("user.autocommands")
require("user.lazy").setup({
  require("user.alpha"),
  require("user.autopairs"),
  require("user.bufferline"),
  require("user.cmp"),
  require("user.colorizer"),
  require("user.colorscheme"),
  require("user.comment"),
  require("user.devicons"),
  require("user.gitblame"),
  require("user.gitlinker"),
  require("user.gitportal"),
  require("user.gitsigns"),
  require("user.illuminate"),
  -- require("user.indentline"),


  {
    "nvimdev/indentmini.nvim",
    lazy = false,
    opts = {},
  },

  -- require("user.lspconfig"),
  -- {
  --   -- TODO: finish setup: https://github.com/folke/lazydev.nvim?tab=readme-ov-file#-installation
  --   "folke/lazydev.nvim",
  --   ft = "lua",
  --   opts = {},
  -- },
  require("user.lualine"),
  -- require("user.mason"),
  -- require("user.markdown-preview"),
  require("user.nvimtree"),
  require("user.fzf"),
  -- require("user.project"), -- TODO: doesn't seem to be working
  require("user.snacks"),
  -- require("user.workspaces"),
  -- require("user.telescope"),
  require("user.todo"),
  -- require("user.toggleterm"),
  -- require("user.treesitter"),
  require("user.whichkey"),
  -- require("user.noice")
  {
    'Vonr/align.nvim',
    branch = "v2",
    lazy = true,
    init = function()
      -- Create your mappings here
    end
  },
  -- { 'echasnovski/mini.align', version = '*', config = true, lazy = false },


})
vim.lsp.enable('luals')

-- TODO: what does 'version' default do in lazy.nvim?
-- TODO: set nvim to recognize camel_case and SnakeCase as having distinct words
-- TODO:  figure out how to change lsp cmd when doing LspRestart so that clangd can use the cwd or current workspace
-- also consider https://github.com/VonHeikemen/lsp-zero.nvim
-- TODO: im not sure telescope is using fzf



-- NOTE: use :command commandName to inspect the lua source of a vimscript command
