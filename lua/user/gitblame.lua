return {
  "f-person/git-blame.nvim",
  opts = { enabled = false },
  keys = {
    -- { "<leader>gl", function() require("gitblame").toggle() end, desc = 'Toggle Blame' },
    { "<leader>gl", "<cmd>GitBlameToggle<cr>", desc = 'Toggle Blame' },
    -- {
    --   "<leader>gy",
    --   function(...)
    --
    --     current = vim.fn.getreg('+')
    --     require('gitblame').copy_file_url_to_clipboard({})
    --     while vim.fn.getreg('+') == current do
    --       -- vim.print('empty:' .. vim.fn.getreg('+'))
    --     end
    --     vim.print(vim.fn.getreg('+'))
    --
    --     line1 = vim.fn.line("'<")
    --     line2 = vim.fn.line("'>")
    --     -- vim.print(line1 .. ',' .. line2)
    --     -- vim.notify(line2)
    --     -- vim.cmd.sleep(10)
    --     -- vim.notify(vim.fn.getreg(vim.g.gitblame_clipboard_register))
    --     -- vim.notify(vim.fn.getreg('+'))
    --     -- vim.print(vim.fn.getreg('+'))
    --   end,
    --   desc = 'Gitblame: Copy File URL',
    --   mode = {'n', 'v'}
    -- },
    { "<leader>go", "<cmd>GitBlameOpenFileURL<cr>"                            , desc = 'Open URL in Browser' , mode = {'n', 'v'} },
  },
}
