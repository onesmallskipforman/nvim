-- TODO:  figure out how to change lsp cmd when doing LspRestart so that clangd can use the cwd or current workspace
local M = {
  "neovim/nvim-lspconfig",
}

-- TODO: none of these keys are actually attached to lspconfig. consider moving
M.keys = {
  {"gD", vim.lsp.buf.declaration   , desc = "Goto declaration"           },
  {"gd", vim.lsp.buf.definition    , desc = "Goto definition"            },
  {"K" , vim.lsp.buf.hover         , desc = "Hover documentation"        },
  {"gI", vim.lsp.buf.implementation, desc = "Show implementations"       },
  {"gr", vim.lsp.buf.references    , desc = "Show references"            },
  {"gl", vim.diagnostic.open_float , desc = "Show diagnostic (floating)" },
  {"<leader>li", "<cmd>LspInfo<cr>", desc = "Info"                       },
  -- TODO: figure out where these should go
  -- {"n", "<leader>ls", vim.lsp.buf.signature_help  , desc = "LSP"             },
  -- {"n", "<leader>la", vim.lsp.buf.code_action     , desc = "Code Action"     },
  {"<leader>lf", vim.lsp.buf.format, desc = "Format"                     },
  -- {"n", "<leader>li", "<cmd>LspInfo<cr>"          , desc = "Info"            },
  -- {"n", "<leader>lj", vim.lsp.diagnostic.goto_next, desc = "Next Diagnostic" },
  -- {"n", "<leader>lk", vim.lsp.diagnostic.goto_prev, desc = "Prev Diagnostic" },
  -- {"n", "<leader>ll", vim.lsp.codelens.run        , desc = "CodeLens Action" },
  -- {"n", "<leader>lr", vim.lsp.buf.rename          , desc = "Rename"          },
}

function M.config()
  vim.api.nvim_set_hl(0, "LspReferenceText"  , { link = "CursorLine" })
  vim.api.nvim_set_hl(0, "LspReferenceWrite" , { link = "CursorLine" })
  vim.api.nvim_set_hl(0, "LspReferenceRead"  , { link = "CursorLine" })

  vim.lsp.config('clangd', require('user.lsp.clangd'))
end

return M
