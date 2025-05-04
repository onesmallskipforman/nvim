local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
  },
}

local function lsp_keymaps(bufnr)
  local keymap = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts = vim.tbl_extend("keep", opts,
      { noremap = true, silent = true })
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  keymap("n", "gD", vim.lsp.buf.declaration   , { desc = "Goto declaration"           , buffer = bufnr})
  keymap("n", "gd", vim.lsp.buf.definition    , { desc = "Goto definition"            , buffer = bufnr})
  keymap("n", "K" , vim.lsp.buf.hover         , { desc = "Hover documentation"        , buffer = bufnr})
  keymap("n", "gI", vim.lsp.buf.implementation, { desc = "Show implementations"       , buffer = bufnr})
  keymap("n", "gr", vim.lsp.buf.references    , { desc = "Show references"            , buffer = bufnr})
  keymap("n", "gl", vim.diagnostic.open_float , { desc = "Show diagnostic (floating)" , buffer = bufnr})
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

  if client:supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(true, { bufnr })
  end
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
  vim.api.nvim_set_hl(0, "LspReferenceText"  , { link = "CursorLine" })
  vim.api.nvim_set_hl(0, "LspReferenceWrite" , { link = "CursorLine" })
  vim.api.nvim_set_hl(0, "LspReferenceRead"  , { link = "CursorLine" })


  local lspconfig = require "lspconfig"
  local icons = require "user.icons"

  local servers = {
    "lua_ls",
    -- "luau_lsp",
    "cssls",
    "html",
    -- "tsserver",
    "astro",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "marksman",
    -- "tailwindcss",
    "texlab",
    "awk_ls",
    "nil_ls",
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

  -- for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
  --   vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  -- end

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

    lspconfig[server].setup(opts)
    -- vim.lsp.config(server, opts)

  end
end

return M
