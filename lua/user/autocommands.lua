local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWritePre" }, {
  callback = function()
    vim.cmd [[ %s/\s\+$//e   ]] -- remove trailing whitespace
    vim.cmd [[ %s/\n\+\%$//e ]] -- remove trailing newlines
    vim.cmd [[ retab         ]] -- replace tabs with spaces
  end,
})

autocmd({ "FileType" }, { pattern = { "lua" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

autocmd({ "FileType" }, { pattern = { "sh" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro" -- doesn't work on startup so it needs to be an autocmd
  end,
})

autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
  end,
})

autocmd({ "FileType" }, { pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
