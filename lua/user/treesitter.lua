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
    "sxhkdrc",
    "hyprlang",
  }
  require("nvim-treesitter").install(ensure_installed)

  vim.treesitter.language.register("bash", "zsh")
  vim.treesitter.language.register("bash", "sh" )

  -- TODO: consider splitting up native and plugin options into two autocmds
  vim.api.nvim_create_autocmd({'FileType'}, {
    callback = function()
      local lang = vim.treesitter.language.get_lang(vim.bo.filetype) or ''
      if vim.treesitter.language.add(lang) then
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
