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
  require("user.dressing"), -- ui improvements
  require("user.gitlinker"),
  require("user.gitsigns"),
  require("user.gitblame"),
  require("user.illuminate"),
  require("user.indentline"),
  require("user.lspconfig"),
  require("user.lualine"),
  require("user.mason"),
  require("user.nvimtree"),
  require("user.project"),
  require("user.telescope"),
  require("user.todo"),
  require("user.toggleterm"),
  require("user.treesitter"),
  --
  require ("user.whichkey"), -- TODO: whichkey NOW
  -- require ("user.cmd"),
  -- require ("user.noice"),
})



-- if you want generic, plugin agnostic maps (ie "leader-e opens file explorer")
-- then you can set up mappings using <Plug> in keymaps.lua and set their
-- functionality within each plugins 'init' block
-- see https://vi.stackexchange.com/questions/31012/what-does-plug-do-in-vim
-- add 'h <Plug>'
-- hmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
-- <Plug> is cool, but nothing is really stopping a plugin from accidentally
-- using the same <Plug> keys as you.
-- Idea: try specifying keys in keymaps.lua and have plugin configs import them
