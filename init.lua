vim.loader.enable()
-- vim.lsp.set_log_level("debug")
require("user.options")
require("user.keymaps")
require("user.autocommands")
require("user.lazy").setup({
  -- require("user.alpha"),
  require("user.autopairs"),
  require("user.bufferline"),
  -- require("user.cmp"),
  require("user.colorscheme"),
  require("user.comment"),
  -- require("user.devicons"),
  -- require("user.dressing"),
  -- require("user.gitlinker"),
  -- require("user.gitsigns"),
  -- require("user.gitblame"),
  -- require("user.illuminate"),
  -- require("user.indentline"),
  -- require("user.lspconfig"),
  -- require("user.lualine"),
  -- require("user.mason"),
  require("user.nvimtree"),
  require("user.fzf"),
  -- require("user.project"), -- TODO: doesn't seem to be working
  -- require("user.workspaces"),
  -- require("user.telescope"),
  -- require("user.todo"),
  -- require("user.toggleterm"),
  -- require("user.treesitter"),
  -- require("user.whichkey"),
  -- require("user.colorizer"),
  -- require("user.noice")
  {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
  },
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

-- TODO: set nvim to recognize camel_case and SnakeCase as having distinct words


-- TODO:  figure out how to change lsp cmd when doing LspRestart so that clangd can use the cwd or current workspace
-- also consider https://github.com/VonHeikemen/lsp-zero.nvim

-- TODO: im not sure telescope is using fzf
