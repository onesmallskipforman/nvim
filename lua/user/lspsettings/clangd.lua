-- local dir = require("project_nvim.project").get_project_root() and require("project_nvim.project").get_project_root() or vim.fn.getcwd()
-- local util = require 'lspconfig.util'

function get_workspace_path()
    local workspaces = require 'workspaces'
    local saved_workspaces = workspaces.get()

    local current_workspace = workspaces.name()
    if current_workspace == nil then
        return
    end

    for _, workspace in ipairs(saved_workspaces) do
        if current_workspace == workspace.name then
            local path = workspace.path
            -- Check for trailing slash since lspconfig stores root dir without slash
            if path:sub(-1, -1) == '/' then
                path = path:sub(1, -2)
            end
            return path
        end
    end
end

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
  -- root_dir = function(fname)
  --   return get_workspace_path() or require('lspconfig.server_configurations.clangd').default_config.root_dir(fname)
  --   -- return require('lspconfig.server_configurations.clangd').default_config.root_dir(fname) or vim.fn.getcwd()
  --   -- return vim.fn.getcwd()
  -- end,
}
