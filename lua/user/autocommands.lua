-- TODO: convert more vim commands to lua commands
-- NOTE: use :command commandName to inspect the lua source of a vimscript command
local autocmd = vim.api.nvim_create_autocmd

-- local function augroup(name)
--   return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end

-- autocmd("VimEnter", {
--   -- TODO: don't know what augroups do
--   group = vim.api.nvim_create_augroup("autoupdate", { clear = true }),
--   callback = function()
--     if require("lazy.status").has_updates() then
--       require("lazy").update({ show = false, })
--     end
--     -- require("mason.api.command").MasonUpdate()
--     require("mason-registry").refresh()
--     require("nvim-treesitter.install").update({with_sync = false})()
--   end,
-- })


autocmd({ "BufWritePre" }, {
  callback = function()
    vim.cmd [[ %s/\s\+$//e   ]] -- remove trailing whitespace
    vim.cmd [[ %s/\n\+\%$//e ]] -- remove trailing newlines
    vim.cmd [[ retab         ]] -- replace tabs with spaces
  end,
})

autocmd({ "FileType" }, { pattern = { "sh", "nix", "lua" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
})

autocmd({ "BufWinEnter" }, {
  callback = function()
  vim.o.formatoptions = vim.o.formatoptions:gsub('[cro]', '')  -- doesn't work on startup so it needs to be an autocmd
  end,
})

-- TODO: move these to their respective pugins
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
    "tsplayground",
    "notify",
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
    vim.bo.wrap = true
    vim.bo.spell = true
  end,
})
