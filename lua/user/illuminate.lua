local M = {
  "RRethy/vim-illuminate",
  -- commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298",
  lazy = false,
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  vim.keymap.set('n', '<M-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { desc = "Next LSP Reference" })
  vim.keymap.set('n', '<M-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', { desc = "Previous LSP Reference" })
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
      -- providers = { "lsp" },
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

  -- make sure vim-illuminate highlighting is aligned with lsp highlighting
  vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "LspReferenceText" })
  vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "LspReferenceText" })
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "LspReferenceText" })
end

return M
