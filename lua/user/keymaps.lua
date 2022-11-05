local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- remove search highlight
keymap("", "<S-_>", ":nohlsearch<CR>", {noremap = true, silent = false})

-- Tree --
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- use arrow keys in command mode completions
-- set wildcharm=<C-Z>
-- cnoremap <expr> <up>    wildmenumode() ? "\<left>"     : "\<up>"
-- cnoremap <expr> <down>  wildmenumode() ? "\<right>"    : "\<down>"
-- cnoremap <expr> <left>  wildmenumode() ? "\<up>"       : "\<left>"
-- cnoremap <expr> <right> wildmenumode() ? "\<bs>\<C-Z>" : "\<right>"

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- vim.cmd [[let mapleader =" "]]
-- vim.cmd [[nnoremap <silent> <leader>. :e $MYVIMRC<CR>]]

-- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
-- see https://neovim.io/doc/user/map.html#:map-cmd


local keymap = require("user.functions").keymap

keymap("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save" })
keymap("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" })
keymap("n", "<leader>c", "<cmd>Bdelete!<CR>", { desc = "Close Buffer" })
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No Highlight" })
keymap("n", "<leader>P", "<cmd>Telescope projects<cr>", { desc = "Projects" })

if pcall(require, "lspconfig") then
  keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
  keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", { desc = "Format" })
  keymap("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" })
  keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", { desc = "Installer Info" })
  keymap("n", "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic" })
  keymap("n", "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", { desc = "Prev Diagnostic" })
  keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "CodeLens Action" })
  keymap("n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", { desc = "Quickfix" })
  keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
end

if pcall(require, "telescope") and pcall(require, "lspconfig") then
  keymap("n", "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>", { desc = "Document Diagnostics" })
  keymap("n", "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", { desc = "Workspace Diagnostics" })
  keymap("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
  keymap("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace Symbols" })
end


if pcall(require, "telescope") then
  keymap("n", "<leader>F", "<cmd>Telescope live_grep<cr>", { desc = 'Live Grep' })
  keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = 'Find Files' })
  keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })

  keymap("n", "<leader>sb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout branch"  })
  keymap("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>" , { desc = "Colorscheme"      })
  keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>"   , { desc = "Find Help"        })
  keymap("n", "<leader>sM", "<cmd>Telescope man_pages<cr>"   , { desc = "Man Pages"        })
  keymap("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>"    , { desc = "Open Recent File" })
  keymap("n", "<leader>sR", "<cmd>Telescope registers<cr>"   , { desc = "Registers"        })
  keymap("n", "<leader>sk", "<cmd>Telescope keymaps<cr>"     , { desc = "Keymaps"          })
  keymap("n", "<leader>sC", "<cmd>Telescope commands<cr>"    , { desc = "Commands"         })

  keymap("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Open changed file" })
  keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout branch" })
  keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Checkout commit" })
end

if pcall(require, "alpha") then
  keymap("n", "<leader>a", "<cmd>Alpha<cr>", { desc = 'Alpha' })
end

if pcall(require, "Comment") then
  keymap("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = 'Comment out current line' })
  keymap("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = 'Comment out visual-selected text' })
end

if pcall(require, "gitlinker") then
  keymap("n", "<leader>gy", "<cmd>lua require'gitlinker'.get_buf_range_url('n')<cr>", { desc = 'gitlinker' })
end

if pcall(require, "gitsigns") then
  keymap("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", { desc = "Next Hunk" })
  keymap("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", { desc = "Prev Hunk" })
  keymap("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame" })
  keymap("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Preview Hunk" })
  keymap("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Reset Hunk" })
  keymap("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", { desc = "Reset Buffer" })
  keymap("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Stage Hunk" })
  keymap("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", { desc = "Undo Stage Hunk" })
  keymap("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", { desc = "Diff" })
end


if pcall(require, "illuminate") then
  keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { desc = "Next LSP Reference" })
  keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', { desc = "Previous LSP Reference" })
end

if pcall(require, "nvim-tree") then
  keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = 'Toggle NvimTree'})
end


if pcall(require, "packer") then
  keymap("n", "<leader>pc", "<cmd>PackerCompile<cr>", { desc = "Compile" })
  keymap("n", "<leader>pi", "<cmd>PackerInstall<cr>", { desc = "Install" })
  keymap("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "Sync" })
  keymap("n", "<leader>pS", "<cmd>PackerStatus<cr>", { desc = "Status" })
  keymap("n", "<leader>pu", "<cmd>PackerUpdate<cr>", { desc = "Update" })
end
