local M = {
  "williamboman/mason-lspconfig.nvim",
  event = {
    "BufReadPre", -- for opening existing files
    -- TODO: when starting with 'nvim' and opening the start page or alpha,
    -- then editing a new file, BufNewFile is triggered and starts this plugin
    -- as shown in :Lazy, but the lsp itself is not active as shown in :LspInfo
    "BufNewFile", -- for starting new files from nvim command
  },
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
    "hyprls",
    -- TODO: add formatters and linters
  },
}

return M
