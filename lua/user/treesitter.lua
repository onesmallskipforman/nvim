local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  branch = 'main',
  build = ':TSUpdate',
}

M.config = function(_, opts)
  require("nvim-treesitter").setup(opts)
  local ensure_installed = {
    -- put the language you want in this array, can also say "all"
    "awk",
    "bash",
    "c", "cpp",
    "css",
    "lua", "luadoc",
    "markdown", "markdown_inline",
    "matlab",
    "nix",
    "python", "requirements",
    "rust",
    "latex", "bibtex",
    "vim", "vimdoc",
  }
  require("nvim-treesitter").install(ensure_installed)

  vim.treesitter.language.register("bash", "zsh")

  -- TODO: consider splitting up native and plugin options into two autocmds
  vim.api.nvim_create_autocmd({'FileType'}, {
    -- TODO: either use ensure_installed pattern or if statement
    -- pattern = ensure_installed,
    callback = function()
      if vim.treesitter.language.add(vim.bo.filetype) then
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- folds, provided by Neovim
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
        -- only if additional legacy syntax is needed
        -- vim.bo.syntax = 'on'
      end
    end
  })
end

M.opts = {}

return M
