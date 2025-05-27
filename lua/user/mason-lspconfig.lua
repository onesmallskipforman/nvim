local M = {
  "williamboman/mason-lspconfig.nvim",
  -- event = { "BufReadPost", "BufNewFile" },
  lazy = false,
  dependencies = {
    require('user.mason'    ),
    require('user.lspconfig'),
  },
}

M.keys = {
  { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" }
}

M.opts = {
  automatic_enable = true, -- TODO: try to lazy-enable LSPs based on filetype (multiple spec)
  ensure_installed = {
    "lua_ls",
    "cssls",
    -- "html",
    -- "tsserver",
    "astro",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "marksman",
    -- "tailwindcss",
    "texlab",
    -- "luau_lsp",
    "clangd",
    "awk_ls",
    "rust_analyzer",
  },
}

return M
