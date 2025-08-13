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
    -- TODO: vim.cmd.substitute
    vim.cmd [[ %s/\s\+$//e   ]] -- remove trailing whitespace
    vim.cmd [[ %s/\n\+\%$//e ]] -- remove trailing newlines
    vim.cmd.retab()             -- replace tabs with spaces
  end,
})

autocmd({ "FileType" }, { pattern = { "sh", "nix", "lua" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop    = 2
  end,
})

-- TODO: move these to their respective pugins
autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "git",
    "help",
    "man",
    "lspinfo",
    "notify",
    "",
  },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<CR>", {silent = true, noremap = true})
    vim.bo.buflisted = false
  end,
})

-- TODO: not sure if i want this
-- suppress command-line window
-- https://www.reddit.com/r/neovim/comments/1i2xw2m/comment/m7iqk71/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd.quit()
  end,
})

autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd.checktime()
  end,
})

-- upon a yank, briefly highlight the yanked text
autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
  end,
})

autocmd({ "FileType" }, { pattern = { "gitcommit" }, -- "markdown"
  callback = function()
    vim.bo.wrap = true
    vim.bo.spell = true
  end,
})

-- NOTE: setting formatoptions doesn't work on startup so it needs to be an autocmd
-- Text behaviour
-- o.formatoptions = o.formatoptions
--                    + 't'    -- auto-wrap text using textwidth
--                    + 'c'    -- auto-wrap comments using textwidth
--                    + 'r'    -- auto insert comment leader on pressing enter
--                    - 'o'    -- don't insert comment leader on pressing o
--                    + 'q'    -- format comments with gq
--                    - 'a'    -- don't autoformat the paragraphs (use some formatter instead)
--                    + 'n'    -- autoformat numbered list
--                    - '2'    -- I am a programmer and not a writer
--                    + 'j'    -- Join comments smartly
-- opt.formatoptions = opt.formatoptions .. 'tcrqnj'
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
  vim.o.formatoptions = vim.o.formatoptions:gsub('[cro]', '')
  end,
})
