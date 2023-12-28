local M = {}

function M.setup(lazy_plugin_spec)
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup {
    spec = lazy_plugin_spec,
    install = {
      colorscheme = { "gruvbox" },
    },
    ui = {
      border = "rounded",
    },
    change_detection = {
      enabled = true,
      notify  = true,
    },
    defaults = {
      lazy = true,
    },
  }
end

return M
