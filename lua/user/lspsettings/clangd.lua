
-- local dir = require("project_nvim.project").get_project_root() and require("project_nvim.project").get_project_root() or vim.fn.getcwd()

local util = require 'lspconfig.util'

return {
  cmd = {
    "clangd",
    "--header-insertion=never",
    "--compile-commands-dir=" .. vim.fn.getcwd(),
    "--query-driver=**"
  },
  -- cmd_cwd = vim.fn.getcwd(),
  -- root_dir = vim.fn.getcwd,
  -- root_dir = util.root_pattern('.git'),

  -- settings = {
  --   Lua = {
  --     format = {
  --       enable = false,
  --     },
  --     diagnostics = {
  --       globals = { "vim", "spec" },
  --     },
  --     runtime = {
  --       version = "LuaJIT",
  --       special = {
  --         spec = "require",
  --       },
  --     },
  --     workspace = {
  --       checkThirdParty = false,
  --       library = {
  --         [vim.fn.expand "$VIMRUNTIME/lua"] = true,
  --         [vim.fn.stdpath "config" .. "/lua"] = true,
  --       },
  --       -- maxPreload = 10000,
  --       -- preloadFileSize = 1000,
  --     },
  --     telemetry = {
  --       enable = false,
  --     },
  --   },
  -- },
}
