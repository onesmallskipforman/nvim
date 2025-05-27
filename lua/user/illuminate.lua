local M = {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
}

M.keys = {
  -- TODO: decide whether you want illuminate or lsp doing this
  { '<C-n>'  , function() require("illuminate").goto_next_reference{wrap=true} end, desc = "Next Reference" },
  { '<C-S-N>', function() require("illuminate").goto_prev_reference{wrap=true} end, desc = "Prev Reference" },
}

function M.init()
end

M.opts = {
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
  },
}

function M.config(_, opts)
  -- NOTE: This theme links vim-illuminate groups to lspreference groups
  -- make sure vim-illuminate highlighting is aligned with lsp highlighting

  require("illuminate").configure(opts)
  vim.api.nvim_set_hl(0, "LspReferenceText"    , { link = "CursorLine" })
  vim.api.nvim_set_hl(0, "LspReferenceWrite"   , { link = "CursorLine" })
  vim.api.nvim_set_hl(0, "LspReferenceRead"    , { link = "CursorLine" })
  vim.api.nvim_set_hl(0, "IlluminatedWordText" , { link = "LspReferenceText" })
  vim.api.nvim_set_hl(0, "IlluminatedWordRead" , { link = "LspReferenceRead" })
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "LspReferenceWrite" })
end

return M
