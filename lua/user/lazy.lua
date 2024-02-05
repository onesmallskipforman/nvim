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
      colorscheme = { "lushwal" },
      -- colorscheme = { "pywal" },
    },
    ui = {
      border = "rounded",
    },
    change_detection = {
      enabled = false,
      notify  = true,
    },
    defaults = {
      lazy = true,
    },
  }

  vim.keymap.set("n", "<leader>pi", "<cmd>Lazy install<cr>", { desc = "Install" })
  vim.keymap.set("n", "<leader>ps", "<cmd>Lazy sync<cr>"   , { desc = "Sync" })
  vim.keymap.set("n", "<leader>pS", "<cmd>Lazy clear<cr>"  , { desc = "Status" })
  vim.keymap.set("n", "<leader>pc", "<cmd>Lazy clean<cr>"  , { desc = "Clean" })
  vim.keymap.set("n", "<leader>pu", "<cmd>Lazy update<cr>" , { desc = "Update" })
  vim.keymap.set("n", "<leader>pp", "<cmd>Lazy profile<cr>", { desc = "Profile" })
  vim.keymap.set("n", "<leader>pl", "<cmd>Lazy log<cr>"    , { desc = "Log" })
  vim.keymap.set("n", "<leader>pd", "<cmd>Lazy debug<cr>"  , { desc = "Debug" })
end

return M
