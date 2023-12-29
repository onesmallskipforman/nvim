local LAZY_PLUGIN_SPEC = {}
local function spec(item) table.insert(LAZY_PLUGIN_SPEC, { import = item }) end

require "user.options"
require "user.keymaps"
require "user.autocommands"
spec "user.alpha"
spec "user.autopairs"
spec "user.bufferline"
spec "user.cmp"
spec "user.colorscheme"
spec "user.comment"
spec "user.devicons"
spec "user.dressing" -- ui improvements
spec "user.gitlinker"
spec "user.gitsigns"
spec "user.gitblame"
spec "user.illuminate"
spec "user.indentline"
spec "user.lspconfig"
spec "user.lualine"
spec "user.mason"
spec "user.nvimtree"
spec "user.project"
spec "user.telescope"
spec "user.todo"
spec "user.toggleterm"
spec "user.treesitter"
--
-- spec "user.whichkey" -- TODO: whichkey NOW
-- spec "user.cmd"

require("user.lazy").setup(LAZY_PLUGIN_SPEC)


-- TODO: get NOTE and TODO highlighted again
-- TODO: I want it to be easier to add a random plugin from within init.lua

-- if you want generic, plugin agnostic maps (ie "leader-e opens file explorer")
-- then you can set up mappings using <Plug> in keymaps.lua and set their
-- functionality within each plugins 'init' block
-- see https://vi.stackexchange.com/questions/31012/what-does-plug-do-in-vim
-- add 'h <Plug>'
