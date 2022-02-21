local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
-- see https://neovim.io/doc/user/map.html#:map-cmd
keymap("n", "<leader>/", "<cmd>lua require(\"Comment.api\").toggle_current_linewise()<CR>", opts)
keymap("v", "<leader>/", "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)


keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

keymap("n", "<leader>F", "<cmd>Telescope live_grep teme=ivy<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", opts)