-- TODO: set nvim to recognize camel_case and SnakeCase as having distinct words
-- TODO: https://github.com/nvim-lua/kickstart.nvim/pull/1495/files#diff-3604a286a2c7be927f13d640e83f92c709c296b63ce28e9ac05849f437876d54
-- For more options, you can see `:help option-list`
vim.loader.enable()                         -- enable experimental vim loader
-- vim.lsp.set_log_level("debug")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.netrw_banner = 0
-- vim.g.netrw_mouse = 2
local opt = vim.o

opt.backup = false            -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 1             -- more space in the neovim command line for displaying messages
opt.conceallevel = 0          -- so that `` is visible in markdown files
opt.fileencoding = "utf-8"    -- the encoding written to a file
opt.hlsearch = true           -- highlight all matches on previous search pattern
opt.ignorecase = true         -- ignore case in search patterns
opt.mouse = "a"               -- allow the mouse to be used in neovim
opt.pumheight = 10            -- pop up menu height
opt.showmode = false          -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 0           -- always show tabs
opt.smartcase = true          -- smart case
opt.smartindent = true        -- make indenting smarter again
opt.splitbelow = true         -- force all horizontal splits to go below current window
opt.splitright = true         -- force all vertical splits to go to the right of current window
opt.swapfile = false          -- creates a swapfile
opt.termguicolors = true      -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000 -- 100  -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true           -- enable persistent undo
opt.updatetime = 300          -- faster completion (4000ms default)
opt.writebackup = false       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true          -- convert tabs to spaces
opt.shiftwidth = 4            -- the number of spaces inserted for each indentation
opt.tabstop = 4               -- insert 2 spaces for a tab
opt.cursorline = false         -- highlight the current line
opt.number = true             -- set numbered lines
opt.numberwidth = 4           -- set number column width to 2 {default 4}
opt.signcolumn = "yes"        -- always show the sign column, otherwise it would shift the text each time
opt.statuscolumn="%=%l%s%C"
opt.laststatus = 3
opt.showcmd = false
opt.ruler = false
opt.relativenumber = false    -- set relative numbered lines
opt.wrap = false              -- display lines as one long line
opt.scrolloff = 8             -- is one of my fav
opt.sidescrolloff = 8
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.incsearch = true          -- prevent incremental highlight while typing a search
-- opt.winborder = 'rounded' -- NOTE: https://github.com/folke/lazy.nvim/issues/1951
opt.fillchars =
  'eob: '
  .. ',vert: '
  -- .. 'vert:│'
  .. ',vertright:─'
  .. ',vertleft:─'
  .. ',verthoriz:─'

vim.filetype.add {
  extension = {
    launch = "xml",
  },
  pattern = {
    Jenkinsfile = "groovy",
    [".*rc"] = "bash",
  }
}

local icons = require("user.icons")
local default_diagnostic_config = {
  signs = {
    active = true,
    values = {
      { name = "DiagnosticSignError", text = icons.diagnostics.Error },
      { name = "DiagnosticSignWarn" , text = icons.diagnostics.Warning },
      { name = "DiagnosticSignHint" , text = icons.diagnostics.Hint },
      { name = "DiagnosticSignInfo" , text = icons.diagnostics.Information },
    },
  },
  virtual_text = false,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}
vim.diagnostic.config(default_diagnostic_config)
