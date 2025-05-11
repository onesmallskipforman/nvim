local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    }
  },
  cmd = "Mason",
}

-- TODO: M.servers vs. local servers ?
M.servers = {
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
}

M.keys = {
  { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" }
}

M.opts = {
  ensure_installed = M.servers,
}

return M
