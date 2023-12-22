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
spec "user.dressing"
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


-- TODO: get NOTE and TODO highlighted again
-- use({'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" } })
-- TOOD: try ctags
