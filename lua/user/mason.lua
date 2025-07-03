return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      border = "rounded",
    },
  },
  lazy = false, -- https://github.com/mason-org/mason.nvim?tab=readme-ov-file#installation--usage
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonLog",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonUpdate",
  },
}
