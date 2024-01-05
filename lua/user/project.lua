local M = {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  -- commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
}

function M.config()
  require("project_nvim").setup {
    -- manual_mode = true,
    -- -- detection_methods = { "pattern" },
    -- patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
    -- ignore_lsp = {},
    -- exclude_dirs = {},
    -- show_hidden = false,
    -- silent_chdir = true,
    -- scope_chdir = "global",
  }
end

return M
