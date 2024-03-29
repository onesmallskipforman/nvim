local M = {
  "RRethy/vim-illuminate",
  -- commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298",
  -- lazy = false,
  event = { "BufReadPost", "BufNewFile" },
}

function M.init()
  -- TODO: decide whether you want illuminate or lsp doing this
  vim.keymap.set('n', '<M-n>', function() require("illuminate").goto_next_reference{wrap=true} end, { desc = "Next Reference" })
  vim.keymap.set('n', '<M-p>', function() require("illuminate").goto_prev_reference{wrap=true} end, { desc = "Prev Reference" })
end

function M.config()
  require("illuminate").configure {
    delay = 100, -- 300
    under_cursor = true,
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    large_file_cutoff = 5000,
    large_file_overrides = {
      -- disable treesitter in large file for performance
      providers = { "regex" },
    },
    filetypes_denylist = {
      "mason",
      "harpoon",
      "DressingInput",
      "NeogitCommitMessage",
      "qf",
      "dirvish",
      "minifiles",
      "fugitive",
      "alpha",
      "NvimTree",
      "lazy",
      "NeogitStatus",
      "Trouble",
      "netrw",
      "lir",
      "DiffviewFiles",
      "Outline",
      "Jaq",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
    },
  }
end

return M
