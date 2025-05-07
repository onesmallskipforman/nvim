return {
  "f-person/git-blame.nvim",
  opts = { enabled = false },
  keys = {
    -- { "<leader>gl", function() require("gitblame").toggle() end, desc = 'Toggle Blame' },
    { "<leader>gl", "<cmd>GitBlameToggle<cr>", desc = 'Toggle Blame' },
    -- { "<leader>gy", "<cmd>GitBlameCopyCommitURL<cr> <cmd>echo @+<cr>", desc = 'Copy File URL'       , mode = {'n', 'v'} },
    { "<leader>gy", ":exe 'GitBlameCopyFileURL' | :exe 'echo @+' <cr>", desc = 'Copy File URL'       , mode = {'n', 'v'} },
    -- { "<leader>gy", ":exe '!echo -n 123456 | xclip -selection c' | :exe 'echo @+' <cr>", desc = 'Copy File URL'       , mode = {'n', 'v'} },
    { "<leader>gy", "<cmd>GitBlameCopyCommitURL<cr> <cmd>echo @+<cr>", desc = 'Copy File URL'       , mode = {'n', 'v'} },
    {
      "<leader>gy",
      function()
        require('gitblame').copy_file_url_to_clipboard({
          line1 = 1,
          line2 = 2
        })
        vim.cmd.sleep(10)
        vim.notify(vim.fn.getreg(vim.g.gitblame_clipboard_register))
        -- vim.notify(vim.fn.getreg('+'))
        -- vim.print(vim.fn.getreg('+'))
      end,
      desc = 'Copy File URL',
      mode = {'n', 'v'}
    },
    { "<leader>go", "<cmd>GitBlameOpenFileURL<cr>"                            , desc = 'Open URL in Browser' , mode = {'n', 'v'} },
  },
}
