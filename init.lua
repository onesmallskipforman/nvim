local LAZY_PLUGIN_SPEC = {}
local function spec(item) table.insert(LAZY_PLUGIN_SPEC, { import = item }) end

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
spec "user.illuminate"
spec "user.indentline"
spec "user.lspconfig"
spec "user.lualine"
spec "user.mason"
spec "user.nvimtree"
spec "user.project"
spec "user.telescope"
spec "user.toggleterm"
spec "user.treesitter"
--
spec "user.whichkey"
-- spec "user.cmd"
require("user.lazy").setup(LAZY_PLUGIN_SPEC)




-- TODO: get NOTE and TODO highlighted again
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
