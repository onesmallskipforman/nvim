local M = {
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPost", "BufNewFile" },
  -- lazy = false,
  dependencies = {
    require('user.mason'    ),
    require('user.lspconfig'),
  },
}

M.keys = {
  { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" }
}

M.opts = {
  automatic_enable = true,
  ensure_installed = {
    "awk_ls",
    "bashls",
    "clangd",
    "cssls",
    "lua_ls",
    "marksman",
    "matlab_ls",
    "nil_ls",
    "pyright",
    "rust_analyzer",
    "texlab",
    "vimls",
    -- TODO: add formatters and linters
  },
}

return M
