-- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
-- see https://neovim.io/doc/user/map.html#:map-cmd

local keymap = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_extend("keep", opts,
    { remap = false, silent = true --[[, buffer = true --]] })
  vim.keymap.set(mode, lhs, rhs, opts)
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "; vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "<leader>.", ":e $MYVIMRC<CR>", { desc = "Go to config"})
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Save, close and, exit
keymap("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save" })
keymap("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" })
keymap("n", "<leader>c", "<cmd>bdelete!<CR>", { desc = "Close Buffer" })
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Remove Highlight" })

-- Resize with arrows
keymap("n", "<C-Up>"   , ":resize -2<CR>"         )
keymap("n", "<C-Down>" , ":resize +2<CR>"         )
keymap("n", "<C-Left>" , ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

keymap("n", "<S-l>", ":bnext<CR>"    , {desc = "Next buffer"})
keymap("n", "<S-h>", ":bprevious<CR>", {desc = "Prev buffer"})
keymap("n", "<leader>e", ":Lex 30<cr>", {desc = "Netrw Explorer"})
keymap("n", "<leader>8", ":let &colorcolumn=(empty(&colorcolumn) ? 80 : '')<cr>", {desc = "show 80-char limit"})
keymap("n", "<leader>v", ":vsplit<cr>", {desc = "vsplit"})

-- Press jk fast to enter
keymap("i", "jk", "<ESC>")

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", {desc = "Move text down one line"})
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", {desc = "Move text up one line"})
-- keymap("v", "<A-j>", ":m .+1<CR>==")
-- keymap("v", "<A-k>", ":m .-2<CR>==")
-- keymap("x", "J", ":move '>+1<CR>gv-gv")
-- keymap("x", "K", ":move '<-2<CR>gv-gv")
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- replace currently selected text with default register without yanking it
-- see https://superuser.com/questions/321547/how-do-i-replace-paste-yanked-text-in-vim-without-yanking-the-deleted-lines
keymap("v", "p", '"_dP')
