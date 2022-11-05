local M = {}

M.keymap = function(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("keep", opts,
    { remap = false, silent = true --[[, buffer = true --]] })
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
