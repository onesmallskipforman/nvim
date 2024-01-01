return {
  "f-person/git-blame.nvim",
  -- event = "VeryLazy",
  lazy = false,
  opts = { enabled = false },
  init = function ()
    -- vim.keymap.set("n", "<leader>gl", "<cmd>GitBlameToggle<cr>", { desc = 'Toggle Blame' })
    vim.keymap.set("n", "<leader>gl", function () require("gitblame").toggle() end, { desc = 'Toggle Blame' })
  end
}
