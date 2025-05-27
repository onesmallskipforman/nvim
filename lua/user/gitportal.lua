return {
  'trevorhauter/gitportal.nvim',
  cond = false,
  opts = {},
  keys = {
    {
      "<leader>gy",
      function()
        require("gitportal").copy_link_to_clipboard()
        vim.print(vim.fn.getreg("+"))
      end,
      desc = 'Copy File URL',
      mode = {'n', 'v'}
    },
    {
      "<leader>go",
      function()
        require("gitportal").copy_link_to_clipboard()
        require("gitportal").browse_file()
        vim.print(vim.fn.getreg("+"))
      end,
      desc = 'Copy File URL',
      mode = {'n', 'v'}
    },
  },
}
