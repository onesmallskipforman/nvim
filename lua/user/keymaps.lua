-- NOTE: Prefer using : over <cmd>. see :h map-cmd

-- local function km (mode, prefix, opts)
--   opts = opts or {}
--   opts = vim.tbl_extend("keep", opts, { noremap = true, silent = true, buffer = true })
--   prefix = prefix or ""
--
--   return function (lhs, rhs, desc)
--     opts = vim.tbl_extend("keep", opts, { desc = desc })
--     vim.keymap.set(mode, prefix..lhs, rhs, opts)
--   end
-- end
--
-- local opts = {
--   -- mode = "n", -- NORMAL mode
--   -- prefix = "<leader>",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap  = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }

-- local nmap = km("n", opts)
-- local vmap = km("v", opts)

local keymap = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_extend("keep", opts,
    { noremap = true, silent = true, buffer = nil })
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- TOOD: keymap function

--
-- local keymap = function(mode, lhs, rhs, desc)
--   if desc then opts = vim.tbl_extend("keep", opts, { desc = desc }) end
--   vim.keymap.set(mode, lhs, rhs, opts)
-- end


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
keymap("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" }) -- { "<cmd>confirm q<CR>", "Quit" }
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

-- tab controls
keymap("n", "<leader>ta", "<cmd>$tabnew<cr>", { desc = "New Empty Tab" })
keymap("n", "<leader>tA", "<cmd>tabnew %<cr>", { desc = "New Tab" })
keymap("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Next" })
keymap("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Only" })
keymap("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Prev" })
keymap("n", "<leader>th", "<cmd>-tabmove<cr>", { desc = "Move Left" })
keymap("n", "<leader>tl", "<cmd>+tabmove<cr>", { desc = "Move Right" })

-- LSP
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action (Normal)" })
keymap("v", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action (Visual)" })
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({timeout_ms = 1000000})<cr>", { desc = "Format" })
keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "CodeLens Action" })
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next Diagnostic" })
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Prev Diagnostic" })
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", { desc = "Quickfix" })

-- local mappings = {
--   p = {name = "Plugins"},
--   b = {name = "Buffers"},
--   f = {name = "Find"},
--   s = {name = "Search"},
--   g = {name = "Git"},
--   l = {name = "LSP"},
--   s = {name = "Search"},
--   t = {name = "Terminal"},
--   d = {name = "Debug"},
--   t = {name = "Tab"},
--   T = {name = "Treesitter"},
-- }
