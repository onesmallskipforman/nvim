return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    name = "gruvbox",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
              },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "soft", -- can be "hard", "soft" or empty string
            overrides = {}
        })
        -- load the colorscheme here
        vim.cmd.colorscheme("gruvbox")
        -- NOTE: This theme links vim-illuminate groups to lspreference groups
        -- vim.api.nvim_set_hl(0, "LspReferenceText" , { bg='#504945', underline = true })
        -- vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg='#504945', underline = true })
        -- vim.api.nvim_set_hl(0, "LspReferenceRead" , { bg='#504945', underline = true })
        vim.api.nvim_set_hl(0, "LspReferenceText" , { link="CursorLine" })
        vim.api.nvim_set_hl(0, "LspReferenceWrite", { link="CursorLine" })
        vim.api.nvim_set_hl(0, "LspReferenceRead" , { link="CursorLine" })

        vim.api.nvim_set_hl(0, "NvimTreeNormal" , { bg=require("bufferline.config").highlights.fill.bg })
        vim.api.nvim_set_hl(0, "NvimTreeOffset" , {
            fg=string.format("#%06x", vim.api.nvim_get_hl_by_name("TabLine", true)["background"]),
            bg=require("bufferline.config").highlights.fill.bg,
        })
        vim.api.nvim_set_hl(0, "SignColumn" , { link="Normal" })
        -- vim.api.nvim_set_hl(0, "NvimTreeWinSeparator" , {
        --     -- fg=string.format("#%06x", vim.api.nvim_get_hl_by_name("TabLine", true)["background"]),
        --     fg=require("bufferline.config").highlights.fill.bg,
        --     bg=require("bufferline.config").highlights.fill.bg,
        -- })
    end,
  },
  { "lunarvim/colorschemes" }, -- Multiple colorschemes to try out
  { "lunarvim/darkplus.nvim" }, -- Colorscheme
}
