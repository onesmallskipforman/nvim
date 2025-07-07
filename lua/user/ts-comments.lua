-- TODO: consider setting lazy=true and sourcing through treesitter.lua
return {
  "folke/ts-comments.nvim",
  opts = {},
  event = { "BufReadPost", "BufNewFile" },
}
