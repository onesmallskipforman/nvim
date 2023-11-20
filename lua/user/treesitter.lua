local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
 commit = "afa103385a2b5ef060596ed822ef63276ae88016",
--  tag = 'v0.9.1',
  build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      event = "VeryLazy",
     commit = "78c49ca7d2f7ccba2115c11422c037713c978ad1",
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
     commit = "92e688f013c69f90c9bbd596019ec10235bc51de",
    },
    {
      "windwp/nvim-ts-autotag",
      event = "VeryLazy",
     commit = "6be1192965df35f94b8ea6d323354f7dc7a557e4",
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
     commit = "f6c71641f6f183427a651c0ce4ba3fb89404fa9e",
    },
  },
}
function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python" }, -- put the language you want in this array
    ignore_install = { "" },
    sync_install = false,
    highlight = {
      enable = true,
      disable = { "markdown" },
      additional_vim_regex_highlighting = false,
    },

    indent = { enable = true },

    matchup = {
      enable = { "astro" },
      disable = { "lua" },
    },

    autotag = { enable = true },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },

    autopairs = { enable = true },

    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["at"] = "@class.outer",
          ["it"] = "@class.inner",
          ["ac"] = "@call.outer",
          ["ic"] = "@call.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["a/"] = "@comment.outer",
          ["i/"] = "@comment.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["as"] = "@statement.outer",
          ["is"] = "@scopename.inner",
          ["aA"] = "@attribute.outer",
          ["iA"] = "@attribute.inner",
          ["aF"] = "@frame.outer",
          ["iF"] = "@frame.inner",
        },
      },
    },
  }

  -- local configs = require "nvim-treesitter.configs"
  --
  -- configs.setup {
  --   -- modules = {
  --   --
  --   --
  --   --   rainbow = {
  --   --     enable = false,
  --   --     query = {
  --   --       "rainbow-parens",
  --   --     },
  --   --     strategy = require("ts-rainbow").strategy.global,
  --   --     hlgroups = {
  --   --       -- "TSRainbowRed",
  --   --       "TSRainbowBlue",
  --   --       -- "TSRainbowOrange",
  --   --       -- "TSRainbowCoral",
  --   --       "TSRainbowPink",
  --   --       "TSRainbowYellow",
  --   --       -- "TSRainbowViolet",
  --   --       -- "TSRainbowGreen",
  --   --     },
  --   --   },
  --   -- },
  -- }
end

return M












-- local status_ok, configs = pcall(require, "nvim-treesitter.configs")
-- if not status_ok then
--   return
-- end
--
-- configs.setup {
--   ensure_installed = "all", -- one of "all", or a list of languages
--   sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
--   ignore_install = { "" }, -- List of parsers to ignore installing
--   autopairs = {
--     enable = true,
--   },
--   highlight = {
--     enable = true, -- false will disable the whole extension
--     disable = { "" }, -- list of language that will be disabled
--     additional_vim_regex_highlighting = true,
--   },
--   indent = { enable = true, disable = { "yaml", "python" } },
--   context_commentstring = {
--     enable = true,
--     enable_autocmd = false,
--   },
--   rainbow = {
--     enable = true,
--     -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
--     extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
--     max_file_lines = nil, -- Do not enable for files with more than n lines, int
--     -- colors = {}, -- table of hex strings
--     -- termcolors = {} -- table of colour name strings
--   },
--  --  playground = {
--   --  enable = true,
--   -- },
-- }
