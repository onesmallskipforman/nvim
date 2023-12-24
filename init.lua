local LAZY_PLUGIN_SPEC = {}
function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

require "user.options"
require "user.keymaps" -- TODO: all require statements are failing
require "user.autocommands"
spec "user.alpha"
spec "user.autopairs"
spec "user.bufferline"
spec "user.cmp" -- TODO: settle on icons and fix cmd/search modes
spec "user.colorscheme"
spec "user.comment"
spec "user.devicons"
spec "user.dressing" -- ui improvements
spec "user.gitlinker"
spec "user.gitsigns"
spec "user.gitblame"
-- spec "user.illuminate"
spec "user.indentline"
spec "user.lspconfig"
spec "user.lualine"
spec "user.mason"
spec "user.nvimtree"
spec "user.project"
spec "user.schemastore"
spec "user.telescope"
spec "user.toggleterm"
spec "user.treesitter"
--
spec "user.whichkey"
-- spec "user.cmd"

-- TODO: get NOTE and TODO highlighted again
-- use({'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" } })
-- TOOD: try ctags

-- MAJOR TODO
-- move plugin-specific keymaps to lazy's 'keys' or 'init'
-- add conditional checks (or plugin dependencies) if keymaps require additional plugins
-- while it may seem nice to have keymaps all in one place, you cannot stop new plugins
-- from imposing additional keymaps
-- if you want generic, plugin agnostic maps (ie "leader-e opens file explorer")
-- then you can set up mappings using <Plug> in keymaps.lua and set their
-- functionality within each plugins 'init' block
-- see https://vi.stackexchange.com/questions/31012/what-does-plug-do-in-vim
-- add 'h <Plug>'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = LAZY_PLUGIN_SPEC,
  install = {
    colorscheme = { "gruvbox" },
  },
  ui = {
    border = "rounded",
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
}
