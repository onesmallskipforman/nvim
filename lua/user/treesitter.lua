local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- "windwp/nvim-ts-autotag",
    -- "windwp/nvim-autopairs",
  },
}
function M.init()
  vim.keymap.set("n", "<leader>Ti", "<cmd>TSConfigInfo<cr>", { desc = "Info" })
end

function M.config()

  vim.g.skip_ts_context_commentstring_module = true


  require("nvim-treesitter.configs").setup {
    ensure_installed = {
      -- put the language you want in this array, can also say "all"
      "lua",
      "vim",
      "markdown",
      "markdown_inline",
      "bash",
      "python",
    },
    ignore_install = {},
    sync_install = false,
    highlight = {
      enable = true,
      disable = { "markdown" },
      additional_vim_regex_highlighting = false,
    },

    indent = { enable = true }, -- disable = { "yaml", "python" } }

    -- matchup = {
    --   enable = { "astro" },
    --   disable = { "lua" },
    -- },

    -- autotag = { enable = true },
    --
    -- autopairs = { enable = true },
    --
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

end

return M
