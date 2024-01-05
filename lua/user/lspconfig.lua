local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  commit = "e49b1e90c1781ce372013de3fa93a91ea29fc34a",
  dependencies = {
    {
      "folke/neodev.nvim",
      commit = "b094a663ccb71733543d8254b988e6bebdbdaca4",
    },
    {
      "b0o/schemastore.nvim",
    },
  },
  lazy = false
}

local function lsp_keymaps(bufnr)
  local keymap = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts = vim.tbl_extend("keep", opts,
      { noremap = true, silent = true })
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  keymap("n", "gD", function() vim.lsp.buf.declaration()    end, { desc = "Goto declaration"           , buffer = bufnr})
  keymap("n", "gd", function() vim.lsp.buf.definition()     end, { desc = "Goto definition"            , buffer = bufnr})
  keymap("n", "K" , function() vim.lsp.buf.hover()          end, { desc = "Hover documentation"        , buffer = bufnr})
  keymap("n", "gI", function() vim.lsp.buf.implementation() end, { desc = "Show implementations"       , buffer = bufnr})
  keymap("n", "gr", function() vim.lsp.buf.references()     end, { desc = "Show references"            , buffer = bufnr})
  keymap("n", "gl", function() vim.diagnostic.open_float()  end, { desc = "Show diagnostic (floating)" , buffer = bufnr})
  keymap("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" })


  -- TODO: figure out where these should go
  -- keymap(bufnr, "n", "<leader>ls", function() vim.lsp.buf.signature_help() end, { desc = "LSP" })
  -- keymap(bufnr, "n", "<leader>la", function() vim.lsp.buf.code_action() end, { desc = "Code Action" })
  -- keymap(bufnr, "n", "<leader>lf", function() vim.lsp.buf.format() end, { desc = "Format" })
  -- keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" })
  -- keymap(bufnr, "n", "<leader>lj", function() vim.lsp.diagnostic.goto_next() end, { desc = "Next Diagnostic" })
  -- keymap(bufnr, "n", "<leader>lk", function() vim.lsp.diagnostic.goto_prev() end, { desc = "Prev Diagnostic" })
  -- keymap(bufnr, "n", "<leader>ll", function() vim.lsp.codelens.run() end, { desc = "CodeLens Action" })
  -- keymap(bufnr, "n", "<leader>lr", function() vim.lsp.buf.rename() end, { desc = "Rename" })


end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  client.server_capabilities.semanticTokensProvider = nil
end

function M.common_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    -- return vim.tbl_deep_extend("force",
    --   vim.lsp.protocol.make_client_capabilities(),
    --   require('cmp_nvim_lsp').default_capabilities()
    -- )
    return cmp_nvim_lsp.default_capabilities()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  return capabilities
end

function M.config()


  local lspconfig = require "lspconfig"
  local icons = require "user.icons"

  local servers = {
    "lua_ls",
    -- "luau_lsp",
    "cssls",
    "html",
    "tsserver",
    "astro",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "marksman",
    -- "tailwindcss",
    "texlab",
    "awk_ls",
    "clangd",
  }

  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }
    -- opts.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

    local require_ok, settings = pcall(require, "user.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup {}
    end

    lspconfig[server].setup(opts)
  end
end

return M
